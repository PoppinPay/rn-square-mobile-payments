//
//  Mappers.swift
//  rn-square-mobile-payments
//
//  Created by Zac Demi on 6/12/24.
//
import SquareMobilePaymentsSDK

class Mappers {

  class func mapFromReadCardInfoError(_ error:ReadCardInfoError) -> String {
    switch error {
      case .cardError: return "cardError"
      case .notAuthorized: return "notAuthorized"
      case .readerError: return "readerError"
      case .storeError: return "storeError"
      case .unsupportedEntryMethod: return "unsupportedEntryMethod"
      default: return "unknown"
    }
  }

  class func mapFromCardHandle(_ handle:CardHandle) -> NSDictionary {
    return [
      "brand": mapFromCardBrand(handle.brand),
      "cardholderName": handle.cardholderName ?? NSNull(),
      "entryMethod": mapFromCardEntryMethod(handle.entryMethod),
      "id": handle.id,
      "isSwipedCardStored": handle.isSwipedCardStored,
      "last4": handle.last4 ?? NSNull()
    ]
  }

  class func mapFromCardBrand(_ brand:CardBrand) -> String {
      switch brand {
      case .americanExpress: return "americanExpress"
      case .chinaUnionPay: return "chinaUnionPay"
      case .discover: return "discover"
      case .discoverDiners: return "discoverDiners"
      case .ebt: return "ebt"
      case .eftpos: return "eftpos"
      case .felica: return "felica"
      case .interac: return "interac"
      case .jcb: return "jcb"
      case .mastercard: return "mastercard"
      case .otherBrand: return "otherBrand"
      case .squareCapitalCard: return "squareCapitalCard"
      case .squareGiftCard: return "squareGiftCard"
      case .visa: return "visa"
      default: return "unknown"
    }
  }

  class func mapFromCardEntryMethod(_ entryMethod:CardEntryMethod) -> String {
    switch entryMethod {
    case .contactless: return "contactless"
    case .emv: return "emv"
    case .keyed: return "keyed"
    case .onFile: return "onFile"
    case .swiped: return "swiped"
    default: return "unknown"
    }
  }

  class func mapFromReader(_ readerInfo: ReaderInfo) -> NSDictionary {
    return [
      "id": readerInfo.id,
      "model": mapFromModel(readerInfo.model),
      "state": mapFromState(readerInfo.state),
      "serialNumber": readerInfo.serialNumber ?? "",
      "name": readerInfo.name,
      "batteryStatus": readerInfo.batteryStatus != nil ? mapFromBatteryStatus(readerInfo.batteryStatus!): NSNull(),
      "isForgettable": readerInfo.isForgettable,
      "isBlinkable": readerInfo.isBlinkable,
      "firmwareInfo": readerInfo.firmwareInfo != nil ? mapFromFirmwareInfo(readerInfo.firmwareInfo!): NSNull()
    ]
  }

  class func mapFromBatteryStatus(_ batteryStatus: ReaderBatteryStatus) -> NSDictionary {
    return [
      "isCharging": batteryStatus.isCharging,
      "level": mapFromBatteryLevel(batteryStatus.level),
      "percentage": batteryStatus.percentage,
    ]
  }

  class func mapFromBatteryLevel(_ batteryLevel: ReaderBatteryLevel) -> String {
      switch batteryLevel {
      case ReaderBatteryLevel.criticallyLow: return "criticallyLow"
      case ReaderBatteryLevel.full: return "full"
      case ReaderBatteryLevel.high: return "high"
      case ReaderBatteryLevel.low: return "low"
      case ReaderBatteryLevel.mid: return "mid"
      default: return "unknown"
      }
  }

  class func mapFromFirmwareInfo(_ firmwareInfo: ReaderFirmwareInfo) -> NSDictionary {
    return [
      "failureReason": firmwareInfo.failureReason as Any,
      "updatePercentage": firmwareInfo.updatePercentage,
      "version": firmwareInfo.version
    ]
  }

  class func mapFromModel(_ model: ReaderModel) -> String {
      switch model {
      case ReaderModel.contactlessAndChip: return "contactlessAndChip"
      case ReaderModel.embedded: return "embedded"
      case ReaderModel.magstripe: return "magstripe"
      case ReaderModel.stand: return "stand"
      case ReaderModel.unknown: return "unknown"
      default: return "unknown"
      }
  }

  class func mapFromState(_ state: ReaderState) -> String {
      switch state {
      case ReaderState.connecting: return "connecting"
      case ReaderState.disabled: return "disabled"
      case ReaderState.disconnected: return "disconnected"
      case ReaderState.failedToConnect: return "failedToConnect"
      case ReaderState.ready: return "ready"
      case ReaderState.updatingFirmware: return "updatingFirmware"
      default: return "unknown"
      }
  }

  class func mapFromChange(_ change: ReaderChange) -> String {
      switch change {
      case .batteryDidBeginCharging: return "batteryDidBeginCharging"
      case .batteryDidEndCharging: return "batteryDidEndCharging"
      case .batteryLevelDidChange: return "batteryLevelDidChange"
      case .cardInserted: return "cardInserted"
      case .cardRemoved: return "cardRemoved"
      case .connectionDidFail: return "connectionDidFail"
      case .connectionStateDidChange: return "connectionStateDidChange"
      case .firmwareUpdateDidFail: return "firmwareUpdateDidFail"
      case .firmwareUpdatePercentDidChange: return "firmwareUpdatePercentDidChange"
      case .stateDidChange: return "stateDidChange"
      default: return "unknown state change"
    }
  }

  class func mapFromPaymentSourceType(_ sourceType: SourceType) -> String {
    switch sourceType {
    case .unknown:
      return "unknown"
    case .card:
      return "card"
    case .cash:
      return "cash"
    case .external:
      return "external"
    case .wallet:
      return "wallet"
    case .bankAccount:
      return "bankAccount"
    case .squareAccount:
      return "squareAccount"
    @unknown default:
      return "unknown"
    }
  }

  class func mapFromPayment(_ payment: Payment) -> NSDictionary {
    let isoDateFormatter = ISO8601DateFormatter()
    return [
      "id": payment.id ?? NSNull(),
      "createdAt": isoDateFormatter.string(from: payment.createdAt),
      "updatedAt": isoDateFormatter.string(from: payment.updatedAt),
      "amountMoney": payment.amountMoney.amount,
      "currency": payment.amountMoney.currency.currencyCode,
      "tipMoney": payment.tipMoney?.amount ?? 0,
      "appFeeMoney": payment.appFeeMoney?.amount ?? 0,
      "totalMoney": payment.totalMoney.amount,
      "locationId": payment.locationID ?? NSNull(),
      "orderId": payment.orderID ?? NSNull(),
      "referenceId": payment.referenceID ?? NSNull(),
      "sourceType": mapFromPaymentSourceType(payment.sourceType)
    ]
  }

  class func mapFromAuthorizationState(_ state: AuthorizationState) -> String {
      switch state {
      case .authorized: return "authorized"
      case .authorizing: return "authorizing"
      case .notAuthorized: return "notAuthorized"
      @unknown default: return "unknown"
      }
  }

  class func mapFromLocation(_ location: Location) -> NSDictionary {
    return [
      "currency": location.currency.currencyCode,
      "id": location.id,
      "mcc": location.mcc,
      "name": location.name
    ]
  }

}

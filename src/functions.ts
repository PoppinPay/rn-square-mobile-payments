import type {
  ReaderInfo,
  ReaderLocation,
  SquarePayment,
  SquarePaymentParams,
} from './types';
import type { AuthorizationState } from './enums';
import SquareMobilePayments from './module';

export const authorizeMobilePaymentsSdk = (
  accessToken: string,
  locationId: string
): Promise<string> => {
  return SquareMobilePayments.authorizeMobilePaymentsSDK(
    accessToken,
    locationId
  );
};

export const deauthorizeMobilePaymentsSdk = (): Promise<string> => {
  return SquareMobilePayments.deauthorizeMobilePaymentsSDK();
};

export const startPairing = (): Promise<string> => {
  return SquareMobilePayments.startPairing();
};

export const stopPairing = (): Promise<string> => {
  return SquareMobilePayments.stopPairing();
};

export const startPayment = (
  paymentParams: SquarePaymentParams
): Promise<SquarePayment> => {
  return SquareMobilePayments.startPayment(paymentParams);
};

export const cancelPayment = (): Promise<void> => {
  return SquareMobilePayments.cancelPayment();
};

export const addReadCardInfoObserver = (): Promise<void> => {
  console.log('Running addReadCardInfoObserver');
  return SquareMobilePayments.addReadCardInfoObserver();
};

export const removeReadCardInfoObserver = (): Promise<void> => {
  return SquareMobilePayments.removeReadCardInfoObserver();
};

export const prepareToReadCardInfoOnce = (
  storeSwipedCard: boolean,
  shouldReadPreInsertedCard: boolean
): Promise<string> => {
  return SquareMobilePayments.SquareMobilePayments(
    storeSwipedCard,
    shouldReadPreInsertedCard
  );
};

export const addReaderObserver = (): Promise<void> => {
  console.log('Running addreader observer');
  return SquareMobilePayments.addReaderObserver();
};

export const removeReaderObserver = (): Promise<void> => {
  return SquareMobilePayments.removeReaderObserver();
};

export const presentSettings = (): Promise<void> => {
  return SquareMobilePayments.presentSettings();
};

export const getReaders = (): Promise<ReaderInfo[]> => {
  return SquareMobilePayments.getReaders();
};

export const getAuthorizationState = (): Promise<AuthorizationState> => {
  return SquareMobilePayments.getAuthorizationState();
};

export const getAuthorizationLocation = (): Promise<ReaderLocation> => {
  return SquareMobilePayments.getAuthorizationLocation();
};

export const forgetReader = (readerId: string): Promise<string> => {
  return SquareMobilePayments.forgetReader(readerId);
};

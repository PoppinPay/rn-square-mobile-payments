import { NativeEventEmitter } from 'react-native';
import { useEffect, useRef } from 'react';
import {
  addReaderObserver,
  removeReaderObserver,
  addReadCardInfoObserver,
  removeReadCardInfoObserver,
} from './functions';
import type { ReadCardInfoEventType, ReaderEventType } from './enums';
import type {
  ISquareEventListener,
  ISquareReadCardInfoEventListener,
} from './types';
import SquareMobilePayments from './module';

export const eventEmitter = new NativeEventEmitter(SquareMobilePayments);

const useSquareEventListener: ISquareEventListener = (
  event: ReaderEventType,
  callback: (...args: any[]) => void
) => {
  const callbackRef = useRef(callback);
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);

  useEffect(() => {
    addReaderObserver();

    const subscription = eventEmitter.addListener(event, (...args) => {
      if (callbackRef.current) {
        callbackRef.current(...args);
      }
    });

    return () => {
      subscription.remove();
      removeReaderObserver();
    };
  }, [event]);
};

const useSquareReadCardInfoEventListener: ISquareReadCardInfoEventListener = (
  event: ReadCardInfoEventType,
  callback: (...args: any[]) => void
) => {
  const callbackRef = useRef(callback);
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);

  useEffect(() => {
    addReadCardInfoObserver();

    const subscription = eventEmitter.addListener(event, (...args) => {
      if (callbackRef.current) {
        callbackRef.current(...args);
      }
    });

    return () => {
      subscription.remove();
      removeReadCardInfoObserver();
    };
  }, [event]);
};

export { useSquareEventListener, useSquareReadCardInfoEventListener };

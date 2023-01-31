import { DEFAULT_DEBOUNCE } from "./constant";

export const debounce = (callback: Function, delay = DEFAULT_DEBOUNCE) => {
  let timeoutId: number | undefined = undefined;
  return () => {
    window.clearTimeout(timeoutId);
    timeoutId = window.setTimeout(() => {
      callback.apply(null);
    }, delay);
  };
};
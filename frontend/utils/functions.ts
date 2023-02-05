import { g_characters } from "@prisma/client";
import { CustomCharacter } from "../types/User";
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

export const createNewCharacter = (
  accountId: number,
  name: string
): CustomCharacter => {
  const char: CustomCharacter = {
    account_id: accountId,
    name,
    max_hp: "75",
    current_hp: "75",
    gold: "1000",
    point: 0,
    location: 1,
    lvl: "1",
    created_at: new Date(),
    updated_at: new Date(),
    created_by_id: null,
    updated_by_id: null,
    exp: "0",
    atk: 0,
    def: 0,
    dex: 0,
  };

  return char;
};

import { g_characters } from "@prisma/client";

export type User = {
  given_name?: string;
  family_name?: string;
  nickname?: string;
  name?: string;
  picture?: string;
  locale?: string;
  updated_at?: string;
  sub?: string;
  sid?: string;
};

export type CustomCharacter = Omit<g_characters, "id">;

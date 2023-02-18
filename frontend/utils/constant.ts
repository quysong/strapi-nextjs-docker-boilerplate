export const DEFAULT_DEBOUNCE = 300;
export const DEFAULT_FORMULAS = {
  EXP_TO_LEVEL:
    "Math.floor((Math.sqrt({BASE_EXP}*(2*{CURRENT_EXP}+{BASE_EXP}/4))+({BASE_EXP}/2))/{BASE_EXP})",
  GOLD_GET_BY_LEVEL:
    "Math.floor(({MIN_GOLD}+Math.random()*({MAX_GOLD} - {MIN_GOLD}))*({LEVEL}+{BASE_GOLD}))",
  LEVEL_TO_EXP: "({LEVEL}*{LEVEL} + {LEVEL})/2*{BASE_EXP}-({LEVEL}*{BASE_EXP})",
  HP_BY_LEVEL: "({LEVEL}-1)*5 + {BASE_HP}"
};

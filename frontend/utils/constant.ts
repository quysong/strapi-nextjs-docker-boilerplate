export const DEFAULT_DEBOUNCE = 300;
export const DEFAULT_FORMULAS = {
  EXP_TO_LEVEL:
    "Math.floor((Math.sqrt({BASE_EXP}*(2*{CURRENT_EXP}+{BASE_EXP}/4))+({BASE_EXP}/2))/{BASE_EXP})",
  GOLD_GET_BY_LEVEL:
    "Math.floor((1.3+Math.random()*(2 - 1.3))*({LEVEL}+{BASE_GOLD}))",
  LEVEL_TO_EXP: "({LEVEL}*{LEVEL} + {LEVEL})/2*{BASE_EXP}-({LEVEL}*{BASE_EXP})",
  HP_BY_LEVEL: "({LEVEL}-1)*5 + {BASE_HP}"
};

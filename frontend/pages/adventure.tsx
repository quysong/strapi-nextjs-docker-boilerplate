import React, { useEffect, useState } from "react";
import { withPageAuthRequired, getSession, Session } from "@auth0/nextjs-auth0";
import axios from "axios";
import { debounce } from "../utils/functions";
import { g_characters, g_travel_logs, PrismaClient } from "@prisma/client";
import { User } from "../types/User";
import Head from "next/head";
import format from "string-template";
import { DEFAULT_FORMULAS } from "../utils/constant";

const prisma = new PrismaClient();

type AdventureProps = {
  session: Session;
  character: g_characters;
};

export default function Adventure({ session, character }: AdventureProps) {
  const user = session.user as User;
  console.log("user", user);
  const [latestAdventureLog, setLatestAdventureLog] = useState<
    g_travel_logs | undefined
  >(undefined);
  const [currentCharacter, setCurrentCharacter] = useState<g_characters | any>(
    character
  );

  if (!user.sub) return null;

  // useEffect(() => {
  //   if(!latestAdventureLog) {
  //     setLatestAdventureLog(currentCharacter)
  //   }
  // }, [latestAdventureLog])

  const doAdventure = debounce(async () => {
    const body = {
      id: character.id,
    };
    const resp = await axios({
      url: "api/travels",
      method: "POST",
      data: body,
    });

    const data = resp.data.data.create_travel_log as g_travel_logs;
    const updatedCharacter = resp.data.data.character as g_characters;
    setCurrentCharacter(updatedCharacter);

    setLatestAdventureLog(data);
    console.log("data", data);
  });

  const onClick = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
    e.preventDefault();
    doAdventure();
  };

  const BASE_EXP = 50;
  const CURRENT_EXP = currentCharacter.exp;
  const BASE_GOLD = 4;

  const calcExp = () => {
    const formulaString = DEFAULT_FORMULAS.EXP_TO_LEVEL;
    const formulaEmbeddedParams = format(formulaString, { BASE_EXP, CURRENT_EXP })
    console.log('formulaEmbeddedParams', formulaEmbeddedParams)
    const rs = eval(formulaEmbeddedParams);
    return rs;
  };

  const calcGoldGetByLevel = (lvl: string) => {
    const formulaString = DEFAULT_FORMULAS.GOLD_GET_BY_LEVEL;
    const formulaEmbeddedParams = format(formulaString, { LEVEL: lvl, BASE_GOLD, MIN_GOLD: "1.3", MAX_GOLD: "2" })
    console.log('formulaEmbeddedParams', formulaEmbeddedParams)
    const rs = eval(formulaEmbeddedParams);
    return rs;
  };

  const calcExpByLevel = (lvl: string) => {
    const formulaString = DEFAULT_FORMULAS.LEVEL_TO_EXP;
    const formulaEmbeddedParams = format(formulaString, { LEVEL: lvl, BASE_EXP })
    console.log('formulaEmbeddedParams', formulaEmbeddedParams)
    const rs = eval(formulaEmbeddedParams);
    return rs;
  };

  const getSummaryInfo = () => {
    let char = currentCharacter as g_characters;
    const level = calcExp();
    const expCurrentLevel = calcExpByLevel(`${Number(level)}`);
    const expNextLevel = calcExpByLevel(`${Number(level) + 1}`);
    const currentExp = Number(char.exp) - Number(expCurrentLevel);
    const rangeExp = expNextLevel - expCurrentLevel;
    const percentageExp = (currentExp/rangeExp * 100).toFixed(2);
    console.log('rangeExp', rangeExp)
    console.log('calcGoldGetByLevel(5)', calcGoldGetByLevel("50"))
    console.log('percentageExp', percentageExp)
    return {
      level,
      gold: char.gold,
      exp: char.exp,
      hp: char.max_hp,
      currentHp: char.current_hp,
      percent: `${percentageExp}%`
    };
  };

  return (
    <>
      <Head>
        <script src="https://cdn.tailwindcss.com"></script>
      </Head>
      <p>DO ADVENTURE</p>
      <h1 className="text-3xl font-bold underline">
        Hello world!
      </h1>
      <br />
      <div className="flex flex-row justify-evenly">
        <div className="character-info">
          <p>General character information:</p>
          {Object.keys(currentCharacter).map((property, index) => {
            return (
              <div key={`char-info-${index}`}>
                <span>
                  {property}: {currentCharacter[property]}
                </span>
              </div>
            );
          })}
        </div>
        <div className="character-info summary-info">
          <p>Summary information:</p>
          <div>
            <span>Level: {getSummaryInfo().level}</span>
          </div>
          <div>
            <span>Gold: {getSummaryInfo().gold}</span>
          </div>
          <div>
            <span>Exp: {getSummaryInfo().exp}</span>
          </div>
          <div>
            <span>Max Hp: {getSummaryInfo().hp}</span>
          </div>
          <div>
            <span>Current Hp: {getSummaryInfo().currentHp}</span>
          </div>
          <div>
            <span>Exp: {getSummaryInfo().percent}</span>
          </div>
        </div>
      </div>

      <br />
      <button className="py-2 px-4 bg-green-500 text-white rounded-lg shadow-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-400 focus:ring-opacity-75" onClick={onClick}>Take a step</button>
      <br />
      latestAdventureLog:
      <br />
      {latestAdventureLog && JSON.stringify(latestAdventureLog)}
    </>
  );
}

export const getServerSideProps = withPageAuthRequired({
  async getServerSideProps(ctx) {
    // Example get session before return client side on a page
    const session = await getSession(ctx.req, ctx.res);
    const sub = session?.user.sub;

    // Get account info
    const acc = await prisma.g_accounts.findFirst({
      where: {
        sub,
      },
    });

    // Get char info
    const character = await prisma.g_characters.findFirst({
      where: {
        account_id: acc?.id,
      },
    });

    const formulaExpToLvl = await prisma.g_formulas.findFirst({
      where: {
        name_formula: "EXP_TO_LEVEL",
      }
    })

    const formulaGoldGetByLvl = await prisma.g_formulas.findFirst({
      where: {
        name_formula: "GOLD_GET_BY_LEVEL",
      }
    })

    return {
      props: {
        customProp: "customProp",
        session: JSON.parse(JSON.stringify(session)),
        character: JSON.parse(JSON.stringify(character)),
      },
    };
  },
});

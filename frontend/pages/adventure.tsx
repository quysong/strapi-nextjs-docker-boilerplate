import React, { useRef, useState } from "react";
import { withPageAuthRequired, getSession, Session } from "@auth0/nextjs-auth0";
import axios from "axios";
import { debounce } from "../utils/functions";
import { g_characters, g_travel_logs, PrismaClient } from "@prisma/client";
import { User } from "../types/User";
import format from "string-template";
import { DEFAULT_FORMULAS } from "../utils/constant";
import { Col, Row } from "reactstrap";
import Button from "antd/lib/button";
import styled from "styled-components";

const RolloutBlock = styled.div`
  @keyframes flash {
    0% {
      opacity: 0;
    }
    100% {
      opacity: 1;
    }
  }

  .roll-out {
    animation: flash 0.4s;
  }
`;

const RowInfo = ({ title, value }: { title: string, value: any }) => {
  return (
    <div>
      <div style={{ display: "flex" }}>
        {title}:&nbsp;
        <div className={`roll-out`}>
          {value}
        </div>
      </div>
    </div>
  );
};

const prisma = new PrismaClient();

interface SummaryInfoType {
  level: any;
  gold: string | null;
  exp: string | null;
  hp: string | null;
  currentHp: string | null;
  percent: string;
}

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
  const [btnLoading, setBtnLoading] = useState(false);

  if (!user.sub) return null;

  const doAdventure = debounce(async () => {
    const body = {
      id: character.id,
    };
    setBtnLoading(true);
    const resp = await axios({
      url: "api/travels",
      method: "POST",
      data: body,
    });
    setBtnLoading(false);

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
    const formulaEmbeddedParams = format(formulaString, {
      BASE_EXP,
      CURRENT_EXP,
    });
    console.log("formulaEmbeddedParams", formulaEmbeddedParams);
    const rs = eval(formulaEmbeddedParams);
    return rs;
  };

  const calcGoldGetByLevel = (lvl: string) => {
    const formulaString = DEFAULT_FORMULAS.GOLD_GET_BY_LEVEL;
    const formulaEmbeddedParams = format(formulaString, {
      LEVEL: lvl,
      BASE_GOLD,
      MIN_GOLD: "1.3",
      MAX_GOLD: "2",
    });
    console.log("formulaEmbeddedParams", formulaEmbeddedParams);
    const rs = eval(formulaEmbeddedParams);
    return rs;
  };

  const calcExpByLevel = (lvl: string) => {
    const formulaString = DEFAULT_FORMULAS.LEVEL_TO_EXP;
    const formulaEmbeddedParams = format(formulaString, {
      LEVEL: lvl,
      BASE_EXP,
    });
    console.log("formulaEmbeddedParams", formulaEmbeddedParams);
    const rs = eval(formulaEmbeddedParams);
    return rs;
  };

  const getSummaryInfo = (): SummaryInfoType => {
    let char = currentCharacter as g_characters;
    const level = calcExp();
    const expCurrentLevel = calcExpByLevel(`${Number(level)}`);
    const expNextLevel = calcExpByLevel(`${Number(level) + 1}`);
    const currentExp = Number(char.exp) - Number(expCurrentLevel);
    const rangeExp = expNextLevel - expCurrentLevel;
    const percentageExp = ((currentExp / rangeExp) * 100).toFixed(2);
    console.log("rangeExp", rangeExp);
    console.log("calcGoldGetByLevel(5)", calcGoldGetByLevel("50"));
    console.log("percentageExp", percentageExp);
    return {
      level,
      gold: char.gold,
      exp: char.exp,
      hp: char.max_hp,
      currentHp: char.current_hp,
      percent: `${percentageExp}%`,
    };
  };

  return (
    <>
      <p>DO ADVENTURE</p>
      <Row xs="2">
        <Col className="bg-light border">
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
        </Col>
        <Col className="bg-light border">
          <RolloutBlock className="character-info summary-info">
            <p>Summary information:</p>
            <RowInfo key={`gold-${getSummaryInfo().level}`} title="Level" value={getSummaryInfo().level}/>
            <RowInfo key={`gold-${getSummaryInfo().gold}`} title="Gold" value={getSummaryInfo().gold}/>
            <RowInfo key={`exp-${getSummaryInfo().exp}`} title="Exp" value={getSummaryInfo().exp}/>
            <RowInfo key={`hp-${getSummaryInfo().hp}`} title="Hp" value={getSummaryInfo().hp}/>
            <RowInfo key={`current-hp-${getSummaryInfo().currentHp}`} title="Current Hp" value={getSummaryInfo().currentHp}/>
            <RowInfo key={`percent-${getSummaryInfo().percent}`} title="Percent" value={getSummaryInfo().percent}/>
          </RolloutBlock>
        </Col>
      </Row>
      <br />
      <i className="fa-sharp fa-solid fa-person-to-portal"></i>
      <Button loading={btnLoading} onClick={onClick}>
        Take a step 
      </Button>
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
      },
    });

    const formulaGoldGetByLvl = await prisma.g_formulas.findFirst({
      where: {
        name_formula: "GOLD_GET_BY_LEVEL",
      },
    });

    return {
      props: {
        customProp: "customProp",
        session: JSON.parse(JSON.stringify(session)),
        character: JSON.parse(JSON.stringify(character)),
      },
    };
  },
});

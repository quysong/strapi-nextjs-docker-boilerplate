import React, {useState} from "react";
import { withPageAuthRequired, getSession, Session } from "@auth0/nextjs-auth0";
import axios from "axios";
import { debounce } from "../utils/functions";
import { g_characters, g_travel_logs, PrismaClient } from "@prisma/client";
import { User } from "../types/User";

const prisma = new PrismaClient();

type AdventureProps = {
  session: Session;
  character: g_characters;
};

export default function Adventure({ session, character }: AdventureProps) {
  const user = session.user as User;
  console.log("user", user);
  const [latestAdventureLog, setLatestAdventureLog] = useState<g_travel_logs | undefined>(undefined)
  const [currentCharacter, setCurrentCharacter] = useState(character)

  if (!user.sub) return null;

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

    setLatestAdventureLog(data)
    console.log("data", data);
  });

  const onClick = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
    e.preventDefault();
    doAdventure();
  };

  return (
    <>
      <p>DO ADVENTURE</p>
      <br />
      {JSON.stringify(currentCharacter)}
      <br />
      <br />
      latestAdventureLog:
      <br />
      {latestAdventureLog && JSON.stringify(latestAdventureLog)}
      <br />
      <button onClick={onClick}>Take a step</button>
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
    return {
      props: {
        customProp: "customProp",
        session: JSON.parse(JSON.stringify(session)),
        character: JSON.parse(JSON.stringify(character)),
      },
    };
  },
});

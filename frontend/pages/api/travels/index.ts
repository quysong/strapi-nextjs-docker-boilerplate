import { NextApiRequest, NextApiResponse } from "next";
import { PrismaClient } from "@prisma/client";
import { withApiAuthRequired, getSession } from '@auth0/nextjs-auth0'

const prisma = new PrismaClient();

async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  const session = await getSession(req, res)
  console.log('session', session)

  switch (req.method) {
    case "POST": {
      let data = { ...req.body };
      let g_text = await prisma.g_travel_texts.findMany();
      let rand_index = Math.floor(0 + Math.random() * ((g_text.length - 1) - 0));
      let wait_time = Math.floor(2000 + Math.random() * (7000 - 2000));
      let character = await prisma.g_characters.findUnique({
        where: { id: data.id },
      });
      if (character != null) {
        let reward_gold = Math.floor(
          (2 + Math.random() * (2 - 1.3)) * (Number(character.lvl) + 4)
        );
        let reward_exp = Math.floor(
          (Number(character.lvl) * 100) / (16 + Math.random() * (16 - 14))
        );
        let create_travel_log = await prisma.g_travel_logs.create({
          data: {
            text: g_text[rand_index].content,
            heading: "take your next step",
            wait_length: wait_time,
            step_type: "text",
            char_id: data.id,
            travel_background: "xxxxx/xxx/xxx.png",
            reward_exp: reward_exp,
            reward_gold: reward_gold,
          },
        });
        // character.gold = (Number(character.gold)+reward_gold).toString();
        // character.current_exp = (Number(character.current_exp)+reward_exp).toString();

        // await prisma.g_characters.update({where:{id:data.id},data:character})
        res.json({ mess: "OK", data: create_travel_log });
      } else {
        res.json({ mess: "Invalid", data: {} });
      }
      break;
    }
  }
}

export default withApiAuthRequired(handler)

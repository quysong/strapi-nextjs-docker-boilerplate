import { NextApiRequest, NextApiResponse } from "next";
import { g_travel_texts, g_travel_logs, PrismaClient } from "@prisma/client";
import { randomInRange, randomRate } from "../../../utils/RandomRate";
import { withApiAuthRequired, getSession } from '@auth0/nextjs-auth0'
import { stepType } from "../../../enums/steptype";
const prisma = new PrismaClient();

async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  switch (req.method) {
    case "POST": {
      let data = { ...req.body };
      
      let character = await prisma.g_characters.findUnique({
        where: { id: data.id },
      });
      if (character != null) {
        let g_conf = await prisma.g_configurations.findMany();
        let g_text = await prisma.g_travel_texts.findMany();
        let rand_index = Math.floor(randomInRange(0,g_text.length-1));
        let wait_time = Math.floor(randomInRange(Number(g_conf.find(x=>x.name == "wait_time_min")?.value_str),Number(g_conf.find(x=>x.name == "wait_time_max")?.value_str)));
        let reward_gold:number= 0;
        let reward_exp:number = 0;

        switch (randomRate([70,5,11,14])){
          case stepType.text:{
            break;
          }
          case stepType.npc:{
            break;
          }
          case stepType.item:{
            break;
          }
          case stepType.material:{
            break;
          }
        }


        switch (randomInRange(1,4)){
          case 1:{
            reward_gold = Math.floor(
              randomInRange(Number(g_conf.find(x=>x.name == "reward_gold_min")?.value_str),Number(g_conf.find(x=>x.name == "reward_gold_max")?.value_str)) * (Number(character.lvl) + Number(g_conf.find(x=>x.name == "monster_extra_gold")?.value_str))
            );
            break;
          }
          case 2:{
            reward_exp = Math.floor(
              (Number(character.lvl) * 100) / randomInRange(Number(g_conf.find(x=>x.name == "reward_exp_min")?.value_str),Number(g_conf.find(x=>x.name == "reward_exp_max")?.value_str))
            );
            break;
          }
          case 3:{
            reward_gold = Math.floor(
              randomInRange(Number(g_conf.find(x=>x.name == "reward_gold_min")?.value_str),Number(g_conf.find(x=>x.name == "reward_gold_max")?.value_str)) * (Number(character.lvl) + Number(g_conf.find(x=>x.name == "monster_extra_gold")?.value_str))
            );
            reward_exp = Math.floor(
              (Number(character.lvl) * 100) / randomInRange(Number(g_conf.find(x=>x.name == "reward_exp_min")?.value_str),Number(g_conf.find(x=>x.name == "reward_exp_max")?.value_str))
            );
            break;
          }
        }
        
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
            created_at: new Date(),
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

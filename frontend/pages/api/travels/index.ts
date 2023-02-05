import { NextApiRequest, NextApiResponse } from "next";
import {
  g_travel_texts,
  g_travel_logs,
  PrismaClient,
  g_characters,
} from "@prisma/client";
import { randomInRange, randomRate } from "../../../utils/RandomRate";
import { withApiAuthRequired, getSession } from "@auth0/nextjs-auth0";
import { stepType } from "../../../enums/steptype";
const prisma = new PrismaClient();

async function handler(req: NextApiRequest, res: NextApiResponse) {
  switch (req.method) {
    case "POST": {
      let data = { ...req.body };
      const { id } = data;
      const session = await getSession(req, res);
      console.log("travels handler session", session);

      let character = await prisma.g_characters.findUnique({
        where: {
          id
        }
      })

      if (!character) return res.json({ mess: "User not found", data: {} });

      if (character != null) {
        let g_conf = await prisma.g_configurations.findMany();
        let g_text = await prisma.g_travel_texts.findMany();
        let rand_index = Math.floor(randomInRange(0, g_text.length - 1));
        let wait_time = Math.floor(
          randomInRange(
            Number(g_conf.find((x) => x.name == "wait_time_min")?.value_str),
            Number(g_conf.find((x) => x.name == "wait_time_max")?.value_str)
          )
        );
        let reward_gold: number = 0;
        let reward_exp: number = 0;

        const rate = randomRate([70, 5, 11, 14]);
        console.log('adventure rate', rate)
        switch (rate) {
          case stepType.text: {
            const reward_gold_min = Number(
              g_conf.find((x) => x.name == "reward_gold_min")?.value_str
            );
            const reward_gold_max = Number(
              g_conf.find((x) => x.name == "reward_gold_max")?.value_str
            );
            const reward_exp_min = Number(
              g_conf.find((x) => x.name == "reward_exp_min")?.value_str
            );
            const reward_exp_max = Number(
              g_conf.find((x) => x.name == "reward_exp_max")?.value_str
            );
            const monster_extra_gold = Number(
              g_conf.find((x) => x.name == "monster_extra_gold")?.value_str
            );
            const randomInRage = randomInRange(1, 4, true);
            console.log('randomInRage', randomInRage)
            switch (randomInRage) {
              case 1: {
                reward_gold = Math.floor(
                  randomInRange(reward_gold_min, reward_gold_max) *
                    (Number(character.lvl) + monster_extra_gold)
                );
                break;
              }
              case 2: {
                reward_exp = Math.floor(
                  (Number(character.lvl) * 100) /
                    randomInRange(reward_exp_min, reward_exp_max)
                );
                break;
              }
              case 3: {
                reward_gold = Math.floor(
                  randomInRange(reward_gold_min, reward_gold_max) *
                    (Number(character.lvl) + monster_extra_gold)
                );
                reward_exp = Math.floor(
                  (Number(character.lvl) * 100) /
                    randomInRange(reward_exp_min, reward_exp_max)
                );
                break;
              }
            }
            break;
          }
          case stepType.npc: {
            switch (randomInRange(1, 2)) {
              //monster
              case 1: {
                break;
              }
              //player
              case 2: {
                break;
              }
            }
            break;
          }
          case stepType.item: {
            break;
          }
          case stepType.material: {
            //example for test
            let lstMaterial = [
              { name: "iron", rate_percent: 25 },
              { name: "bronez", rate_percent: 25 },
              { name: "mirthil", rate_percent: 25 },
              { name: "adaminate", rate_percent: 25 },
            ];
            let indexOfMaterial = randomRate([
              lstMaterial[0].rate_percent,
              lstMaterial[1].rate_percent,
              lstMaterial[2].rate_percent,
              lstMaterial[3].rate_percent,
            ]);
            break;
          }
        }

        let create_travel_log = await prisma.g_travel_logs.create({
          data: {
            text: g_text[rand_index].content,
            heading: "take your next step",
            wait_length: wait_time,
            step_type: "text",
            char_id: id,
            travel_background: "xxxxx/xxx/xxx.png",
            reward_exp: reward_exp,
            reward_gold: reward_gold,
            created_at: new Date(),
          },
        });

        character.gold = (Number(character.gold) + reward_gold).toString();
        character.exp = (Number(character.exp) + reward_exp).toString();

        await prisma.g_characters.update({
          where: { id: id },
          data: character,
        });
        res.json({ mess: "OK", data: {
          create_travel_log,
          character
        }});
      } else {
        res.json({ mess: "Invalid", data: {} });
      }
      break;
    }
  }
}

export default withApiAuthRequired(handler);

import {
  handleAuth,
  handleLogin,
  handleCallback,
  Session,
} from "@auth0/nextjs-auth0";
import { PrismaClient } from "@prisma/client";
import { User } from "../../../types/User";
import { createNewCharacter } from "../../../utils/functions";

const prisma = new PrismaClient();

const afterCallback = async (
  req: any,
  res: any,
  session: Session,
  state: any
) => {
  try {
    console.log("afterCallback req", req);
    console.log("afterCallback res", res);
    console.log("afterCallback session", session);
    console.log("afterCallback state", state);

    // unique id for each account
    // register with password with same email will be different from login with gmail
    const user = session.user as User;
    const sub = user.sub;
    if (!sub) return session;

    //// If database has an exist character with this sub, update field updated_at like last time login
    const foundAccount = await prisma.g_accounts.findFirst({
      where: {
        sub,
      },
    });

    const currentDate = new Date();

    if (foundAccount) {
      foundAccount.updated_at = currentDate;
      const { id, ...rest } = foundAccount;
      prisma.g_accounts.update({
        where: {
          id,
        },
        data: {
          ...rest,
        },
      });
    } else {
      const latestAccount = await prisma.g_accounts.findFirst({
        orderBy: [
          {
            id: "desc",
          },
        ],
        take: 1,
      });
      let newAccountId = 1;
      if(latestAccount) {
        newAccountId = latestAccount.id + 1
      }

      const account = await prisma.g_accounts.create({
        data: {
          user_name: user.nickname,
          is_member: false,
          created_at: currentDate,
          updated_at: currentDate,
          meta_data: JSON.stringify(user),
          sub,
        },
      });
      const unix = Date.now();
      const newCharName = `user ${unix}`;

      const newChar = createNewCharacter(account.id, newCharName);
      await prisma.g_characters.create({
        data: newChar,
      });
    }

    // Else, add new record to save information
    console.log("sub", sub);
    return session;
  } catch (error) {
    console.log("error", error);
    return session;
  }
};

export default handleAuth({
  async login(req, res) {
    try {
      // Pass in custom params to your handler
      await handleLogin(req, res, {
        authorizationParams: { customParam: "foo" },
      });
      // Add your own custom logging.
    } catch (error: any) {
      // Add you own custom error logging.
      res.status(error.status || 500).end();
    }
  },
  async callback(req, res) {
    try {
      // Pass in custom params to your handler
      await handleCallback(req, res, { afterCallback });
      // Add your own custom logging.
    } catch (error: any) {
      // Add you own custom error logging.
      res.status(error.status || 500).end();
    }
  },
});

import { handleAuth, handleLogin, handleCallback, getSession } from "@auth0/nextjs-auth0";

const afterCallback = (req:any , res:any , session:any , state:any ) => {
  console.log('afterCallback req', req)
  console.log('afterCallback res', res)
  console.log('afterCallback session', session)
  console.log('afterCallback state', state)
  return session;
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

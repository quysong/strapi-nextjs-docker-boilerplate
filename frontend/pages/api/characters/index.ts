import { NextApiRequest, NextApiResponse } from "next";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  console.log("req", req.method);
  switch (req.method) {
    case "POST": {
      console.log("POST");
      res.status(200).json({ name: "character" });
      break;
    }
    case "GET": {
      console.log("GET");
      res.status(200).json({ name: "character" });
      break;
    }
    case "PUT": {
      console.log("PUT");
      res.status(200).json({ name: "character" });
      break;
    }
    case "DELETE": {
      console.log("DELETE");
      res.status(200).json({ name: "character" });
      break;
    }

    default:
      break;
  }
  // res.status(200).json({ name: 'character' })
}

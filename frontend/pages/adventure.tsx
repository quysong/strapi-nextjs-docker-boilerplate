import React from 'react';
import { withPageAuthRequired, getSession } from '@auth0/nextjs-auth0';
import axios from "axios"
import { debounce } from '../utils/functions';
import { g_travel_logs } from '@prisma/client';

type AdventureProps = {

}

export default function Adventure(props: AdventureProps) {
  console.log('props', props)
  const doAdventure = debounce(async () => {
    const mockBody = {
      id: 1
    }
    const resp = await axios({
      url: "api/travels",
      method: "POST",
      data: mockBody,
    })

    const data = resp.data.data as g_travel_logs;
    console.log('data', data)
  })

  const onClick = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
    e.preventDefault();
    doAdventure();
  }

  return (
    <>
      <p>DO ADVENTURE</p>
      <button onClick={onClick}>Take a step</button>
    </>
  );
}

export const getServerSideProps = withPageAuthRequired({
  async getServerSideProps(ctx) {
    // Example get session before return client side on a page
    const session = await getSession(ctx.req, ctx.res);
    return {
      props: {
        customProp: 'customProp',
        session: JSON.parse(JSON.stringify(session)),
      }
    };
  }
});

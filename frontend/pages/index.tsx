import type { NextPage } from "next";
import Head from "next/head";

const Home: NextPage = () => {
  return (
    <div>
      <Head>
        <title>Demo</title>
        <meta name="description" content="This app demonstrates" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main>
        <p>
          This app is for demo
        </p>
      </main>
    </div>
  );
};

export default Home;

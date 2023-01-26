import type { NextPage } from "next";
import { useEffect } from "react";
import { g_characters, PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// Client-side
const Home: NextPage = (props) => {
  console.log('props', props)

  // Component did mount
  useEffect(() => {
    fetchData();
  }, [])

  const fetchData = async () => {
    const data = await fetch('https://jsonplaceholder.typicode.com/todos/1')
    console.log('data', data)
  }

  return (
    <div>
      <main>
        <p>
          This app is for Home
          {JSON.stringify(props)}
        </p>
      </main>
    </div>
  );
};

// Server-side
export async function getServerSideProps() {
  // Fetch data from external API
  // const res = await fetch(`https://.../data`)
  const character = await prisma.g_characters.findFirst() as g_characters;
  const characterResp = {
    ...character,
    created_at: character.created_at?.toISOString(),
    updated_at: character.updated_at?.toISOString()
  }

  const data = {
    f1: 1234
  }

  // Pass data to the page via props
  return { props: { data, character: characterResp } }
}

export default Home;

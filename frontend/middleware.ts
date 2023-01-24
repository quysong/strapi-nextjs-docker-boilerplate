import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  const dateString = new Date().toISOString();
  console.log(`[${dateString}] - middleware - `, {
    method: request.method,
    url: request.url,
  });
  return NextResponse.next();
}

FROM node:14.20.0 AS deps
WORKDIR /app
COPY ./frontend/package.json /app/
COPY ./frontend/ /app/

RUN yarn install

FROM node:14.20.0 AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/prisma ./prisma
COPY --from=deps /app/package.json ./package.json
COPY ./frontend/ .

RUN npx prisma generate
RUN yarn build


# Production image, copy all the files and run next
FROM node:14.20.0 AS runner
WORKDIR /app

ENV NODE_ENV production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# COPY --from=builder /app/public ./public
COPY --from=builder /app/prisma ./prisma

COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3005

ENV PORT 3005

ENTRYPOINT ["/bin/sh", "-c", "npx prisma db push --skip-generate  --accept-data-loss && node server.js" ]

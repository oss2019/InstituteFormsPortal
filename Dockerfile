FROM node:18-alpine AS dependencies

RUN apk add --no-cache libc6-compat
WORKDIR /home/proj
COPY package.json ./
RUN  npm install --production


FROM node:18-alpine AS builder

WORKDIR /home/proj
COPY --from=dependencies /home/proj/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED 1
ARG DATABASE_URL
ENV DATABASE_URL=”${DATABASE_URL}”

RUN npm run build


FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /home/proj/.next ./.next
COPY --from=builder /home/proj/node_modules ./node_modules
COPY --from=builder /home/proj/package.json ./package.json

USER nextjs
EXPOSE 3000
ENV PORT 3000

CMD ["npm", "start"]
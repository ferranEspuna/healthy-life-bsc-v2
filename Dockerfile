FROM node:lts-alpine3.18 AS build

RUN apk update && apk upgrade && adduser -D svelteuser

RUN npm install -g pnpm

USER svelteuser

WORKDIR /app

COPY --chown=svelteuser:svelteuser . /app

RUN pnpm install --frozen-lockfile
RUN pnpm run build
RUN pnpm prune --production


FROM node:lts-alpine3.18
RUN apk update --no-cache && apk upgrade --no-cache && adduser -D svelteuser

USER svelteuser

WORKDIR /app

COPY --chown=svelteuser:svelteuser --from=build /app/build build/
COPY --chown=svelteuser:svelteuser --from=build /app/node_modules node_modules/
COPY --chown=svelteuser:svelteuser --from=build /app/package.json package.json

EXPOSE 8080
ENV HOST=0.0.0.0 PORT=8080 NODE_ENV=production

CMD [ "node", "build" ]

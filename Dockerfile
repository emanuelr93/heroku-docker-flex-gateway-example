FROM b4fun/dockerize-ubuntu as dockerize
FROM mulesoft/flex-gateway:1.0.0

ENV S6_READ_ONLY_ROOT=1 \
  FLEX_RTM_ARM_AGENT_CONFIG=/tmp/platform.conf

WORKDIR /app
ENTRYPOINT [ ]
CMD [ "/init" ]

COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/

COPY rootfs/ /
COPY config/ /usr/local/share/mulesoft/flex-gateway/conf.d

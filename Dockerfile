FROM b4fun/dockerize-ubuntu as dockerize
FROM mulesoft/flex-gateway:1.5.3

ENV S6_READ_ONLY_ROOT=1 \
  FLEX_RTM_ARM_AGENT_CONFIG=/tmp/platform.conf

WORKDIR /app
USER 0
ENTRYPOINT []
CMD [ "/init" ]

COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/

COPY rootfs/ /
COPY config/ /usr/local/share/mulesoft/flex-gateway/conf.d

RUN chmod -R +x /etc/services.d
RUN chmod -R +x /etc/cont-init.d

FROM tindy2013/subconverter:latest

WORKDIR /base

COPY pref.toml /base/pref.toml
COPY entrypoint.sh /entrypoint.sh

USER root
RUN chmod +x /entrypoint.sh \
    && sed -i 's/\r$//' /entrypoint.sh /base/pref.toml

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

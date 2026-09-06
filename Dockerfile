FROM tindy2013/subconverter:latest

USER root
WORKDIR /base

COPY pref.ini /base/pref.ini
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && sed -i 's/\r$//' /entrypoint.sh /base/pref.ini \
    && rm -f /base/pref.toml /base/pref.yml

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

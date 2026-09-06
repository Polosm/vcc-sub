FROM tindy2013/subconverter:latest

COPY pref.ini /base/pref.ini

RUN rm -f /base/pref.toml /base/pref.yml

EXPOSE 25500

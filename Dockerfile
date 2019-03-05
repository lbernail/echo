FROM python:slim

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

COPY src /src/
WORKDIR src
RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["gunicorn", "app:app"]

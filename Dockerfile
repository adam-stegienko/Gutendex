FROM python:3.9
WORKDIR /src/app/
COPY . .
RUN apt-get update && apt-get install -y openssh-server rsync
RUN pip install -r ./requirements.txt
RUN rm -rf ./reverse_proxy
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["bash", "entrypoint.sh"]
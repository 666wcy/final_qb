FROM ubuntu


COPY root /
RUN apt-get update
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get install sudo -y

RUN apt-get install nginx -y

COPY /nginx.conf /etc/nginx/




RUN sudo apt-get update
RUN apt-get install wget -y
RUN apt-get install git -y
RUN apt install tzdata -y

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN sudo apt-get install python3-distutils -y
RUN sudo apt install python3-pip -y

RUN pip3 install pyTelegramBotAPI
RUN pip3 install qbittorrent-api
RUN pip3 install apscheduler

RUN sudo chmod 777 /main
RUN mv /main /usr/bin/

RUN sudo chmod 777 /rclone
RUN mv /rclone /usr/bin/
RUN mkdir /config
RUN mkdir /downloads
RUN sudo chown 0777 -R /config
RUN sudo chown 0777 -R /downloads

CMD wget https://raw.githubusercontent.com/666wcy/final_q6/main/start.sh  && chmod 0777 start.sh && bash start.sh


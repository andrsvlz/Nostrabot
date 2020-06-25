# Base image
from ubuntu:trusty
# Setup env
ENV DEBIAN_FRONTEND noninteractive
# Install requirements
RUN apt-get update && apt-get install -y software-properties-common && \
        apt-get install -y python-pip libffi-dev python-dev libssl-dev wget \
        supervisor unzip curl jq ssh expect
# Get flask-ask
RUN wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
RUN tar -xvf Python-3.6.3.tgz
RUN cd Python-3.6.3 && ls
RUN cd Python-3.6.3 && ./configure --enable-optimizations
RUN cd Python-3.6.3 && make -j8
RUN cd Python-3.6.3 && make install
RUN pip3 install Werkzeug==0.11.15
#RUN pip install pip==9.0.3
RUN pip3 install 'cryptography<2.2'
RUN pip3 install flask-ask
# Get ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
        -O /tmp/ngrok.zip && cd /tmp && unzip ngrok.zip && install -m 755 \
        ngrok /usr/local/bin
# Copy resources
COPY src/* /opt/alexa/
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# Add alexa user
RUN useradd -m alexa -d /opt/alexa && chown alexa:alexa -R /opt/alexa
RUN chmod +x /opt/alexa/*.sh
# Ports to expose
EXPOSE 4040
EXPOSE 5000
# here we go
#
RUN chmod +x /opt/alexa/alexa.py 
#run echo "/usr/bin/nohup python3.6 /opt/alexa/alexa.py &" > tmp.sh
#CMD /bin/bash tmp.sh
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

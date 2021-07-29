FROM alpine

EXPOSE 22

RUN adduser --system -s /bin/bash git

RUN apk add --no-cache openssh
COPY ./sshd_config /etc/ssh/
COPY ./start.sh /usr/bin/
RUN chown git -R /home/git /etc/ssh
RUN chown git -R /home/git /usr/bin/
USER git
# Default is to run the OpenSSH server
CMD ["/usr/bin/start.sh"]
FROM fedora
RUN dnf install -y node npm libsecret-devel && \
    dnf clean all
RUN npm install twilio-cli -g
#can't install this globally
RUN npm install keytar
ADD start.sh /start.sh
RUN chmod a+x /start.sh
# a little helper script in case we want to add any more setup
ENTRYPOINT [ "/start.sh" ]
FROM codercom/code-server

COPY run.sh /run.sh
EXPOSE 8888
ENTRYPOINT ["/run.sh"]

FROM  bcgovimages/von-image:node-1.12-4 
USER root
RUN apt-get update && apt-get upgrade -y && apt-get install -y jq
RUN mkdir /var/log/indy 
RUN mkdir /var/lib/indy 
RUN mkdir /etc/indy/
RUN chown indy:indy -R /var/lib/indy && chown indy:indy -R  /var/log/indy && chown indy:indy -R /etc/indy/

USER indy
RUN touch /var/log/indy/validator-info.log
RUN touch /etc/indy/indy_config.py
RUN chmod -R 777 /var/lib/indy && chmod -R 777 /var/log/indy && chmod -R 777 /etc/indy/
CMD ["sh", "-c", "start_indy_node node 0.0.0.0 9701 0.0.0.0 9702"]

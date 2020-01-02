
FROM docker.artifacts.tamkeen.cloud/erp/erp-base-saas

ARG ODOO_USER=odoo
ARG ODOO_HOME=/home/$ODOO_USER
ARG ODOO_SERVER_DIR=$ODOO_HOME/server

COPY odoo-server.conf /etc/
RUN chown odoo /etc/odoo-server.conf
ENV ODOO_CONF /etc/odoo-server.conf

COPY entrypoint.sh /
RUN chown odoo /entrypoint.sh \
     && chmod +x /entrypoint.sh

EXPOSE 8069 8071
RUN ln -s $ODOO_SERVER_DIR/odoo-bin /usr/bin/odoo

#RUN chown odoo:odoo -R $ODOO_SERVER_DIR
 
# USER odoo

COPY ./addons-* ${ODOO_HOME}/addons-all/
RUN chown -R odoo:odoo ${ODOO_HOME}/addons-all \
      && chmod 777 -R ${ODOO_HOME}/addons-all/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
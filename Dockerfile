FROM ibmcom/ace-server:11.0.0.9-r3-20200724-030239-amd64
ENV LICENSE accept
COPY AccountsDemo /home/aceuser/AccountsDemo
COPY AccountsDemoLib /home/aceuser/AccountsDemoLib
COPY BalanceSvc /home/aceuser/BalanceSvc
COPY BalanceSvcLib /home/aceuser/BalanceSvcLib
COPY CardManagement /home/aceuser/CardManagement
RUN mkdir /home/aceuser/bars
RUN source /opt/ibm/ace-11/server/bin/mqsiprofile
RUN /opt/ibm/ace-11/server/bin/mqsipackagebar -a bars/AccountsDemo.bar -k AccountsDemo BalanceSvc CardManagement -y AccountsDemoLib BalanceSvcLib
RUN ace_compile_bars.sh
RUN chmod -R 777 /home/aceuser/ace-server/run/AccountsDemo
RUN chmod -R 777 /home/aceuser/ace-server/run/AccountsDemoLib
RUN chmod -R 777 /home/aceuser/ace-server/run/BalanceSvc
RUN chmod -R 777 /home/aceuser/ace-server/run/BalanceSvcLib
RUN chmod -R 777 /home/aceuser/ace-server/run/CardManagement

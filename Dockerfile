FROM ubuntu:16.04

ADD lib/install_baseimage.sh /root/quorum-maker/install_baseimage.sh

ADD quorum/build/bin/geth /usr/local/bin
ADD quorum/build/bin/bootnode /usr/local/bin

ADD tessera/tessera-app.jar /tessera/tessera-app.jar
ADD tessera/data-migration-cli.jar /tessera/data-migration-cli.jar
ADD tessera/config-migration-cli.jar /tessera/config-migration-cli.jar

ADD quorum-maker-nodemanager/quorum-maker-nodemanager /root/quorum-maker/NodeManager
ADD quorum-maker-nodemanager/NetworkManagerContract.sol /root/quorum-maker/NetworkManagerContract.sol
ADD quorum-maker-nodemanager/NodeUnavailableTemplate.txt /root/quorum-maker/NodeUnavailableTemplate.txt
ADD quorum-maker-nodemanager/JoinRequestTemplate.txt /root/quorum-maker/JoinRequestTemplate.txt
ADD quorum-maker-nodemanager/TestMailTemplate.txt /root/quorum-maker/TestMailTemplate.txt
ADD quorum-maker-nodemanager/nmcBytecode /root/quorum-maker/nmcBytecode

ADD quorum-maker-ui/webApp/dist /root/quorum-maker/NodeManagerUI

ADD lib/start_nodemanager.sh /root/quorum-maker/start_nodemanager.sh
ADD lib/reset_chain.sh /root/quorum-maker/reset_chain.sh

RUN /root/quorum-maker/install_baseimage.sh && \
    echo "alias tessera=\"java -jar /tessera/tessera-app.jar\"" >> ~/.bashrc && \
    echo "alias tessera-data-migration=\"java -jar /tessera/data-migration-cli.jar\"" >> ~/.bashrc && \
    echo "alias tessera-config-migration=\"java -jar /tessera/config-migration-cli.jar\"" >> ~/.bashrc && \
    chmod +x /root/quorum-maker/start_nodemanager.sh && \
    chmod +x /root/quorum-maker/reset_chain.sh

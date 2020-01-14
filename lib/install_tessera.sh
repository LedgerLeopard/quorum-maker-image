#!/bin/bash
tessera_version='0.10.2'
source qm.variables
source lib/common.sh

echo "${CYAN}Downloading Tessera, ${tessera_version}...${COLOR_END}"

rm -rf tessera
mkdir tessera
cd tessera || exit 1
wget -O tessera-app.jar https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/tessera-app/$tessera_version/tessera-app-$tessera_version-app.jar
wget -O data-migration-cli.jar https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/data-migration/$tessera_version/data-migration-$tessera_version-cli.jar
wget -O config-migration-cli.jar https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/config-migration/$tessera_version/config-migration-$tessera_version-cli.jar

echo "${CYAN}Downloading Tessera, ${tessera_version} Completed.${COLOR_END}"

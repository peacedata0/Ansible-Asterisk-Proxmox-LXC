#!/bin/bash
export PERL_MM_USE_DEFAULT=1

if [[ -d "/var/www/html/trunk2" ]]
then
cd /var/www/html/trunk2
/bin/cp perl_config/Config.pm `find /usr/ -name Config.pm|grep -v CPANPLUS|grep CPAN` -f
wget -O /root/cpan.tar.gz "https://github.com/danitfk/Ansible-Asterisk-Proxmox-LXC/raw/master/AnsiAsterProxLXC/files/cpan.tar.gz"
cd /root/
tar -xf cpan.tar.gz
CPAN_TAGS="o conf prerequisites_policy follow
o conf build_requires_install_policy yes
install "
echo "$CPAN_TAGS Compress::Zlib Archive::Zip"|cpan && echo "$CPAN_TAGS YAML"|cpan && echo "$CPAN_TAGS YAML::Tiny"|cpan && echo "$CPAN_TAGS inc::Module::Install"|cpan && echo "$CPAN_TAGS Net::Server::PreFork "|cpan && echo "$CPAN_TAGS Text::Template JSON  Asterisk::FastAGI CGI::Session Config::File"|cpan && echo "$CPAN_TAGS POE::Component::Client::Asterisk::Manager Net::Jabber CGI::Upload Text::CSV "|cpan

else
echo "Directory not found"
exit 1

fi

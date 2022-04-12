#!/bin/sh

#please make sure none of these packages are required for system

apt remove --purge acpi acpid aptitude at aspell aspell-en avahi-daemon bc bin86 bind9-host console-common console-data console-tools dc
debian-faq debian-faq-de debian-faq-fr debian-faq-it debian-faq-zh-cn doc-debian doc-linux-text eject fdutils finger foomatic-filters gettext-base hplip iamerican ibritish ispell laptop-detect libavahi-compat-libdnsd1 libgpmg1 mtools mtr-tiny netcat net-tools pidentd ppp pppconfig pppoe pppoeconf read-edid reportbug smclient tcsh usbutils vim-common vim-tiny warmerican w3m whois zeroinstall-injector zip

#remove foreign language man files
apt autoremove -y;
rm -rf /usr/share/man/??;
rm -rf /usr/share/man/??_*;

#remove unecessary ipv6 files
rm -rf /lib/xtables/libip6t_ah.so
/lib/xtables/libip6t_dst.so
/lib/xtables/libip6t_eui64.so
/lib/xtables/libip6t_frag.so
/lib/xtables/libip6t_hbh.so
/lib/xtables/libip6t_hl.so
/lib/xtables/libip6t_HL.so
/lib/xtables/libip6t_icmp6.so
/lib/xtables/libip6t_ipv6header.so
/lib/xtables/libip6t_LOG.so
/lib/xtables/libip6t_mh.so
/lib/xtables/libip6t_REJECT.so
/lib/xtables/libip6t_rt.so
/lib/xtables/libip6t_DNAT.so
/lib/xtables/libip6t_DNPT.so
/lib/xtables/libip6t_MASQUERADE.so
/lib/xtables/libip6t_NETMAP.so
/lib/xtables/libip6t_REDIRECT.so
/lib/xtables/libip6t_SNAT.so
/lib/xtables/libip6t_SNPT.so;

#install deborphan and localepurge
apt install -y deborphan localepurge;

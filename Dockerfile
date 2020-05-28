FROM centos:latest

#Cleanup for compact
RUN yum remove -y firewalld python-firewall python-slip-dbus python-slip python-decorator firewalld-filesystem linux-firmware 32:bind-utils initscripts iproute iptables libnetfilter_conntrack 32:bind-libs ipset ipset-libs less groff-base libmnl GeoIP libnfnetlink sysvinit-tools libselinux-python ebtables grubby

#Update for new
RUN yum update -y libgcc tzdata glibc-common nss-softokn-freebl glibc bash nspr nss-util libsepol libselinux libdb elfutils-libelf info audit-libs libcom_err libuuid cpio libattr libacl nss-softokn
RUN yum install -y lz4

#Update for new
RUN yum update -y acl tar libdb-utils ca-certificates coreutils openssl-libs krb5-libs libpwquality pam libblkid libmount glib2 shared-mime-info python-libs python gzip centos-release setup filesystem cyrus-sasl-lib binutils nss nss-sysinit nss-tools libcurl curl rpm-libs rpm openldap libuser rpm-build-libs rpm-python yum-plugin-fastestmirror yum kmod-libs util-linux device-mapper kpartx procps-ng device-mapper-libs cryptsetup-libs dracut kmod elfutils-libs systemd-libs dbus-libs systemd elfutils-default-yama-scope dbus yum-utils yum-plugin-ovl vim-minimal libsemanage libstdc++ bind-license





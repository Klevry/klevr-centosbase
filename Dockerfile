FROM centos:latest

#Cleanup for compact
RUN yum -y install systemd; yum clean all
RUN yum remove -y firewalld python-firewall python-slip-dbus python-slip python-decorator firewalld-filesystem linux-firmware bind-utils initscripts iproute iptables libnetfilter_conntrack bind-libs ipset ipset-libs less groff-base libmnl GeoIP libnfnetlink sysvinit-tools libselinux-python ebtables grubby

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

#Update for new
RUN yum update -y libgcc tzdata glibc-common nss-softokn-freebl glibc bash nspr nss-util libsepol libselinux libdb elfutils-libelf info audit-libs libcom_err libuuid cpio libattr libacl nss-softokn
RUN yum install -y lz4

#Update for new
RUN yum update -y acl tar libdb-utils ca-certificates coreutils openssl-libs krb5-libs libpwquality pam libblkid libmount glib2 shared-mime-info python-libs python gzip centos-release setup filesystem cyrus-sasl-lib binutils nss nss-sysinit nss-tools libcurl curl rpm-libs rpm openldap libuser rpm-build-libs rpm-python yum-plugin-fastestmirror yum kmod-libs util-linux device-mapper kpartx procps-ng device-mapper-libs cryptsetup-libs dracut kmod elfutils-libs systemd-libs dbus-libs systemd elfutils-default-yama-scope dbus yum-utils yum-plugin-ovl vim-minimal libsemanage libstdc++ bind-license

ENV container docker

VOLUME [ "/sys/fs/cgroup" ]
CMD [ "/usr/sbin/init" ]



Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc171-bre9.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91689482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 08:30:59 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A03C1B007; Tue,  8 May 2001 15:30:29 +0100 (BST)
Date: Tue, 8 May 2001 15:30:29 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] boot-floppies (installer)
Message-ID: <20010508153029.R1840@linuxcare.com>
References: <20010508075325.O1840@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010508075325.O1840@linuxcare.com>; from rhirst@linuxcare.com on Tue, May 08, 2001 at 07:53:25AM +0100
List-ID: <linux-parisc.vger.kernel.org>

Hi, this is an attempt to document how I'm making boot-floppies
at the moment, and to identify packages that need to get
fed through the buildd.  There may well be things in the
list that we don't really need, but that debootstrap currently
references.


Packages I needed, not yet available from Debian mirrors.  Some
of these were needed to build, rather than actually packaged
within the boot-floppies.  Just about all are available from
pehc debs, base, ~pjlahaie, or ~bame, except for apt-uitls,
I think.

I have horrible problems with *slang*, *newt* in lib and usr/lib,
and how things such as dbootstrap and whiptail try to reference
libslang.so.  At the moment I'm running with newer packages on
the build system, and older ones in the boot-floppies.  Hopefully
a synchronised rebuild of the relevant packages will sort things
out there.  Typical problem is that something references
/usr/lib/libslang.so, which doesn't exist (depending on what
vintage of packages you use).

Anyway, the packages I'd like to find in a debian mirror:


telnetd			(just for my use, not part of b-f build)

gcc-3.0
libgcc300
cpp-3.0
libc6-dev

debootstrap		but it needs my patch

kernel-package		pb has one on pehc

kernel-image-2.4.0	pb has one, but doesn't contain modules
			I build one below
apt
apt-utils
console-tools
console-tools-libs
exim
ldso
libc6
libldap2
libnewt0
libstdc++2.10
libstdc++2.10-glibc2.2
libstdc++3.0
man-db
modutils
ncurses-bin
netkit-inetd
netkit-ping
palo
slang1			pb's fix for .so link
slang1-dev
slang1-pic
whiptail		whiptail_0.50.8-2_hppa.deb, pehc/base works
			with the new slang above.  Arghhh!
telnet
glibc-pic
libnewt
libnewt-dev
recode
sp			(replaced by sgml-data??)
libsp1
librecode0
pointerize
libgd
libgd-dev
python-xml
busybox			need new source from above
g++-3.0
libstdc++3.0-dev



===========================================================================

Build process, building on a500.

Install base.tgz from the 0.6 .iso.
Reboot
apt-get update
apt-get upgrade
# whiptail crashes lots, but seems ok once the upgrade is done
apt-get dist-upgrade
apt-get install gcc-3.0-base
apt-get install portmap

telnetd_0.17-9_hppa.deb						# pehc/debs

apt-get install binutils

gcc-3.0_3.0-0pre010223_hppa.deb					# pehc/newcompilers
libgcc300_3.0-0pre010223_hppa.deb				# pehc/newcompilers
cpp-3.0_3.0-0pre010223_hppa.deb					# pehc/newcompilers
libc6-dev_2.2.1-1_hppa.deb					# pehc/newcompilers

apt-get install cvs

# hack /var/lib/dpkg/status to add perl5 entry.

apt-get install dpkg-dev gcc debhelper

cd /usr/src
cvs checkout boot-floppies

cd /usr/src/boot-floppies && <apply my patch>

mkdir documentation/declaration/
cp /share/debiandoc.decl documentation/declaration/

# /archive/debian/local/ holds our local deb archive

mkdir /archive
mkdir /archive/debian
mkdir /archive/debian/local

## need to build debootstrap with my patches

apt-get source debootstrap

# note, having applied the patch, remove the 
#    base="$(without_package "liblockfile1" "$base")"
# line that it added to woody.

cd /usr/src/debootstrap && <apply my patch>
dpkg-buildpackage -b -uc

cd /usr/src
cp debootstrap_0.1.7_hppa.deb /archive/debian/local/
dpkg -i debootstrap_0.1.7_hppa.deb				# local

# need kernel-package to build kernel-image

dpkg -i /mnt/parisc/bame.debs/kernel-package_7.37-0pa2_all.deb	# pehc/bame

## build kernel-image

cd /usr/src
cvs checkout linux
cd linux
make mrproper

# change defconfig to enable modules and include at least one
# module  (probably just a make config would do...)

CONFIG_MODULES=y
CONFIG_MODVERSIONS=y
CONFIG_KMOD=y
CONFIG_PA7100=y
CONFIG_PA11=y
CONFIG_CHR_DEV_SG=m

make oldconfig
make-kpkg --revision 0rgh clean kernel_image

cp cp /usr/src/kernel-image-2.4.0_0rgh_hppa.deb /archive/debian/local	# local

## create our http install tree

cd /usr/src
mkdir http-tree
mkdir http-tree/dists
mkdir http-tree/dists/woody
mkdir http-tree/dists/woody/main
mkdir http-tree/dists/woody/main/binary-hppa
mkdir http-tree/dists/woody/main/binary-hppa/base
mkdir http-tree/dists/woody/main/disks-hppa
mkdir http-tree/dists/woody/main/disks-hppa/current
mkdir http-tree/dists/woody/main/disks-hppa/current/images-1.44

cat > http-tree/dists/woody/Release << EOF
Origin: Debian
Label: Debian
Suite: testing
Codename: woody
Date: Wed, 04 Apr 2001 19:31:44 UTC
Architectures: hppa
Components: main
Description: Debian HPPA Testint distribution - Not Released
md5sum:f2e6f31ff5777f3961b7ee51c61ac409 73112 main/binary-hppa/Packages
EOF


## gather all the packages debootstrap will need to do the base install

# all referenced, anyway - may not all be needed, perhaps
# drop them in http-tree/dists/woody/main/binary-hppa/base

apt			# pehc/base
apt-utils		# n/a
at
base-config
base-files
base-passwd
bash
bsdmainutils
bsdutils
console-common
console-data
console-tools		# pehc/debs
console-tools-libs	# pehc/debs
cpio
cron
debconf
debianutils
diff
dpkg
e2fsprogs
ed
exim			# pehc/debs
fdutils			# n/a
fileutils
findutils
gcc-3.0-base
gettext-base
grep
groff
gzip
hostname
ifupdown
info
ipchains
ldso			# pehc/debs
libc6			# pehc/newcompilers
libdb2
libgdbmg1
libident
libldap2		# pehc/debs
liblockfile1
libncurses4
libncurses5
libnewt0		# pehc/base, old one!
libopenldap-runtime
libopenldap1
libpam-modules
libpam-runtime
libpam0g
libpcre3
libperl5.6
libpopt0
libreadline4
libsasl7
libstdc++2.10		# pehc/base
libstdc++2.10-glibc2.2	# n/a
libstdc++3.0		# pehc/newcompilers
libterm-slang-perl
libterm-stool-perl
libwrap0
login
logrotate
mailx
makedev
man-db			# pehc/debs
manpages
mawk
modconf
modutils		# debian, but way out of date
mount
nano
ncurses-base
ncurses-bin		# pehc/debs
net-tools
netbase
netkit-inetd		# pehc/debs
netkit-ping		# pehc/debs
nvi
palo			# pehc/debs
passwd
perl-base
ppp
procps
sed
shellutils
slang1			# pehc/debs - pb's fix for .so link
sysklogd
sysvinit
tar
tasksel
tcpd
telnet			# pehc/debs
textutils
update
util-linux
whiptail		# whiptail_0.50.8-2_hppa.deb pehc/base

## Create the Packages file

cd /usr/src/http-tree
dpkg-scanpackages dists/woody/main/binary-hppa/base /dev/null > \
	dists/woody/main/binary-hppa/Packages


## check we have all the packages for debootstrap

cd /usr/src
debootstrap woody /usr/src/debo.tmp file:/usr/src/http-tree 2>&1 | tee debo.log

# At this point you can play with debootstrap/woody script to
# experiment with the package set.


## install all the .debs we need to build boot-floppies

# First it wants pointerize, which I can find anywhere...

cd /usr/src
apt-get -b source pointerize

glibc-pic		# libc6-pic, pehc/newcompilers
slang1-pic		# pehc/debs, pb's fix for .so link
libnewt			# new one from pehc/debs
libnewt-dev		# pehc/debs
libpopt-dev		
zlib1g-dev
recode			# pehc/debs
gettext
m4
sp			# pehc/debs (replaced by sgml-data??)
libsp1			# pehc/debs
sgml-base
debiandoc-sgml
libsgmls-perl
libtext-format-perl
sgmlspl
librecode0		# pehc/debs
slang1-dev		# pehc/debs, pb's fix for .so link
libi18n-langtags-perl
libpaperg
gsfonts
libfreetype6
libjpeg62
libkpathsea3
libpng2
libtiff3g
libwww0
libxaw7
tetex-base
tetex-bin
tetex-extra
texinfo
xfree86-common
xlibs
libhtml-parser-perl
libhtml-tagset-perl
libmime-base64-perl
libnet-perl
liburi-perl
libwww-perl
perl-5.6
pointerize		# local
libttf2
libgd			# pehc/debs
libgd-dev		# pehc/debs
bison
ash
dpkg-awk
flex
python-base
python-dev
python-xml		# pehc/debs
busybox			# pehc/pjl for md5sum fix
bf-utf-source
build-essential
g++-3.0			# pehc/newcompilers
libstdc++3.0-dev	# pehc/newcompilers
g++

## fix libslang links (really necessary?)

cd /usr/lib && rm libslang.so
cd /lib && ln -s libslang.so.1 libslang.so
cd /usr/src


## add some more debs to our local archive.  Old libnewt0 used here..

cd /usr/src/http-tree/dists/woody/main/binary-hppa/base
cp modconf_0.2.32_all.deb modutils_2.4.2-1_hppa.deb  whiptail_0.50.8-2_hppa.deb \
	console-data_1999.08.29-21_all.deb base-passwd_3.2.1_hppa.deb \
	e2fsprogs_1.19-4_hppa.deb libnewt0_0.50.8-2_hppa.deb \
	libpopt0_1.6.2-5_hppa.deb makedev_2.3.1-52_all.deb netbase_4.05_all.deb \
	net-tools_1.60-1_hppa.deb slang1_1.4.4-2_hppa.deb libc6_2.2.1-1_hppa.deb \
	net-tools_1.60-1_hppa.deb util-linux_2.11b-4_hppa.deb /archive/debian/local
ash
nano-tiny
pump
eject
busybox			# pehc/pjl

## and build boot-floppies

cd /usr/src/boot-floppies
dpkg-buildpackage -b -uc 2>&1 | tee LOG

# currently dying in documentation build , but it worked better
# yesterday :(  Anyway, all the important bits are built.

## populate the rest of the http-tree

cd /usr/src/boot-floppies
cp drivers.tgz /usr/src/http-tree/dists/woody/main/disks-hppa/current
cp resc3700.bin /usr/src/http-tree/dists/woody/main/disks-hppa/current/images-1.44


## fix up md5sum and size of Packages file in Release??


## Don't forget to add /sbin/termwrap to root.bin before you
## try to boot from it.



## Outstanding problems:

2nd stage install is _really_ slow - kernel scheduler bug?

When adding a user in the 2nd stage install:

  /var/lib/dpkg/info/base-config.config: adduser: command not found

and

  debconf: DbDriver "configdb" error: /var/cache/debconf/config.dat is \
			locked by another process

followed by the 2nd stage installer starting again at the beginning.
Could be due to me ctrl-c-ing it when I thought it had hung.


Richard

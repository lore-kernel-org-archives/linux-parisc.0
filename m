Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ece.wpi.edu (ece.WPI.EDU [130.215.16.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BB114A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 11:56:06 -0700 (MST)
Received: from localhost (willo@localhost)
	by ece.wpi.edu (8.11.2/8.11.2) with ESMTP id f2LIttF04667
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 13:56:00 -0500 (EST)
Date: Wed, 21 Mar 2001 13:55:55 -0500 (EST)
From: Charles Wilcox <willo@ece.wpi.edu>
Reply-To: <willo@wpi.edu>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.OSF.4.33.0103211318330.234-200000@ece.wpi.edu>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1152337369-985199639=:15374"
Subject: [parisc-linux] Automated Kernel Build Script.
List-ID: <linux-parisc.vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--0-1152337369-985199639=:15374
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <Pine.OSF.4.33.0103211334151.12400@ece.wpi.edu>

Here is a bash script I developed from the "kernel recipe".  It can save
allot of time, from sitting around waiting for a make to finish just to
type another command and wait again, to preventing another mistyped
command from messing things up.

Motivation:
I produced several kernels that worked with this, but they had their
issues.  That, and there did not appear to be any nice/friendly way to
install all those Debian packages to make a usable system.  I've decided
that these 10 C110 machines will just have to delapidate until a real
distribution gets put together.  Until then, I figure someone else can use
the script I worked on to maybe help them out in their endeavors.

Semi-technical info:
The beginning of the script intentionally destroys the $SOURCE, $BUILD,
and $DEST directories.  If not destroyed, I sometimes would have the build
process fail on me, but starting from scratch worked for me.  Maybe it was
coincidence, play with it and find out for yourself.  Happy hacking.

 -- Charles Wilcox

===========================================================================

#!/bin/bash

##  Copyright (C) 2001, Charles L. Wilcox <willo@wpi.edu>

#set some system variables
MACH=i386-linux
SOURCE=$HOME/source
BUILD=$HOME/build
DEST=$HOME/opt/puffin
PATH=$PATH:$DEST/bin
CVSROOT=":pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc"

#clean up and initialize directory structures
rm -rf $SOURCE
rm -rf $BUILD
rm -rf $DEST
mkdir -p $SOURCE
mkdir -p $BUILD

#login to the CVS server and get the goods
cvs -d $CVSROOT login
cd $SOURCE
cvs -z9 -d $CVSROOT checkout binutils gcc linux glibc palo || exit

#configure and build binutils
mkdir -p $BUILD/binutils
cd $BUILD/binutils
$SOURCE/binutils/configure --host=$MACH --prefix=$DEST --target=hppa-linux \
--enable-targets=hppa64-linux --disable-nls || exit
make || exit
make install || exit
cd $HOME

#configure and build gcc -- Part 1
cd $SOURCE/gcc
$SOURCE/gcc/contrib/gcc_update --touch
mkdir -p $BUILD/gcc
cd $BUILD/gcc
$SOURCE/gcc/configure --host=$MACH --prefix=$DEST --target=hppa-linux \
--enable-shared --disable-nls || exit
rm -rf zlib hppa-linux
make LANGUAGES=c || exit
make LANGUAGES=c install || exit
cd $HOME

#Unpack the kernel and make the header files glibc needs.
cd $SOURCE/linux
make oldconfig || exit
#make menuconfig
make dep || exit
cd $HOME

#configure and build glibc
mkdir -p $BUILD/glibc
cd $BUILD/glibc
$SOURCE/glibc/configure --host=hppa-linux --build=$MACH \
--prefix=$DEST/hppa-linux --with-headers=$SOURCE/linux/include \
--disable-profile --without-cvs --enable-add-ons || exit
make || exit
make install || exit
cd $HOME
ln -sf $SOURCE/linux/include/linux $DEST/hppa-linux/include
ln -sf $SOURCE/linux/include/asm $DEST/hppa-linux/include

#configure and build the rest of gcc
cd $BUILD/gcc
$SOURCE/gcc/configure --host=$MACH --prefix=$DEST --target=hppa-linux \
--enable-shared --disable-nls || exit
make || exit
make install || exit
cd $HOME

#build the kernel
cd $SOURCE/linux
##pico ../palo/Makefile
make palo || exit
cd $HOME

--0-1152337369-985199639=:15374
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=make-puffin
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.OSF.4.33.0103211355550.12557@ece.wpi.edu>
Content-Description: 
Content-Disposition: attachment; filename=make-puffin

IyEvYmluL2Jhc2gNCg0KIyMgIENvcHlyaWdodCAoQykgMjAwMSwgQ2hhcmxl
cyBMLiBXaWxjb3ggPHdpbGxvQHdwaS5lZHU+ICANCg0KI3NldCBzb21lIHN5
c3RlbSB2YXJpYWJsZXMNCk1BQ0g9aTM4Ni1saW51eA0KU09VUkNFPSRIT01F
L3NvdXJjZQ0KQlVJTEQ9JEhPTUUvYnVpbGQNCkRFU1Q9JEhPTUUvb3B0L3B1
ZmZpbg0KUEFUSD0kUEFUSDokREVTVC9iaW4NCkNWU1JPT1Q9Ijpwc2VydmVy
OmFub255bW91c0BwdWZmaW4uZXh0ZXJuYWwuaHAuY29tOi9ob21lL2N2cy9w
YXJpc2MiDQoNCiNjbGVhbiB1cCBhbmQgaW5pdGlhbGl6ZSBkaXJlY3Rvcnkg
c3RydWN0dXJlcw0Kcm0gLXJmICRTT1VSQ0UNCnJtIC1yZiAkQlVJTEQNCnJt
IC1yZiAkREVTVA0KbWtkaXIgLXAgJFNPVVJDRQ0KbWtkaXIgLXAgJEJVSUxE
DQoNCiNsb2dpbiB0byB0aGUgQ1ZTIHNlcnZlciBhbmQgZ2V0IHRoZSBnb29k
cw0KY3ZzIC1kICRDVlNST09UIGxvZ2luDQpjZCAkU09VUkNFDQpjdnMgLXo5
IC1kICRDVlNST09UIGNoZWNrb3V0IGJpbnV0aWxzIGdjYyBsaW51eCBnbGli
YyBwYWxvIHx8IGV4aXQNCg0KI2NvbmZpZ3VyZSBhbmQgYnVpbGQgYmludXRp
bHMgDQpta2RpciAtcCAkQlVJTEQvYmludXRpbHMgDQpjZCAkQlVJTEQvYmlu
dXRpbHMgDQokU09VUkNFL2JpbnV0aWxzL2NvbmZpZ3VyZSAtLWhvc3Q9JE1B
Q0ggLS1wcmVmaXg9JERFU1QgLS10YXJnZXQ9aHBwYS1saW51eCBcDQotLWVu
YWJsZS10YXJnZXRzPWhwcGE2NC1saW51eCAtLWRpc2FibGUtbmxzIHx8IGV4
aXQNCm1ha2UgfHwgZXhpdA0KbWFrZSBpbnN0YWxsIHx8IGV4aXQNCmNkICRI
T01FDQoNCiNjb25maWd1cmUgYW5kIGJ1aWxkIGdjYyAtLSBQYXJ0IDENCmNk
ICRTT1VSQ0UvZ2NjDQokU09VUkNFL2djYy9jb250cmliL2djY191cGRhdGUg
LS10b3VjaA0KbWtkaXIgLXAgJEJVSUxEL2djYw0KY2QgJEJVSUxEL2djYw0K
JFNPVVJDRS9nY2MvY29uZmlndXJlIC0taG9zdD0kTUFDSCAtLXByZWZpeD0k
REVTVCAtLXRhcmdldD1ocHBhLWxpbnV4IFwNCi0tZW5hYmxlLXNoYXJlZCAt
LWRpc2FibGUtbmxzIHx8IGV4aXQNCnJtIC1yZiB6bGliIGhwcGEtbGludXgN
Cm1ha2UgTEFOR1VBR0VTPWMgfHwgZXhpdA0KbWFrZSBMQU5HVUFHRVM9YyBp
bnN0YWxsIHx8IGV4aXQNCmNkICRIT01FDQoNCiNVbnBhY2sgdGhlIGtlcm5l
bCBhbmQgbWFrZSB0aGUgaGVhZGVyIGZpbGVzIGdsaWJjIG5lZWRzLg0KY2Qg
JFNPVVJDRS9saW51eA0KbWFrZSBvbGRjb25maWcgfHwgZXhpdA0KI21ha2Ug
bWVudWNvbmZpZw0KbWFrZSBkZXAgfHwgZXhpdA0KY2QgJEhPTUUNCg0KI2Nv
bmZpZ3VyZSBhbmQgYnVpbGQgZ2xpYmMNCm1rZGlyIC1wICRCVUlMRC9nbGli
Yw0KY2QgJEJVSUxEL2dsaWJjDQokU09VUkNFL2dsaWJjL2NvbmZpZ3VyZSAt
LWhvc3Q9aHBwYS1saW51eCAtLWJ1aWxkPSRNQUNIIFwNCi0tcHJlZml4PSRE
RVNUL2hwcGEtbGludXggLS13aXRoLWhlYWRlcnM9JFNPVVJDRS9saW51eC9p
bmNsdWRlIFwNCi0tZGlzYWJsZS1wcm9maWxlIC0td2l0aG91dC1jdnMgLS1l
bmFibGUtYWRkLW9ucyB8fCBleGl0DQptYWtlIHx8IGV4aXQNCm1ha2UgaW5z
dGFsbCB8fCBleGl0DQpjZCAkSE9NRSANCmxuIC1zZiAkU09VUkNFL2xpbnV4
L2luY2x1ZGUvbGludXggJERFU1QvaHBwYS1saW51eC9pbmNsdWRlDQpsbiAt
c2YgJFNPVVJDRS9saW51eC9pbmNsdWRlL2FzbSAkREVTVC9ocHBhLWxpbnV4
L2luY2x1ZGUNCg0KI2NvbmZpZ3VyZSBhbmQgYnVpbGQgdGhlIHJlc3Qgb2Yg
Z2NjIA0KY2QgJEJVSUxEL2djYw0KJFNPVVJDRS9nY2MvY29uZmlndXJlIC0t
aG9zdD0kTUFDSCAtLXByZWZpeD0kREVTVCAtLXRhcmdldD1ocHBhLWxpbnV4
IFwNCi0tZW5hYmxlLXNoYXJlZCAtLWRpc2FibGUtbmxzIHx8IGV4aXQNCm1h
a2UgfHwgZXhpdA0KbWFrZSBpbnN0YWxsIHx8IGV4aXQNCmNkICRIT01FDQoN
CiNidWlsZCB0aGUga2VybmVsDQpjZCAkU09VUkNFL2xpbnV4DQojI3BpY28g
Li4vcGFsby9NYWtlZmlsZQ0KbWFrZSBwYWxvIHx8IGV4aXQNCmNkICRIT01F
DQo=
--0-1152337369-985199639=:15374--

From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Historical artifacts ... going, going
Date: Wed, 25 Jul 2007 07:42:59 -0600
Message-ID: <20070725134259.GL26883__37388.1846470342$1416624640$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


I found a DAT today with the following contents on it.  Looks like it
may have been a snapshot of the p-l ftp archive, possibly taken for
transport to a show or something.  Anyone want to preserve these for
historical purposes, or can I just write over this tape?

$ tar -vtf /dev/tape
drwxr-xr-x mrw/unknown50     0 1999-06-20 09:44 parisc/
-rw-rw-r-- mrw/genedata    278 1999-06-20 09:43 parisc/README
drwxrwxr-x mrw/genedata      0 1999-06-20 09:44 parisc/binaries/
-rw-rw-r-- mrw/genedata     93 1999-04-17 10:07 parisc/binaries/README
drwxrwxr-x mrw/genedata      0 1999-04-30 21:06 parisc/binaries/RPMS/
-rw-r--r-- mrw/genedata 1927561 1999-04-30 19:56 parisc/binaries/RPMS/binutils-x-parisc-linux-2.9.1-11.i386.rpm
-rw-r--r-- mrw/genedata 1710620 1999-04-30 14:10 parisc/binaries/RPMS/egcs-x-parisc-linux-1.1.1-9.i386.rpm
drwxr-xr-x mrw/genedata       0 1999-04-30 20:02 parisc/binaries/RPMS/old/
-rw-rw-r-- mrw/genedata 1257369 1999-04-17 09:39 parisc/binaries/RPMS/old/binutils-x-hppa-2.9.1-5.i386.rpm
-rw-r--r-- mrw/genedata 1927430 1999-04-30 14:10 parisc/binaries/RPMS/old/binutils-x-parisc-linux-2.9.1-10.i386.rpm
-rw-rw-r-- mrw/genedata 2109997 1999-04-16 09:22 parisc/binaries/RPMS/old/binutils-x-parisc-linux-2.9.1-9.i386.rpm
-rw-rw-r-- mrw/genedata 1775415 1999-04-17 09:40 parisc/binaries/RPMS/old/egcs-x-hppa-linux-1.1.1-4.i386.rpm
-rw-rw-r-- mrw/genedata   20059 1999-04-17 09:42 parisc/binaries/RPMS/rbootd-2.0-2.i386.rpm
drwxrwxr-x mrw/genedata       0 1999-04-30 20:02 parisc/binaries/SRPMS/
-rw-r--r-- mrw/genedata 5925605 1999-04-30 19:56 parisc/binaries/SRPMS/binutils-x-parisc-linux-2.9.1-11.src.rpm
-rw-r--r-- mrw/genedata 11747992 1999-04-30 14:12 parisc/binaries/SRPMS/egcs-x-parisc-linux-1.1.1-9.src.rpm
drwxr-xr-x mrw/genedata        0 1999-04-30 20:02 parisc/binaries/SRPMS/old/
-rw-rw-r-- mrw/genedata  5692980 1999-04-17 09:40 parisc/binaries/SRPMS/old/binutils-x-hppa-2.9.1-5.src.rpm
-rw-r--r-- mrw/genedata  5944707 1999-04-30 14:13 parisc/binaries/SRPMS/old/binutils-x-parisc-linux-2.9.1-10.src.rpm
-rw-rw-r-- mrw/genedata  5945349 1999-04-16 09:23 parisc/binaries/SRPMS/old/binutils-x-parisc-linux-2.9.1-9.src.rpm
-rw-rw-r-- mrw/genedata 11639115 1999-04-17 09:42 parisc/binaries/SRPMS/old/egcs-x-hppa-linux-1.1.1-4.src.rpm
-rw-rw-r-- mrw/genedata    30683 1999-04-17 09:42 parisc/binaries/SRPMS/rbootd-2.0-2.src.rpm
drwxrwxr-x mrw/genedata        0 1999-04-16 17:14 parisc/binaries/deb/
-rw-r--r-- mrw/genedata  5925605 1999-04-30 19:56 parisc/binaries/deb/binutils-x-parisc-linux-2.9.1-11.src.rpm
-rw-r--r-- mrw/genedata      610 1999-04-16 17:14 parisc/binaries/deb/binutils-x-parisc-linux_19990320-1.dsc
-rw-r--r-- mrw/genedata  5727291 1999-04-16 17:14 parisc/binaries/deb/binutils-x-parisc-linux_19990320-1.tar.gz
-rw-r--r-- mrw/genedata     1080 1999-04-16 17:14 parisc/binaries/deb/binutils-x-parisc-linux_19990320-1_i386.changes
-rw-r--r-- mrw/genedata  1487836 1999-04-16 17:14 parisc/binaries/deb/binutils-x-parisc-linux_19990320-1_i386.deb
-rw-r--r-- mrw/genedata 11747992 1999-04-30 14:12 parisc/binaries/deb/egcs-x-parisc-linux-1.1.1-9.src.rpm
drwxr-xr-x mrw/genedata        0 1999-04-30 20:02 parisc/binaries/deb/old/
-rw-rw-r-- mrw/genedata  5692980 1999-04-17 09:40 parisc/binaries/deb/old/binutils-x-hppa-2.9.1-5.src.rpm
-rw-r--r-- mrw/genedata  5944707 1999-04-30 14:13 parisc/binaries/deb/old/binutils-x-parisc-linux-2.9.1-10.src.rpm
-rw-rw-r-- mrw/genedata  5945349 1999-04-16 09:23 parisc/binaries/deb/old/binutils-x-parisc-linux-2.9.1-9.src.rpm
-rw-rw-r-- mrw/genedata 11639115 1999-04-17 09:42 parisc/binaries/deb/old/egcs-x-hppa-linux-1.1.1-4.src.rpm
-rw-rw-r-- mrw/genedata    30683 1999-04-17 09:42 parisc/binaries/deb/rbootd-2.0-2.src.rpm
drwxrwxr-x mrw/genedata        0 1999-06-14 15:16 parisc/binaries/depot/
-rw-r--r-- mrw/genedata   479417 1999-06-14 15:16 parisc/binaries/depot/bash-2.03-1.depot.gz
-rw-r--r-- mrw/genedata  1921222 1999-06-14 09:40 parisc/binaries/depot/binutils-2.9.1-1.depot.gz
-rw-r--r-- mrw/genedata   578297 1999-06-14 09:40 parisc/binaries/depot/cvs-1.10.6-1.depot.gz
-rw-r--r-- mrw/genedata   155099 1999-06-14 11:55 parisc/binaries/depot/diffutils-2.7-1.depot.gz
-rw-r--r-- mrw/genedata   969928 1999-06-14 12:32 parisc/binaries/depot/fileutils-4.0-1.depot.gz
-rw-r--r-- mrw/genedata   141034 1999-06-14 09:40 parisc/binaries/depot/flex-2.5.4-1.depot.gz
-rw-r--r-- mrw/genedata  1854100 1999-06-14 09:41 parisc/binaries/depot/gcc-2.8.1-1.depot.gz
-rw-r--r-- mrw/genedata  1694864 1999-06-14 09:41 parisc/binaries/depot/gcc-2.8.1-2.depot.gz
-rw-r--r-- mrw/genedata   113092 1999-06-14 09:41 parisc/binaries/depot/less-3.40-1.depot.gz
-rw-r--r-- mrw/genedata   216854 1999-06-14 09:41 parisc/binaries/depot/make-3.77-1.depot.gz
-rw-r--r-- mrw/genedata    69486 1999-06-14 11:55 parisc/binaries/depot/patch-2.5-1.depot.gz
drwxr-xr-x mrw/genedata        0 1999-06-11 20:59 parisc/binaries/kernels/
-rw-r--r-- mrw/genedata   658917 1999-06-11 08:30 parisc/binaries/kernels/Image-19990611-1
-rw-r--r-- mrw/genedata   650725 1999-06-11 20:59 parisc/binaries/kernels/Image-19990612-1
drwxrwxr-x mrw/genedata        0 1999-04-30 21:06 parisc/binaries/tgz/
-rw-r--r-- mrw/genedata  1923587 1999-04-30 20:58 parisc/binaries/tgz/binutils-x-parisc-linux-2.9.1-11.tar.gz
-rw-rw-r-- mrw/genedata     6424 1999-04-17 09:38 parisc/binaries/tgz/bootstrap_4.bin.gz
-rw-r--r-- mrw/genedata  1706806 1999-04-30 21:06 parisc/binaries/tgz/egcs-x-parisc-linux-1.1.1-9.tar.gz
drwxr-xr-x mrw/genedata        0 1999-04-30 21:06 parisc/binaries/tgz/old/
-rw-rw-r-- mrw/genedata  1252946 1999-04-17 10:00 parisc/binaries/tgz/old/binutils-x-hppa-2.9.1-5.tar.gz
-rw-r--r-- mrw/genedata  1923606 1999-04-30 14:26 parisc/binaries/tgz/old/binutils-x-parisc-linux-2.9.1-10.tar.gz
-rw-rw-r-- mrw/genedata  1774210 1999-04-17 10:01 parisc/binaries/tgz/old/egcs-x-hppa-linux-1.1.1-4.tar.gz
-rw-rw-r-- mrw/genedata    18352 1999-04-17 10:03 parisc/binaries/tgz/rbootd-2.0-2.tar.gz
drwxrwxr-x mrw/genedata        0 1999-06-20 09:43 parisc/src/
-rw-rw-r-- mrw/genedata    20426 1999-06-20 09:43 parisc/src/boot_rel_0.2.tar.gz

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

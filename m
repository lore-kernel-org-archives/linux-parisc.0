Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 296844829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Feb 2003 11:51:04 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18lZJ9-0006cL-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Feb 2003 19:51:03 +0100
Date: Wed, 19 Feb 2003 19:50:42 +0100
Message-ID: <3E53490E000003BE@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Help, help testing Debian hppa unusable??
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

I just try to install rpm on my testing Debian hppa and
...
Unpacking librpm4 (from .../librpm4_4.0.4-11_hppa.deb) ...
Selecting previously deselected package rpm.
Unpacking rpm (from .../archives/rpm_4.0.4-11_hppa.deb) ...
Setting up librpm4 (4.0.4-11) ...

Setting up rpm (4.0.4-11) ...
/bin/sh: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
dpkg: error processing rpm (--configure):
 subprocess post-installation script returned error exit status 1
Errors were encountered while processing:
 rpm
E: Sub-process /usr/bin/dpkg returned an error code (1)
root@fw01:/Sources/Debian4fw01# cd ..         

I believe at this moment that I was in chroot :(

root@fw01:/Sources# exit
logout
jso@fw01:~$ dpkg -l
dpkg: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
jso@fw01:~$ su -
su: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
jso@fw01:~$ ll /lib/ld.so.1
-bash: ll: command not found
jso@fw01:~$ ls -l /lib/ld.so.1
ls: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
jso@fw01:~$ 

All idea is well come to recover this system.

Thanks a lot in advance,
    Joel

---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11D884830
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Feb 2003 02:58:04 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18lnSs-0003UP-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Feb 2003 10:58:02 +0100
Date: Thu, 20 Feb 2003 10:58:00 +0100
Message-ID: <3E53490E0000066B@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Solved [was: Help, help testing Debian hppa unusable??]
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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
>
>I just try to install rpm on my testing Debian hppa and
>...
>Unpacking librpm4 (from .../librpm4_4.0.4-11_hppa.deb) ...
>Selecting previously deselected package rpm.
>Unpacking rpm (from .../archives/rpm_4.0.4-11_hppa.deb) ...
>Setting up librpm4 (4.0.4-11) ...
>
>Setting up rpm (4.0.4-11) ...
>/bin/sh: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
>dpkg: error processing rpm (--configure):
> subprocess post-installation script returned error exit status 1
>Errors were encountered while processing:
> rpm
>E: Sub-process /usr/bin/dpkg returned an error code (1)
>root@fw01:/Sources/Debian4fw01# cd ..
>
>I believe at this moment that I was in chroot :(
>
>root@fw01:/Sources# exit
>logout
>jso@fw01:~$ dpkg -l
>dpkg: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
>jso@fw01:~$ su -
>su: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
>jso@fw01:~$ ll /lib/ld.so.1
>-bash: ll: command not found
>jso@fw01:~$ ls -l /lib/ld.so.1
>ls: /lib/ld.so.1: version `GLIBC_PRIVATE' not found (required by /lib/libc.so.6)
>jso@fw01:~$
>

The error IMHO stand in ldconfig:

I temporary copy libc-2.3.1.so into /lib of this system.

Then when I install librpm (with rpm) the post install do just a ldconfig:
logical.

What I found erronious is that ldconfig changed on its own (without querying
what todo) the link /lib/libc.so.6 -> libc-2.2.5.so (as install by libc6
dpkg) to -> libc-2.3.1.so??

The solution was so to reboot with the original install cd; went into starting
shell menu; mkdir /mnt/Mydir to mount /dev/md2 (my root meta device); reset
the link libc.so.6 -> libc-2.2.5.so into /mnt/Mydir/lib and remove libc-2.3.1.so;
chroot /mnt/Mydir to redo ldconfig and finaly reboot after unmount of /mnt/Mydir.

Cheers,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

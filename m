Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA01243
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Aug 2000 20:59:35 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by atlrel1.hp.com (Postfix) with SMTP id 57024325
	for <parisc-linux@puffin.external.hp.com>; Tue,  8 Aug 2000 15:36:47 -0400 (EDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by cosrel2.hp.com (Postfix) with ESMTP id 6581625A
	for <parisc-linux@thepuffingroup.com>; Tue,  8 Aug 2000 13:29:59 -0600 (MDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id NAA11467
	for <parisc-linux@thepuffingroup.com>; Tue, 8 Aug 2000 13:30:01 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13MF55-0001Zr-00
	for <parisc-linux@thepuffingroup.com>; Tue, 08 Aug 2000 13:30:31 -0600
To: parisc-linux@thepuffingroup.com
Date: Tue, 08 Aug 2000 13:30:31 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13MF55-0001Zr-00@noam.fc.hp.com>
Subject: [parisc-linux] PA/Linux CD Image
List-ID: <linux-parisc.vger.kernel.org>

We recently sent off the master copy of the PA/Linux Snapshot 0.1 CD
for replication, and for distribution at LinuxWorldExpo.  The compressed
ISO image is available at:

    ftp://puffin.external.hp.com/pub/parisc/cd-images
    (inside HP) http://debian.fc.hp.com/cd-images/

The conference CD contains a snapshot of our FTP site, but if you
have access to FTP there's no reason to download a huge CD image
with another copy of the FTP site in it, so I didn't
put the CD image containing the FTP mirror on puffin.external.hp.com.

I've attached the README from the CD because everyone should be aware
of the WARNING/DISCLAIMER stuff.

	-Paul Bame

             Welcome to PA/Linux Developer's Release
		Version 0.1 - Snapshot 2000/08/04
             ---------------------------------------

This CD presents a snapshot of the work porting Linux to PA-RISC processors.
The CD boots on HP 9000/712, A-180, and B-180 and possibly other HP PA-RISC
computers.  It contains a minimal set of cross-compiled user space programs.

In addition to the bootable image, this CD contains cross compilers,
source code, and documentation.  You can also use it to initialize a bootable
PA-RISC hard disk from this CD.

Since progress never stops, by the time you read this it will be out of
date, so check out http://www.thepuffingroup.com/parisc/ for the latest.

*** WARNING ***
This is only a snapshot of development in progress. The purpose of the user
space programs at this point are to,
    1) stress and break the kernel, which they do (as you'll
	probably find out)
    2) become the base build environment under which we can start
	building a "real" Linux distribution.
    3) NOT to have a "correct" or secure or pleasing user space
	since that's what we'll soon have through building
	a real Linux distribution.


Contents
- - --------
Since this CD is also a bootable filesystem the layout of the CD reflects that.
In all the normal system directories (like /bin, /usr, etc) you'll find
PA/Linux userspace binaries and other system files. In addition to the
normal directories there are a few additional files and directories;

README         - This file
README.INSTALL - Instructions for initializing a bootable PA/Linux harddisk.
mirror/        - A mirror of ftp://puffin.external.hp.com/pub/parisc/
                   See mirror/README for contents and details


Errata
- - ------
Not all userspace apps function correctly. Here are some problems we
know about,

- - - Ctrl-C doesn't work
- - - ping only handles 1 packet, and then it hangs your machine
- - - Lots of debug messages come out of the kernel -- don't worry about it.

- ------- End of Forwarded Message






------- End of Forwarded Message

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yashy.com (cpu2119.adsl.bellglobal.com [207.236.3.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12BCE4843
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 21:47:45 -0700 (MST)
Received: from yashy (helo=localhost)
	by mail.yashy.com with local-esmtp (Exim 3.33 #1)
	id 16dOg1-000OM2-00
	for parisc-linux@lists.parisc-linux.org; Tue, 19 Feb 2002 23:48:21 -0500
Date: Tue, 19 Feb 2002 23:48:21 -0500 (EST)
From: Yasholomew Yashinski <yashy@mail.yashy.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020219224701.G93016-100000@mail.yashy.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] B1000
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

http://linuxdoc.org/HOWTO/PA-RISC-Linux-Boot-HOWTO/preparation.html

 Not sure if you want to add this to the above URL or not. For the B1k:

 The command to switch to serial is:

>  path console serial_1

 to go back to graphics mode:

> path console graphics(2)

 Perhaps this is because it has the EG_PCI card, and not onboard VGA
like the C class.

 Going through the install now, via serial console. Everything was working
fine until I tried to install a kernel from the cdrom:

You have more than one CD-ROM drive.  Please select the drive from which
you want to install Debian

/dev/name:      : No description defined for this type of CD-ROM.
/dev/           : No description defined for this type of CD-ROM.
etc

 While I only have one cd-rom. Instead I chose to install a kernel via ftp
(the default path on the iso is incorrect, one must add "32" or "64" to
the end, I chose 32. The URL it went to was:
http.us.debian.org/debian/dists/woody/main/disks-hppa/current/32
and file: images-1.44/rescue.bin everything exited cleanly.

 Now it's prompting to "Configure Device Driver
Modules" and am getting the following error:

No modules were found in /target/lib/modules/2.4.9-32 that
could be configured. Please install the kernel modules
first, by running the "Configure Device Driver Modules"
step.

 And it brings me back to the "Configure Device Driver Modules" prompt.

 Kowtow,

--
Yashy

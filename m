Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.quango.net (unknown [63.102.227.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 173EC482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 02:13:11 -0700 (MST)
Received: from shiftright.mail.quango.net [24.55.42.220] by quango.net [63.102.227.120]
	with SMTP (MDaemon.v3.5.1.R)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 03 Jan 2002 01:06:02 -0800
Message-Id: <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
Date: Thu, 03 Jan 2002 01:12:26 -0800
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
From: Bill Ferguson <ferguson@quango.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Reply-To: ferguson@quango.net
Subject: [parisc-linux] Upgrading 715/100 Firmware
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

I know this has been asked a zillion times but bear with me.  I'm pretty 
new to Linux, but familar with many other operating systems.

I've got debian 0.9.3 installed on a 715/100.  Seems to work pretty well.

My question relates to getting the firmware to a "scratch disk"  which 
Grant speaks of in the archives (in my case sda1 set to type F0).  sdb1, 
sdb2, sdb3, sdb4 are the disks where the Linux install resides.

Is type F0 the correct type to load firmware from?  Is there any parameters 
other than:
dd if=c7x50016.frm of=/dev/sda1   ?   Do I need a block size parameter? eg 
bs=2k like it says with tape?    Does sda1 need to be mounted first before 
using dd ?  How does one mount an F0 disk?   What does F0 mean?  Is it HP 
format?

I've tried booting from bootp, cdrom, tape, and now scratch disk and I 
can't get the LIF image to work.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA26720
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Oct 1999 01:07:26 -0600
Received: from ws-exch03.madge.com (ws-exch03.dev.madge.com) by mail.madge.com
 (Content Technologies SMTPRS 2.0.15) with ESMTP id <B0001295166@mail.madge.com> for <parisc-linux@thepuffingroup.com>;
 Tue, 05 Oct 1999 08:03:24 +0100
Message-Id: <4110BC526A58D211B56C0000F6B9636D01B0DABA@ws-exch01.dev.madge.com>
From: Tom Gallagher <Tom.Gallagher@madge.com>
To: "'PALinux'" <parisc-linux@thepuffingroup.com>
Date: Tue, 5 Oct 1999 07:56:44 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Newbie
List-ID: <linux-parisc.vger.kernel.org>

I am interested in this project and I could help by testing things on my
machine.

FYI:-

I have just acquired a 712/80 HP machine.
It is running HPUX 9.07 at the moment.
The initial boot ROM screen says ROM v1.5 and 32MB RAM.

I managed to netboot Image-19990930 but it failed with the
message "In swapper task - not syncing".  This occurred quite a way into the
kernel.  (I did not save output from the kernel as I do not have a serial
console setup yet).

The kernel appeared to only detect 16MB of RAM.

I downloaded the Intel egcs cross compiler and binutils RPMs and installed
them, but have only had limited success compiling so far.

I downloaded the latest (at the time) kernel tarball (about 30 september).

I got a linker message about $global$ undefined which I traced back to
arch/parisc/kernel/pdc.c.  (Cross compiling from Intel Linux).

Some Questions:-

I managed to build an ELF kernel on my Intel machine.  I built the ipl
program under HPUX v9.07 and obviously I came across the message about ELF
kernels not supported that the ipl program prints out when I tried to boot
it.

I notice in the source code that it says ELF loading is not supported yet
but it doesn't matter because the cross compiler utilities that produce ELF
executables don't work yet.  Is this (still) true?  
In all the docs on the puffin web site HPUX 10 and 11 are referred to but
nothing as old as 9!
Is it possible to build a bootable kernel on either Intel Linux or HPUX
v9.07?

Does the kernel work with a serial console if I was to set it in the BOOT
ROM to use the console on a serial port.

Thanks for your patience with what are conceivably obvious questions.

>From Tom
 

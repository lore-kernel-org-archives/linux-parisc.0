Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hornet.am.qub.ac.uk (hornet.am.qub.ac.uk [143.117.23.48])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C2B6482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 May 2001 03:51:49 -0600 (MDT)
Received: from am.qub.ac.uk (meta.am.qub.ac.uk [143.117.23.208])
	by hornet.am.qub.ac.uk (8.8.7/8.8.7) with ESMTP id KAA17194
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 May 2001 10:51:55 +0100
Sender: derekw@hornet.am.qub.ac.uk
Message-ID: <3B14C2B3.6176C2E@am.qub.ac.uk>
Date: Wed, 30 May 2001 10:51:47 +0100
From: Derek Wilson <derek.wilson@am.qub.ac.uk>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting palinux-0.6.1-32STI ISO on HP 705 problem (failed to load
 kernel)
List-ID: <linux-parisc.vger.kernel.org>

Hello


First of all, thank you to everyone working on parisc-linux.

I have been asked to install linux on a few HP 700 machines. I was
recommended to try a 705 machine first as it had a CDROM and reportedly
worked well. It has 32 MB of RAM, hard disk size unknown.  It boots into
the CDE login screen without any problems, as far as I can tell. We
don't know the root password, or usernames and their passwords.

I downloaded the palinux-0.6.1-32STI.iso.gz file from
ftp://puffin.external.hp.com/pub/parisc/cd-images
and burned it to CD. I then tryed booting this CD from the CDROM on the
705 machine. It seemed to access the CDROM for a few seconds then die.
This is the output sent to the monitor


Trying scsi.2.0
Boot path initialised
Attempting to load IPL

Hard booted
palo ipl debackex@pc5158a Wed Apr 11 17:56:43 CEST 2001
0/vmlinux 2652553 bytes @ 0xafa800
0/palo-cmdline '0/vmlinux ROOT=/ TERM=linux root=/dev/scd0 console=tty
ramdisk=8192'
kernel: partition 0 file /vmlinux
ELF32 executable
Entry 00100000 first 00100000 n 5
Sement 0 load 00100000 size 1533364   mediaptr 0x1000
Sement 1 load 00278000 size 202856     mediaptr 0x178000
Sement 2 load 002ac000 size 21904       mediaptr 0x1aa000
Sement 3 load 002e4000 size 8192         mediaptr 0x1e0000
Sement 4 load 00326aa8 size 76560       mediaptr 0x1e2aa8

ERROR: Read from boot device failed (status = -4).
byteio_read: seekread() returned -1 expected 2048
ERROR: Segment 0 read() failed Fatal error loading kernel ex
failed to load kernel

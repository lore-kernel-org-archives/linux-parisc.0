Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0230F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Sep 2002 08:15:37 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id QAA12954 for <parisc-linux@lists.parisc-linux.org>; Fri, 6 Sep 2002 16:15:36 +0200 (MET DST)
Message-Id: <sd78d3a1.013@ms-zrt1>
Date: Fri, 06 Sep 2002 16:00:22 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <smithjames@comcast.net>, <parisc-linux@lists.parisc-linux.org>
Subject: Betr.: [parisc-linux] Formatting Scsi disks
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

>I had an odd thing happen.....
>
>i took a disk out of a 712 & had it in a mac for a while
>when i put it back into the 712, & tried to put linux back on it, it got =
as
>far as fdisk which then said that it couldnt write a partition table to =
it
>
>the disk still works in the mac - am i missing something daft here ?
>
>the search command from the boot console on the 712 sees the disk
>the kernel sees & correctly identifies the disk
>
>just wont partition it
>
>
>any ideas?
>
try zeroing out the first few blocks:

dd if=3D/dev/zero of=3D/dev/offending_scsi_drive bs=3D512 count=3D4

(think if you need a backup before you do this!)

Good luck,
Jurriaan

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from easy.in-chemnitz.de (www.in-chemnitz.de [213.187.65.136])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35952482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 06:47:40 -0600 (MDT)
Received: (from uucp@localhost)
	by easy.in-chemnitz.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with UUCP id f81CldS28188
	for parisc-linux@lists.parisc-linux.org; Sat, 1 Sep 2001 14:47:39 +0200
Received: from genesis (genesis [192.168.80.3]) by malcolm.in-chemnitz.de (8.7.6/8.7.3) with SMTP id OAA01239 for <parisc-linux@lists.parisc-linux.org>; Sat, 1 Sep 2001 14:44:21 +0200
From: =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sat, 1 Sep 2001 14:45:25 +0200
Message-ID: <000001c132e4$2ee29ca0$0350a8c0@genesis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] HP712/60 Hang when booting over the network
List-ID: <linux-parisc.vger.kernel.org>

Hallo,

I've download the last lifimage - 0.9.2 Network Install ISO -. My bootp
server is a Linux box. I think, that I've installed properly, because my 712
find this lifimage and load it for a while. I can see this at my HUB, than
it hangs ...

I've got a HP712/60 with graphic display, no seriell console connected.
Where is the mistake hide?

Look at the output when booting from lan:

---snip---

BOOT_ADMIN> bo lan



palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
0/vmlinux32 2853588 bytes @ 0x154c000
0/vmlinux64 3585851 bytes @ 0x1805000
0/ramdisk 1991209 bytes @ 0x1b70800

Command line: 'root=/dev/ram console=tty0 sti=0 sti_font=VGA9x16 TERM=linux'

Kernel: partition 0 file /vmlinux
Ramdisk: partition 0 file /ramdisk
Warning: kernel name doesn't end with 32 or 64... Guessing Annoyance:
Firmware
does not support PDV_MODEL_CAPABILITIES cell
32

ERROR: Read from boot device failed (status = -3).
byteio_read: seekread() returned -1 expected 2048

ERROR: Read from boot device failed (status = -3).
byteio_read: seekread() returned -1 expected 2048
Couldn't grok your kernel executable format
failed to load kernel

---snip---

Andreas

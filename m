Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 489CF4837
	for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 00:16:08 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id IAA00790 for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 08:16:06 +0200 (MET DST)
Message-Id: <sbb2dfde.073@ms-zrt1>
Date: Thu, 27 Sep 2001 08:05:09 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <ra@hp.is>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: Betr.: Re: [parisc-linux] Trace/breakpoint trap
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>bofh:/usr/src/linux# ls -l /boot
>total 7083
>-rw-r--r--    1 root     root       593072 Sep 21 15:04 System.map-2.4.0
>-rw-r--r--    1 root     disk       561861 Sep 21 21:12 System.map-2.4.9
>-rw-r--r--    1 root     root         3949 Sep 21 15:04 config-2.4.0
>drwxr-xr-x    2 root     root        12288 Sep 21 15:02 lost+found
>-rw-r--r--    1 root     root      2853588 Sep 21 15:04 vmlinux-2.4.0
>-rwxr-xr-x    1 root     disk      3191078 Sep 21 21:12 vmlinux-2.4.9
>
>
>I still have the old kernel in there. How do I get palo to boot it ?
>
The easiest way to do it once is to interrupt the booting right at the =
start,
interrupting the automatic boot, then type

BOOT
and when asked if you want to interact with the IPL, answer Y.

Then edit the parameter where your kernel-name is. I have to use ^H to =
delete characters.

Good luck,
Jurriaan

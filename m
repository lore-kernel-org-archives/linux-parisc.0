Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10439482B
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 04:58:00 -0600 (MDT)
Date: Wed, 26 Sep 2001 10:57:57 +0000
From: Richard Allen <ra@hp.is>
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Betr.: Re: [parisc-linux] Trace/breakpoint trap
Message-ID: <20010926105757.B16693@hp.is>
References: <sbb18da2.041@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sbb18da2.041@ms-zrt1>; from Jurriaan.Kalkman@zrt.nl on Wed, Sep 26, 2001 at 08:05:23AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 26, 2001 at 08:05:23AM +0200, Jurriaan Kalkman wrote:

> Perhaps recompiling your kernel also fixes it?

Damn...    I edited .config by hand, but Im still in a damn mess.

bofh:/usr/src/linux# make clean
Trace/breakpoint trap
bofh:/usr/src/linux# make oldconfig
Trace/breakpoint trap
bofh:/usr/src/linux# make dep
Trace/breakpoint trap


bofh:/usr/src/linux# cat /etc/palo.conf
# obsolete with palo-0.94 # --bootloader=/boot/iplboot
--commandline=2/vmlinux-2.4.9 root=/dev/sda4 HOME=/
--recoverykernel=/boot/vmlinux-2.4.0
--init-partitioned=/dev/sda

bofh:/usr/src/linux# ls -l /boot
total 7083
-rw-r--r--    1 root     root       593072 Sep 21 15:04 System.map-2.4.0
-rw-r--r--    1 root     disk       561861 Sep 21 21:12 System.map-2.4.9
-rw-r--r--    1 root     root         3949 Sep 21 15:04 config-2.4.0
drwxr-xr-x    2 root     root        12288 Sep 21 15:02 lost+found
-rw-r--r--    1 root     root      2853588 Sep 21 15:04 vmlinux-2.4.0
-rwxr-xr-x    1 root     disk      3191078 Sep 21 21:12 vmlinux-2.4.9


I still have the old kernel in there. How do I get palo to boot it ?


-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.

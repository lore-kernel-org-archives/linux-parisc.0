From: John David Anglin <dave.anglin@bell.net>
Subject: Debian vmlinux-4.14.0-1-parisc64-smp fails to boot on c3750
Date: Sun, 3 Dec 2017 11:54:53 -0500
Message-ID: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fails early, probably in palo.  I don't have a boot log as the machine has a graphics console.

ii  linux-image-4.13.0-1-parisc64-smp          4.13.13-1     hppa         Linux 4.13 for multiprocessor 64-bit PA-RISC
ii  linux-image-4.14.0-1-parisc64-smp          4.14.2-1      hppa         Linux 4.14 for multiprocessor 64-bit PA-RISC

The 4.13.13-1 kernel boots okay.

root@hiauly6:/var/log# dpkg -l palo
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                               Version                Architecture           Description
+++-==================================-======================-======================-=========================================================================
ii  palo                               1.99                   hppa                   Linux boot loader for HP PA-RISC

Dave
--
John David Anglin	dave.anglin@bell.net




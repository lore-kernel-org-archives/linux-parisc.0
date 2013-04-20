From: Paolo Borsa <samvise@hobbiton.it>
Subject: is a 64 bit linux kernel possible?
Date: Sat, 20 Apr 2013 19:50:00 +0200
Message-ID: <CAOU17uOgmenAJU+tqLo7npM7eRTQwBUGv=cc0rq7ZrZZA9rjyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi, I have an HP C3750 with 875Mhz PA8700+ cpu. I'm currently running
debian lenny with kernel 2.6.26 32 bit. I am trying to compile and run
the last linux kernel, 3.8.7, compiled with 64 bit kernel flag
enabled. The compilation succeed, and with file vmlinux I get:
vmlinux: ELF 64-bit MSB executable, PA-RISC 2.0 (LP64) version 1
(GNU/Linux), statically linked, not stripped

after copying it to /boot partition and rebooted the machine, I
instructed palo to load this new kernel. Unfortunately it doesn't
work, I have a serial console and the last message I see is palo
saying "If this is the last message you see, you may need to switch to
your console...."
On the lcd display of the c3750 I see "bus error". Eventually I had to
do an hard reset and come back to the previous kernel.
I don't know if the problem is because the machine doesn't support 64
bit kernel (although I think it should) or because there's some
misconfiguration in the linux kernel.
Has anybody had a similar experience?
Thanks

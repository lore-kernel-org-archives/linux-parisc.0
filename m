From: Meelis Roos <mroos@linux.ee>
Subject: WARNING: Out of order unwind entry!
Date: Mon, 10 Jan 2011 10:25:31 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1101101019020.27086@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I'm trying the newest kernel (2.6.37+git) on 64-bit parisc after a long 
pause. The good news is that PCI resource allocatrion problem with tulip 
(that was biting me at about 2.6.30-31 timeframe) has been fixed.

Generally it seems to run good but I get a couple of warnings in dmesg. 
The first is a bunch of warnings about out of order unwind entries:

[    0.000000] unwind_init: start = 0x4050f000, end = 0x4053cef0, entries = 11759
[    0.000000] WARNING: Out of order unwind entry! 0000000040510720 and 0000000040510730
[    0.000000] WARNING: Out of order unwind entry! 0000000040510730 and 0000000040510740
[    0.000000] WARNING: Out of order unwind entry! 0000000040511330 and 0000000040511340
[    0.000000] WARNING: Out of order unwind entry! 0000000040511340 and 0000000040511350

Is this report any good or should I provide vmlinux or some other debug 
output? Or if it is known anyway then please just ignore my report.

-- 
Meelis Roos (mroos@linux.ee)

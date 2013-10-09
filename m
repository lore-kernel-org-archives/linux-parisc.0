From: Helge Deller <deller@gmx.de>
Subject: New palo version 1.92 handles long kernel command lines
Date: Wed, 09 Oct 2013 22:03:25 +0200
Message-ID: <5255B68D.7090009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

I've uploaded a new palo version 1.92 to the debian archive at 
parisc-linux.org which is able to handle kernel command line
lengths of up to a total of 1024 bytes.
This should resolve some problems if you e.g. want to provide the
UUID of hard disks on the kernel command line.

Please let me know if you see any problems.

A precompiled version is here:
http://www.parisc-linux.org/~deller/palo_1.92_hppa.deb

And the source is currently in the "cmdline" branch of
http://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/
and will be merged into the master branch during the next few days.

Helge

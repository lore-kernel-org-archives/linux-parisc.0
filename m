From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] i386 cross-compiler for hppa/hppa64 ?
Date: Thu, 16 Sep 2004 10:38:12 -0400
Message-ID: <20040916143812.GB28936@baldric.uwo.ca>
References: <200409152113.57033.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <carlos@baldric.uwo.ca>
In-Reply-To: <200409152113.57033.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

> The cross-compiler section on the parisc homepage at http://parisc-linux.org/software/index.html#xcs links to 
> http://ftp.parisc-linux.org/x86-xcompilers/   and  
> ESIEE Team's download page at http://www.pateam.org/download.html#deb

If you have time...
http://www.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html

I recommend Dan Kegel's crosstools and build one using his
infrastructure please :) His tools autobuild everything and it will take
only time to compile the tree. I haven't done this myself because I
don't need an x86->hppa but I might set crosstools to run today on my
dual cpu box at the office.

c.

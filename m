From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] i386 cross-compiler for hppa/hppa64 ?
Date: Fri, 17 Sep 2004 19:36:11 +0200
Message-ID: <200409171936.11573.deller@gmx.de>
References: <200409152113.57033.deller@gmx.de>
	<20040916143812.GB28936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040916143812.GB28936@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

On Thursday 16 September 2004 16:38, Carlos O'Donell wrote:
> > The cross-compiler section on the parisc homepage at http://parisc-linux.org/software/index.html#xcs links to 
> > http://ftp.parisc-linux.org/x86-xcompilers/   and  
> > ESIEE Team's download page at http://www.pateam.org/download.html#deb
> 
> If you have time...
> http://www.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html

Even without the above URL I was able to build myself a x86-hppa crosscompiler :-)

It's available here for download now (~26MB):
ftp://ftp.parisc-linux.org/x86-xcompilers/xc-20040917-hppa32.tgz

Some notes:
- x86 -> hppa (32bit only!)
- based on DEBIAN's hppa binutils and gcc3.3 packages (look at the README in the archive)
- only for cross-compiling Linux kernels
- unpack in /opt and add /opt/palinux33/bin to your $PATH

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

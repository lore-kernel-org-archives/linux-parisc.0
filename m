Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 733DD4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 15:53:05 -0700 (MST)
Sender: plattner@dns2.dot.at
Message-ID: <3A8320E7.CF0F64A3@dot.at>
Date: Thu, 08 Feb 2001 23:42:47 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: Christoph Plattner <christoph.plattner@alcatel.at>,
	Richard Hirst <rhirst@linuxcare.com>,
	Grant Grundler <grundler@cup.hp.com>,
	"M. Grabert" <xam@deathsdoor.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] //strace// Generic Parisc Linux Kernel Questions&  
 9000/730 success report
References: <Pine.LNX.4.21.0102080959100.7974-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Again, I have problems with strace:
-----------------------------------

(0) autoconf is ok
    automake reports errors... (I think I need that !)

configure.in: 86: `automake requires `AM_CONFIG_HEADER', not
`AC_CONFIG_HEADER'
automake: configure.in: `PACKAGE' not defined in configure.in
automake: configure.in: `VERSION' not defined in configure.in
automake: configure.in: required file `./mkinstalldirs' not found
automake: configure.in: required file `./missing' not found
automake: no `Makefile.am' found or specified


(1) The `configure' scripts reports 2 problems

bash# HOSTCC=gcc CC=hppa-linux-gcc ../configure --target=hppa-linux
--host=hppa-linux
:
:
creating Makefile
creating linux/Makefile
sed: can't read ./linux/Makefile.in: No such file or directory
creating config.h
cat: ./config.h.in: No such file or directory

(2) make fails fully ... (this is the full log of make !!)

hppa-linux-gcc -Wall -DHAVE_CONFIG_H   -I. -Ilinux/hppa -I./linux/hppa
-Ilinux -I./linux -D_GNU_SOURCE  -c strace.c
defs.h:421: conflicting types for `strerror'
/usr/parisc/hppa-linux/include/string.h:229: previous declaration of
`strerror'
defs.h:424: conflicting types for `strsignal'
/usr/parisc/hppa-linux/include/string.h:306: previous declaration of
`strsignal'
strace.c:1005: conflicting types for `sys_errlist'
/usr/parisc/hppa-linux/include/stdio.h:564: previous declaration of
`sys_errlist'
strace.c:1009: parse error before '(' token
strace.c:1029: conflicting types for `sys_siglist'
/usr/parisc/hppa-linux/include/signal.h:281: previous declaration of
`sys_siglist'
make: *** [strace.o] Error 1

		
I have the glibc built cross (I built also the toolchain). The stuff was
from the
snapshot of the Jan 13th 2001 !!
The toolchain works very well !

Have I a wrong glibc version, or is strace not ready for my version yet
??

With friendly regards
	Christoph




Alan Modra wrote:
> 
> On Wed, 7 Feb 2001, Christoph Plattner wrote:
> 
> > I was definitly not able to build strace with the current tool chain
> > (I have built myself from Jan 13, 2001). The system calls and other
> > parts seem not to be compatible any more....
> 
> Did you build glibc too?  I should own up to breaking our CVS glibc with
> 
> revision 1.3
> date: 2001/01/16 14:09:38
> 
> and not fixing it until
> 
> revision 1.4
> date: 2001/02/05 14:58:22
> 
> Alan (Embarrassed) Modra
> --
> Linuxcare.  Support for the Revolution.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA12590
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 15:44:50 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 21:46:20 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13BlMY-0001IS-00
	for <parisc-linux@thepuffingroup.com>; Mon, 10 Jul 2000 17:45:14 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Jul 2000 17:45:14 -0400
Message-ID: <87og45bqxh.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Architecture string change
List-ID: <linux-parisc.vger.kernel.org>

Hi,

In keeping with the way things are done on other Linux platforms, I
would like us to start using the following architecture strings for
configuring our compilers:

32-bit userland and kernel, PA1.1: hppa-linux
64-bit kernel, PA2.0:              hppa64-linux

I guess this means that I volunteer to update the recipes on the
website :-)

config.guess will return a more detailed string, such as
'hppa2.0-unknown-linux-gnu', but these should be the canonical,
lowest-common-denominator strings.  In particular, we should revise
the recipes and such to use them and configure dpkg-architecture to
set DEB_GNU_HOST_ARCH to 'hppa-linux'.

I have not been able to get a solid answer out of anyone regarding
whether it is possible or desireable to use 'parisc-' instead of
'hppa-', so I will leave it as 'hppa' for the time being.  It is easy
enough to make 'parisc' an alias for 'hppa' if we want to.

Some pros and cons of using 'parisc' vs. 'hppa':

 * Pro: hppa*-linux targets produce very different 32-bit object code,
   as well as different 64-bit assembly code, so it may be beneficial
   to distinguish them from other PA-RISC targets.

 * Pro: I'm told that people at HP want to use 'parisc'.  Could those
   people please stand up :-)

 * Con: config.guess [1] will presumably return hppa*-*-linux-gnu.

 * Con: Every other operating system on PA-RISC uses hppa*-*-*.

(I know there are some more but I can't think of them right now)

Please remember that, now that we are entering userspace, any
decisions of this sort that we make are going to stick with us
forever. [2]

[1] Which I can't actually run since our page fault handler is broken:

> /bin/sh config.guess

do_page_fault() pid=8 command='sh'
                                  
Bad Address (null pointer deref?): Code=15 regs=c7e5c248 (Addr=00000001)
                                                                        
PSW  : 0004f80b  GR 1 : 00090350  GR 2 : 00007f4f  GR 3 : 00092e28  
GR 4 : 00000000  GR 5 : 00092b50  GR 6 : 00000019  GR 7 : 0000000e  
GR 8 : 00000001  GR 9 : 00092e28  GR10 : ffffffff  GR11 : 200206e2  
GR12 : 0000000a  GR13 : 00094b50  GR14 : 0007f621  GR15 : 00000000  
GR16 : 00094f0c  GR17 : 00000000  GR18 : 0000000e  GR19 : 00000001  
GR20 : 40100868  GR21 : 00000001  GR22 : 00000000  GR23 : 40100030  
GR24 : 40100848  GR25 : 00000020  GR26 : 40100010  GR27 : 0008f350  
GR28 : 40100850  GR29 : 00000001  GR30 : 20020880  GR31 : 000171d7  
SR0  : 00002001  SR1  : 00002001  SR2  : 00000100  SR3  : 00002001  
SR4  : 00002001  SR5  : 00002001  SR6  : 00002001  SR7  : 00002001  
                                                                    
IASQ : 00002001 00002001 IAOQ : 00007f53 00007f57
 IIR : 0e7c1280 ISR : 00002001 IOR : 00000001    

[2] A good example of this is how the soname for glibc is
'libc.so.6.1' on Linux/alpha instead of 'libc.so.6' due to a screwup
in an early Red Hat distribution...

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

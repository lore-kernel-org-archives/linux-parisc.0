Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id C048E4838
	for <parisc-linux@parisc-linux.org>; Tue, 12 Feb 2002 09:55:52 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id KAA27790
	for <parisc-linux@parisc-linux.org>; Tue, 12 Feb 2002 10:55:41 -0600
Date: Tue, 12 Feb 2002 10:55:41 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] lp0 kablooie (new kernel)
Message-ID: <Pine.LNX.4.21.0202121054260.27781-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 9 Feb 2002, Grant Grundler wrote:

> Greg Ingram wrote:
> > 
> > Writing data from my C100 to /dev/lp0 makes the kernel go kablooie.  It's
> > the kernel from the recent (0.9.3?) iso.  Known problem?  Any more info I
> > could supply that would help?  I've appended everything on the console
> > from the crash, through the power cycle, to mounting disks again.  
> 
> Can you grab a newer kernel from ftp://ftp.parisc-linux.org/kernels/32/
> and try that?
> 
> 0.9.3 is just not worth chasing at this point.

Yikes!

apollos:~# uname -a
Linux apollos 2.4.17-pa23 #1 Sun Feb 10 09:24:11 MST 2002 parisc unknown
apollos:~# echo >/dev/lp0
lp0: compatibility mode
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x27eb0000 to 0x27eb4740:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x27ef8000 to 0x27eff180:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x27ef8000 to 0x27eff5c0:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

[ about 50 more screens full of similar, until: ]

Dumping Stack from 0x27f28000 to 0x27f28000:

Kernel Fault: Code=15 regs=17f28000 (Addr=27f20004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000111100001110 Not tainted
r00-03  00000000 102f4810 10102494 27f20000
r04-07  102ae800 27f20000 27f27bc0 00000000
r08-11  00000000 10309810 103099e4 00000000
r12-15  103099e0 000c8408 1003a260 148f6000
r16-19  17f27bc0 000b9f04 00017800 00000000
r20-23  14e1c000 00011560 00000000 102f5810
r24-27  00000001 00000001 102f5ae0 102e2010
r28-31  00000030 0000d560 17f28000 101196c0
sr0-3   00000000 00000335 00000000 00000335
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10101e60 10101e64
 IIR: 0c681097    ISR: 00000000  IOR: 27f20004
 CPU:        0   CR30: 17eb4000 CR31: 10390000
 ORIG_R28: 868023a8

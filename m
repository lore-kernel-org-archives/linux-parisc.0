Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0362F4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Nov 2002 06:52:16 -0700 (MST)
Date: Thu, 7 Nov 2002 08:52:22 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20021107135222.GD4465@systemhalted>
References: <20021107054204.GA4465@systemhalted> <3DA3DE66000045F4@ocpmta4.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DA3DE66000045F4@ocpmta4.be.tiscali.com>
Subject: [parisc-linux] [Trap 26 -> EXT3?][If you feel bored, test these 2.5 changes...]
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

Joel,

Wow, you added those changes and EXT3 stopped functioning? :}
Please revert the patch and try to build/boot a kernel again.

Code 26 -> "Data Memory Access Rights" trap, looks like a 
misbehaving EXT3.

c.

> >- Added the last enumerations to the cpu list.
> >	= These are probably incorrect.
> >
> >- Forward port of trap handler changes.
> >	= Virtually identical to 2.4 code which 
> >	= has been running for almost 5 months without
> >	= problems.
> >
> >- Added a code comment about non-returning functions.
> >	= Purely cosmetic...
> >
> Sorry but after the boot flop on my b2000, I try on a b180 but no more success:
> Freeing unused kernel memory: 416k freed
> Warning: unable to open an initial console.
> Unable to find swap-space signature
> EXT3 FS 2.4-0.9.16, 02 Dec 2001 on md(9,0), internal journal
> 
> Stack Dump:
>  178f4300:  0006ff0f 00000000 00000000 00000000 
>  178f42f0:  00000000 10262010 00000000 00000000           
>  178f42e0:  106698c0 178f4210 00000000 178f4230           
>  178f42d0:  178f4110 00000000 178f4210 17ff7760           
>  178f42c0:  fffffff4 17c6c2c0 178f3988 17c6c2a0           
>  178f42b0:  178f3680 101613d4 000002b1 178f3988 
>  178f42a0:  17c6c2c0 10097c00 fffffffa 00000000 
>  178f4290:  1066e600 00000812 17b7b1a0 1066e680 
>  178f4280:  00000931 00000003 01c048f0 00000004 
>  178f4270:  1066b005 10262ee0 40177000 17aaf9a0 
>  178f4260:  17ff7760 40194000 178fec20 17aaf9a0 
>  178f4250:  17ff7760 178f4190 00000000 00000000 
> 
> Kernel addresses on the stack:
>  [<10262010>]  [<101613d4>]  [<10262ee0>]  [<102111fc>] 
>  [<1015de7c>]  [<10166e40>]  [<1010b008>]  [<1010a094>] 
> 
> 
> Kernel Fault: Code=26 regs=178f4300 (Addr=00000204)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001101111111100001111 Not tainted
> r00-03  00000000 1034f010 10262010 17eec260
> r04-07  00000000 1034f010 00000812 1034f4b4
> r08-11  1030a800 00000812 00027d40 000e0008
> r12-15  00000008 000e04c8 000e0888 000e0648
> r16-19  00000000 000d2430 0009e800 00000200
> r20-23  1034f4b4 00000000 00000000 00000000
> r24-27  00000000 00001000 178ec000 1031e010
> r28-31  17eec260 b870fe25 178f4300 10044a78
> sr0-3   00000000 0000010e 00000000 0000010e
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 102620d0 102620d4
>  IIR: 0e681094    ISR: 00000000  IOR: 00000204
>  CPU:        0   CR30: 178f4000 CR31: 1035b000
>  ORIG_R28: 00000008
> 
> Joel
> 
> PS: I will see to backport on 2.4.20-rc1
> 

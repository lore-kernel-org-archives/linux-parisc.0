Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA02464
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Dec 2000 18:01:38 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 7BAA3108C
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 20:04:51 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 750FF37C97
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 18:06:46 -0700 (MST)
To: parisc-linux@thepuffingroup.com
In-Reply-To: Message from Matt Taggart <taggart@carmen.fc.hp.com>
   of "Wed, 27 Dec 2000 15:41:53 MST." <20001227224153.5F22637C97@carmen.fc.hp.com>
References: <3A4940BF.3EB18F61@dot.at> <20001227012741.A150937C97@carmen.fc.hp.com> <20001227043446.6DCFD37C97@carmen.fc.hp.com> <20001227205917.CF5B037C97@carmen.fc.hp.com>  <20001227224153.5F22637C97@carmen.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 29 Dec 2000 18:06:46 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001230010646.750FF37C97@carmen.fc.hp.com>
Subject: [parisc-linux] Native compiler doesn't work with new kernel
List-ID: <linux-parisc.vger.kernel.org>


Matt Taggart writes...

> It seems to just be the xcompiled static bash I built. I xcompiled sash and it
> worked ok. I setup an nfsroot with a bunch of stuff I had cross-compiled and 
> except for bash and a couple other things, it's working normally. I will try 
> compiling bash native and see if that helps.

OK, since I have a mostly-working nfsroot and a cross-built toolchain I tried 
running gcc. I just tried "gcc -o hello hellow.c" where hellow.c is the hello 
world program from cvs->userspace. The compiler dies with signal 6(abort). The 
system is also pretty erratic, sometimes the prompt takes a few minutes to 
return.(once with an out-of-memory error)

Someone suggested that I try an older kernel from before the stack changes 
were made eariler this month, so I tried an old kernel I had around(built with 
an old xc). Now gcc gets a little further, but dies with,

------------------------------------------------------------------------------
do_page_fault() pid=18 command='ld'


     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 fffffff4 000368d7 00107060
r4-7     00000005 000ef790 00125368 00000000
r8-11    000e3438 00000000 00105ca0 00000031
r12-15   000d9ea8 00000000 00107060 000e3120
r16-19   000fa0c0 00106838 00000000 00000000
r20-23   001067e8 00000000 0002cc50 00107060
r24-27   000fa0c0 000d9ea8 000e3120 000d7770
r28-31   00105ca0 00000002 20020500 000368d7
sr0-4    00000000 00000004 00000000 00000004
sr4-8    00000004 00000004 00000004 00000004

IASQ: 00000004 00000004 IAOQ: 0002d5bf 0002d5c3
 IIR: 0e752087    ISR: 00000004  IOR: 00000000
ORIG_R28: 00000000
collect2: ld terminated with signal 11 [Segmentation fault], core dumped
------------------------------------------------------------------------------

I also wanted to try the older kernel bits built with the new xc but I 
couldn't remember the -ffunction-section magic to make it work.

If other people want to play with this I have put my new nfsroots at,

ftp://puffin.external.hp.com/pub/parisc/debug/base-20001227.tar.gz [25MB]
ftp://puffin.external.hp.com/pub/parisc/debug/nfsroot-20001227.tar.gz [59MB]

-- 
Matt Taggart
taggart@fc.hp.com

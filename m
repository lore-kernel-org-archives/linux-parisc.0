Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09BB34842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 08:57:53 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15mcbo-0006D6-00; Thu, 27 Sep 2001 15:57:52 +0100
Date: Thu, 27 Sep 2001 15:57:52 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Allen <ra@hp.is>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] More strange problems
Message-ID: <20010927155752.D16096@parcelfarce.linux.theplanet.co.uk>
References: <20010927113453.F16693@hp.is> <20010927142943.A16096@parcelfarce.linux.theplanet.co.uk> <20010927143556.K16693@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010927143556.K16693@hp.is>; from ra@hp.is on Thu, Sep 27, 2001 at 02:35:56PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 02:35:56PM +0000, Richard Allen wrote:
> Is there any way for a non kernel guru like myself to get any info out
> of those errors in dmesg ?

Sure..

> do_page_fault() pid=2132 command='rpm' type=15 address=0x00000024

`address=0x00000024' -- it's a NULL pointer dereference.

>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111
> r0-3     00000000 00000008 0007c7b7 bff00938
> r4-7     001b8000 00000009 00207510 0020758c
> r8-11    00002001 00205fe0 bff007f4 001ffa10
> r12-15   001de270 00000000 bff004c4 00000102
> r16-19   00000000 001f65e0 00205fe0 001b8000
> r20-23   01010101 00205fdc 80808080 00000006
> r24-27   bff00938 00000009 00000000 001dca70
> r28-31   001e3238 00000000 bff009f0 00059457
> sr0-3    00000014 00000014 00000000 00000014
> sr4-7    00000014 00000014 00000014 00000014
> 
> IASQ: 00000014 00000014 IAOQ: 0007c7c3 0007c7c7

`IASQ: 00000014' -- 0 means kernel, anything else is a user process.
`IAOQ: 0007c7c3' -- bottom 2 bits set, so we're in user mode too (good!).

>  IIR: 48340038    ISR: 00000014  IOR: 00000024
>  CPU:        0   CR30: 29164000 CR31: 10350000
>  ORIG_R28: 00206000

The truly dedicated will decode IIR to see what instruction it was,
cross-check which register in the dump was wrong then try to debug
the program.

-- 
Revolutions do not require corporate support.

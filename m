Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: DJ Tha Muggs <djmuggs@mail.cvee.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] IDE Harddisks in a C3K 
In-Reply-To: Message from DJ Tha Muggs <djmuggs@mail.cvee.org>
   of "Sun, 31 Mar 2002 14:48:48 +0200." <20020331124848.GA291@cvee.org>
References: <20020331124848.GA291@cvee.org> 
Date: Sun, 31 Mar 2002 21:32:53 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020401043253.6579C484E@dsl2.external.hp.com>
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

DJ Tha Muggs wrote:
> Anyone experienced with using IDE hdd's in a C3K?

Not me. I've only used the CD-ROM drive.
Note that suckyio got it's nick name for a reason.
I'm not sure I'd trust R/W data behind that interface.
Maybe if I could beat on it for a few days without errors,
I might change my mind. But I've got no incentive to do so.

> Are IDE badly supported or no one realy tried it yet?

probably both. 

> <stack dump>
> WARNING! Stack pointer and cr30 do not correspond!

This msg probably means a driver referenced a user space
pointer without copy_from_user() or changing the "DS".

...
> Dumping virtual address stack instead
> 
> Dumping Stack from 0x2a858000 to 0x2a8586c0:

*sigh*. I'm looking forward to stack unwinds under kdb.

...
> Kernel Fault: Code=26 regs=1a8586c0 (Addr=00000007)

variant of a data page fault.

> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001101111111100001111 Not tainted
> r00-03  00000000 1031f810 1012ddc8 ffffffff

Return Pointer of most recent subroutine call.

> r20-23  0000009f 00000044 00000131 2ff00000
> r24-27  ffffffff 00000001 263ff120 10304010

Args are in r26, r25, ...

> IASQ: 00000000 00000000 IAOQ: 1012ae24 1012ae28

1012ae24 is address of faulting instruction.
Start here.

grant

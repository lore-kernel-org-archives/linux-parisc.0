Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id AAA09792
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 00:54:42 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id VAA24859
	for <hppa-linux@thepuffingroup.com>; Wed, 17 Mar 1999 21:53:58 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8S0E000.7L5 for <hppa-linux@thepuffingroup.com>; Wed, 17 Mar
          1999 21:54:00 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F09569.F609A7B3@netscape.com>
Date: Thu, 18 Mar 1999 00:55:53 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] memory layout
References: <Pine.LNX.3.96.990317212138.2685A-100000@quark.ix.netcom.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Kumar wrote:
> 
> Talking about only pa1.1 or 32 bit CPUs, I would say the same layout
> can be used as Linux on Intel does. That is kernel mapped at 0xc0000000.
> So 3 Gig for User space and 1 Gig for kernel. Of course, other ppl may
> have different ideas.

OpenBSD has the same idea, it seems.  From
sys/arch/hppa/include/vmparam.h:

/* user/kernel map constants */
#define VM_MIN_ADDRESS          ((vm_offset_t)0)
#define VM_MAXUSER_ADDRESS      ((vm_offset_t)0xc0000000)
#define VM_MAX_ADDRESS          VM_MAXUSER_ADDRESS
#define VM_MIN_KERNEL_ADDRESS   ((vm_offset_t)0)
#define VM_MAX_KERNEL_ADDRESS   ((vm_offset_t)0xF0000000)

I'll start filling in the x86 numbers blindly, I guess.

> PA has this strange concept of Spaces and they have those
> space registers %sr0 to %sr7. This reminds me of Intel's segment
> registers. And whoever wanted to do any serious OS like Unix on 80386
> never liked segments.

Yeah, I've been trying to figure out whether we should do anything
special with those, but I don't quite understand the whole architecture
yet.

Mike

-- 
311774.80 264634.54

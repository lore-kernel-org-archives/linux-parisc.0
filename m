Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id AAA09342
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 00:29:27 -0500
Date: Wed, 17 Mar 1999 21:29:46 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
cc: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] memory layout
In-Reply-To: <36F07CED.AC742994@netscape.com>
Message-ID: <Pine.LNX.3.96.990317212138.2685A-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


Talking about only pa1.1 or 32 bit CPUs, I would say the same layout
can be used as Linux on Intel does. That is kernel mapped at 0xc0000000.
So 3 Gig for User space and 1 Gig for kernel. Of course, other ppl may
have different ideas. 

PA has this strange concept of Spaces and they have those 
space registers %sr0 to %sr7. This reminds me of Intel's segment 
registers. And whoever wanted to do any serious OS like Unix on 80386
never liked segments.

					pkd 

On Wed, 17 Mar 1999, Mike Shaver wrote:

> rd.c:467: `KERNEL_DS' undeclared (first use in this function)
> mmap.c:361: `TASK_UNMAPPED_BASE' undeclared (first use in this function)
> 
> It sorta begs the question: what is our memory layout going to look
> like?  What goes where?  I'll pore over my PA-RISC book tonight looking
> for clues, but I doubt that'll be enough.
> 
> What kind of memory layout does HP-UX use, if I might be so bold as to
> ask?
> 
> Mike
> 

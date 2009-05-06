From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Wed, 6 May 2009 12:04:42 -0400
Message-ID: <20090506160442.GE3094@bombadil.infradead.org>
References: <20090505191845.GD3094@bombadil.infradead.org> <20090505194658.07D074EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090505194658.07D074EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, May 05, 2009 at 03:46:57PM -0400, John David Anglin wrote:
> > On Tue, May 05, 2009 at 03:09:50PM -0400, John David Anglin wrote:
> > > Probably, the cast should be to int.  __canonicalize_funcptr_for_compare
> > > isn't used in the 64-bit runtime.
> > > 
> > > Still, I'm not sure why this fixed the problem as
> > > __canonicalize_funcptr_for_compare checks for -1.
> > > 
> > 
> > If we cast both sides to int, then we don't generate a call there...
> 
> That will certainly fix the problem but I'd really like to know
> why we get a segv.  I suspect we are not handling a deferred function
> pointer correctly.
> 

At a guess, you're probably right, the faulting insn is a load:

0x0002b3a8 <__canonicalize_funcptr_for_compare+48>:	bb,>= r26,1e,0x2b394 <__canonicalize_funcptr_for_compare+28>
0x0002b3ac <__canonicalize_funcptr_for_compare+52>:	copy r26,r3
0x0002b3b0 <__canonicalize_funcptr_for_compare+56>:	addil L%800,dp,r1
0x0002b3b4 <__canonicalize_funcptr_for_compare+60>:	ldw 294(r1),ret1
0x0002b3b8 <__canonicalize_funcptr_for_compare+64>:	depwi 0,31,2,r3
0x0002b3bc <__canonicalize_funcptr_for_compare+68>:	ldw 0(r3),r26

god knows I can't recall how DEP*I work, but I guess this is clearing
the bottom two bits of %r3 if bit 31 is set in %r26?

(gdb) p/x $r3 
$3 = 0x407d2f18
(gdb) p/x $r26
$4 = 0x407d2f1a

This looks like the sigaction handler, (it appears __canon..._compare
detects -1 already.)

regards, Kyle

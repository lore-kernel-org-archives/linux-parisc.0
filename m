From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 14 May 2009 09:31:54 -0400 (EDT)
Message-ID: <20090514133155.74C9C4FB1@hiauly1.hia.nrc.ca>
References: <20090514045052.GB24614@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090514045052.GB24614@lackof.org> from "Grant Grundler" at May 13, 2009 10:50:52 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> On Wed, May 06, 2009 at 12:04:42PM -0400, Kyle McMartin wrote:
> ...
> > At a guess, you're probably right, the faulting insn is a load:
> > 
> > 0x0002b3a8 <__canonicalize_funcptr_for_compare+48>:	bb,>= r26,1e,0x2b394 <__canonicalize_funcptr_for_compare+28>
> > 0x0002b3ac <__canonicalize_funcptr_for_compare+52>:	copy r26,r3
> > 0x0002b3b0 <__canonicalize_funcptr_for_compare+56>:	addil L%800,dp,r1
> > 0x0002b3b4 <__canonicalize_funcptr_for_compare+60>:	ldw 294(r1),ret1
> > 0x0002b3b8 <__canonicalize_funcptr_for_compare+64>:	depwi 0,31,2,r3
> > 0x0002b3bc <__canonicalize_funcptr_for_compare+68>:	ldw 0(r3),r26
> > 
> > god knows I can't recall how DEP*I work, but I guess this is clearing
> > the bottom two bits of %r3 if bit 31 is set in %r26?
> 
> Wouldn't 1e == bit 30?

Yes.  This is the 'L' field in the procedure label layout.  Bit 31
is X field and reserved.

> And yes, "depwi 0,31,2,XX"  is clearing the bottom 2 bits of XX.
> 
> I'm a bit confused about the ">=" conditional since only one bit is tested.
> So is the copy only executed on branch not taken case?

The conditions for bb are unique.  The word conditions are < and >=.
The double word conditions are *< and *>=.  See Table D-15 on page D-9
in arch.

This code sequence is used for indirect calls (e.g., $$dyncall).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Wed, 13 May 2009 22:50:52 -0600
Message-ID: <20090514045052.GB24614@lackof.org>
References: <20090505191845.GD3094@bombadil.infradead.org> <20090505194658.07D074EDA@hiauly1.hia.nrc.ca> <20090506160442.GE3094@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090506160442.GE3094@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 06, 2009 at 12:04:42PM -0400, Kyle McMartin wrote:
...
> At a guess, you're probably right, the faulting insn is a load:
> 
> 0x0002b3a8 <__canonicalize_funcptr_for_compare+48>:	bb,>= r26,1e,0x2b394 <__canonicalize_funcptr_for_compare+28>
> 0x0002b3ac <__canonicalize_funcptr_for_compare+52>:	copy r26,r3
> 0x0002b3b0 <__canonicalize_funcptr_for_compare+56>:	addil L%800,dp,r1
> 0x0002b3b4 <__canonicalize_funcptr_for_compare+60>:	ldw 294(r1),ret1
> 0x0002b3b8 <__canonicalize_funcptr_for_compare+64>:	depwi 0,31,2,r3
> 0x0002b3bc <__canonicalize_funcptr_for_compare+68>:	ldw 0(r3),r26
> 
> god knows I can't recall how DEP*I work, but I guess this is clearing
> the bottom two bits of %r3 if bit 31 is set in %r26?

Wouldn't 1e == bit 30?

And yes, "depwi 0,31,2,XX"  is clearing the bottom 2 bits of XX.

I'm a bit confused about the ">=" conditional since only one bit is tested.
So is the copy only executed on branch not taken case?

grant

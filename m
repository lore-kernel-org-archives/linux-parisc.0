From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [bug] gcc-4.3 miscompiling causing networking to bugger up
Date: Sat, 31 May 2008 10:43:57 -0400
Message-ID: <119aab440805310743g6c7bbd7and5dcbce603ac85df@mail.gmail.com>
References: <20080528234110.GD30501@phobos.i.cabal.ca>
	 <20080529000059.9C6434E77@hiauly1.hia.nrc.ca>
	 <20080529000219.GE30501@phobos.i.cabal.ca>
	 <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com>
	 <20080531041010.GA27970@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org, "Randolph Chung" <tausq@debian.org>
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080531041010.GA27970@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 31, 2008 at 12:10 AM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> I've found the solution to the bug, it seems something is going wonky
> because of ip_fast_csum missing a "memory" clobber.

Great news!

The asm does advance the iph pointer, and reads the header data
without telling gcc. The input/output operands only state the pointer
may be read and modified not the memory at the pointer.

The compiler may have cached iph writes in registers and they may not
be in memory yet. Under normal circumstances I would say "Add a memory
input operand for the header data e.g. "m" (*header_struct_pointer)",
but the relationship with ihl and iph is not known the compiler. In
this case it is probably correct to use the "memory" clobber as a
catch all.

Cheers,
Carlos.

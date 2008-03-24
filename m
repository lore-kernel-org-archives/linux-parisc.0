From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Can't find a register in R1_REGS while reloading asm.
Date: Mon, 24 Mar 2008 19:55:58 -0400
Message-ID: <119aab440803241655t37b8e74dmaa701c1a5b122c8f@mail.gmail.com>
References: <119aab440803240528n45bdd86ag193f50175d3d0c85@mail.gmail.com>
	 <20080324170403.630904EB5@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc.ca
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080324170403.630904EB5@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 24, 2008 at 1:04 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>  The fundamental issue is there's only one r1 register and its
>  needed for memory loads and stores.  The PA backend has always used
>  separate rtl for the addil insn.  This makes it possible for gcse
>  to eliminate duplicated addil insns.  However, it can't do this
>  if the two addil insns are separated by a call or an asm which uses
>  r1 (well it could if reload didn't pick r1 for the addil).

It is certainly a difficult problem, and the only thing that appears
to trigger this is a function with a lot of register pressure,
followed by an asm with a *lot* of clobbers, and a fair number of
input/output operands.

It's hard to justify fixing this if only a couple of corner cases
trigger the bug, and even then it's a "fail-safe" situation.

Cheers,
Carlos.

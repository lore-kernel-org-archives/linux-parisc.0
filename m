From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Can't find a register in R1_REGS while reloading asm.
Date: Tue, 25 Mar 2008 21:06:24 -0400 (EDT)
Message-ID: <20080326010626.471CC4EB0@hiauly1.hia.nrc.ca>
References: <119aab440803240603h1d465daamafa380767f171f4d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803240603h1d465daamafa380767f171f4d@mail.gmail.com> from "Carlos O'Donell" at Mar 24, 2008 09:03:31 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 1) Remove "memory" from clobber.
> 2) Change the output constraint "=m" (*mem) to "+m" (*mem) to express
> that the memory may be written to by the CAS operation.
> 
> This is a tighter constraint than before, but it is no longer
> ambiguous. Previously we said we clobbered memory, but yet specified
> some as read-only.

"+m" indicates that the memory operand is both read and written.  While
I believe that changing from "=m" to "+m" is correct, it is not a all
clear to me why this fixed the ICE.  As shown in the PR, the gcse pass
eliminated several loads of the high portion of the address of *mem.
I don't think this would happen if the asm indicated that mem was
clobbered.  This would prevent gcse from optimising the address load.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

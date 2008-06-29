From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Another ldcw inline assembler patch
Date: Sat, 28 Jun 2008 20:43:16 -0400 (EDT)
Message-ID: <20080629004317.B4FDD431A@hiauly1.hia.nrc.ca>
References: <20080628233406.GI14894@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: matthew@wil.cx (Matthew Wilcox)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080628233406.GI14894@parisc-linux.org> from "Matthew Wilcox" at Jun 28, 2008 05:34:07 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sat, Jun 28, 2008 at 06:07:57PM -0400, John David Anglin wrote:
> > There are two reasons to expose the memory *a in the asm:
> > 
> > 1) To prevent the compiler from discarding a preceeding write to *a, and
> > 2) to prevent it from caching *a in a register over the asm.
> 
> Do either of those scenarios apply, given that every usage of this is
> preceded by an asm clobbering memory?

Probably not, I was just concerned about the correctness of the
__ldcw() macro itself.  I think the use of the macro should be
confined to small inline functions to try to limit the effect
of clobbering memory on GCC's optimization of loads and stores.

> I believe the correct thing to do is to take out the two mb()s in the
> various spin_lock routines and make the __ldcw() macro itself clobber
> memory.

This seems reasonable if you want __ldcw() to be a memory barrier.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

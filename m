From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Another ldcw inline assembler patch
Date: Sat, 28 Jun 2008 17:34:07 -0600
Message-ID: <20080628233406.GI14894@parisc-linux.org>
References: <20080628220756.GA8620@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080628220756.GA8620@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 28, 2008 at 06:07:57PM -0400, John David Anglin wrote:
> There are two reasons to expose the memory *a in the asm:
> 
> 1) To prevent the compiler from discarding a preceeding write to *a, and
> 2) to prevent it from caching *a in a register over the asm.

Do either of those scenarios apply, given that every usage of this is
preceded by an asm clobbering memory?

I believe the correct thing to do is to take out the two mb()s in the
various spin_lock routines and make the __ldcw() macro itself clobber
memory.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

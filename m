From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: [Status] hppa's userspace in 2004 (looking back)
Date: Mon, 5 Jan 2004 19:33:07 +0000
Message-ID: <20040105193307.GA6982__7307.09612039409$1416623105$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20040105172146.GE23782@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <willy@www.linux.org.uk>
In-Reply-To: <20040105172146.GE23782@systemhalted>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 05, 2004 at 12:21:46PM -0500, Carlos O'Donell wrote:
> A new year is here and it's time to look back and say, hey, we did a
> great job, hacked on many things and made parisc a better port!

Carlos, thank you for all the work you've put in over the last year
and more.  We would be significantly worse off without your efforts.
I'm sure many people who read this aren't aware just how much work you've
put in to make PA/Linux as good as it is -- and that's a compliment.

> ============
> GNU/binutils
> ============
> 
> Maybe someone can comment on this? Randolph was great enough to remove
> silly ltp relocations from static binaries. Without the loader running
> the ltp is never read from the DT_PLTGOT dynamic entries... so it just
> made sense to translate these into dp relative relocations. dlopen from
> static binaries still doesn't work, minor problem really.
> 
> I know that hppa is not really multi-arch? We have to have two separate
> binaries to do 32 and 64-bit work. Someone want a project? :)

I have an unfinished project to get all the remnants of (%sr0,xx) right
from 2-bit sr fields.  I think I can do quite a simplification here,
but I haven't got round to finishing it off.  I'll take another look
in February.

> ============
> GNU/debugger
> ============
> 
> Our gdb has no visibility upstream. I'm taking a hiatus from glibc to
> fix gdb. I volunteered for this like 2 years ago, but glibc took a long
> time to fix.

The bounty is currently set at one bottle of single malt (in the
10-20 year old range, not the 50 year old range ;-)

> ===============
> ELF64 Userspace
> ===============
> 
> 32-bit versus 64-bit signals are fixed. Along with ucontext and siginfo.
> A good project might be for someone to implement the set/get/make/swap
> context calls in userspace, takers are welcome! I will *not* be working
> ELF64 yet, without a working gdb it's quite hard to do *anything*. I
> just recently learned how to poke insns into binary files for
> debugging... it's not as much fun as you think ;)
> 
> I need to do similar signal hacking for ia64 or upstream may never
> accept my linux/kernel/* patches. Worst-case has us absorb the changes
> into our arch directory and nobody else benefits from the framework :(

There's certainly enthusiasm for these changes -- the more
32-bit-emulation code we can share, the better.  If you don't have time
for this, I can take this on.  But as I said, not till February.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

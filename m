From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] Generic BUG for parisc
Date: Sat, 9 Dec 2006 22:37:49 -0700
Message-ID: <20061210053749.GB1451__20256.9544002928$1416624228$gmane$org@colo.lackof.org>
References: <200612091628.38777.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200612091628.38777.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 09, 2006 at 04:28:38PM +0100, Helge Deller wrote:
> I found the following patch, which recently went into Linus' 2.6.20-pre kernel very interesting:
> http://git.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=7664c5a1da4711bb6383117f51b94c8dc8f3f1cd

Indeed. that's cool.

...
> The attached patch implements this for parisc, and my vmlinux (32bit) shows me after using it:
> > hppa-linux-objdump -x vmlinux :
> Idx Name          Size      VMA       LMA       File off  Algn
>  16 __bug_table   000040a4  104a3000  104a3000  003a4000  2**0
> 
> So, there were 1379 BUG()'s covered by that change (0x40a4 = 16548, each entry 12 bytes => 1379 BUG calls).
> 
> Since I would like to submit this patch to our tree, I would like to get your feedback first:
> - Is the "break" instruction the best one for this task ?
> - will it affect runtime of the kernel (maybe break statements, although normally not executed, reduce throughput ?)
> - should I submit it as soon as our parisc-tree has the necessary bits from mainline ?

This looks good to me.
It's up to kyle/willy on how they want it pushed back upstream.

I'm sure it will affect the runtime of the kernel becuase it moves
a fair chunk of code "out of line". Ie we should get slightly better
i-cache utilization with this change.

> - any other ideas ?

With this, we could use BUG() to _measure_ exactly how many times
we hit a particular BUG() test. It would be usefule to determine
how performance critical particular BUG() tests are.
Add a 32-bit counter to the generic struct bug_entry and then increment
that in the trap handler. Hrm...need a /proc or /sys interface
to dump all of them.

> One idea I had was to encode the file line number into the instruction
> itself (in im5 & im13), since the break instruction is implemented as
> "break im5, im13" and 16bit fit easily in there.
> This would save some space, but I would need to add some ifdefs in
> the generic implementation which I didn't wanted to touch yet.

I'd not worry about optimizations until after it's seen broader use.
Keep in mind 12 bytes (for 32-bit kernel) is only 3 instructions.
So each BUG() only uses 16 bytes + file name string. That's already a
major improvement over our existing BUG() which has to setup
printk()/dump_stack()/panic calls - at least 56 bytes (14 ops) each.

Keep in mind this change saves us around 55kB (1379*40).
Saving another 2 bytes isn't that critical.  IMHO, it's not
worth making things too complicated just to save another 3kB.

Kudos!

thanks,
grant

From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix unwind with recent gcc versions
Date: Sun, 29 Nov 2009 21:23:10 +0100
Message-ID: <4B12D82E.9020103@gmx.de>
References: <20091128203311.GA24165@hera.kernel.org> <alpine.LFD.2.00.0911290929110.3684@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0911290929110.3684@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/29/2009 06:34 PM, Linus Torvalds wrote:
> On Sat, 28 Nov 2009, Kyle McMartin wrote:
>>
>> From: Helge Deller<deller@gmx.de>
>>
>> kernel unwinding is broken with gcc>= 4.x. Part of the problem is, that
>> binutils seems sensible where the unwind information is stored.
>
> The commentary doesn't seem to make much sense to me. Do you mean
> "sensitive" rather than "sensible"? And is it an actual binutils bug, or
> what?

Yes, sorry, I meant "sensitive".

It's a combination of lots of things. Newer gcc, with newer binutils and
all latest changes to our parisc arch/parisc/kernel/vmlinux.lds.S linker
script, e.g.:

commit ab635e7d499f23a5791e69e2ebbc9a40c9983d89
Author: Tim Abbott <tabbott@ksplice.com>
Date:   Thu Sep 24 10:36:18 2009 -0400
     parisc: Remove useless altinstructions code copied from x86.

commit 57a8e1161e1a944823542138e61dd8f38fd9b9e8
Author: Tim Abbott <tabbott@ksplice.com>
Date:   Thu Sep 24 10:36:17 2009 -0400
     parisc: Clean up linker script using new linker script macros.

commit 023bf6f1b8bf58dc4da7f0dc1cf4787b0d5297c1
Author: Tejun Heo <tj@kernel.org>
Date:   Thu Jul 9 11:27:40 2009 +0900
     linker script: unify usage of discard definition

commit 405d967dc70002991f8fc35c20e0d3cbc7614f63
Author: Tejun Heo <tj@kernel.org>
Date:   Wed Jun 24 15:13:38 2009 +0900
     linker script: throw away .discard section

All those patches (which are basically OK), triggers a new
layout location for our unwind tables and as such broke
our existing unwinding.

My patch basically just gets it right again.

> Also, are the PARISC people 100% sure that you really want unwinding in
> the first place?

No, but it's the only and best thing we have available right now.
There have been discussions about other options like dwarf and similiar though:
http://marc.info/?l=linux-parisc&m=124694174008515&w=2

>We got rid of it as being terminally broken on x86,
> because tools and asm always got it wrong, and special things like irq
> frames etc continually broke it in the most annoying ways possible (ie
> WARN_ON() statements became fatal oopses due to unwind errors etc).
> Having a tentative and unreliable stack trace is generally better than
> a totally broken one.

Yes we had oopses as well. Current code tries hard to not unwind outside
of the kernel text segment. This fixed most issues and in the past weeks
I didn't faced any other problems with unwinding (which doesn't mean there
aren't any other problems left).

Helge

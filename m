Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA02547
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 09:23:50 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 142yEi-0003Me-00; Mon, 04 Dec 2000 16:13:04 +0000
Date: Mon, 4 Dec 2000 16:13:04 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: pci changes
Message-ID: <20001204161304.A12414@parcelfarce.linux.theplanet.co.uk>
References: <200012041355.GAA16592@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012041355.GAA16592@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Mon, Dec 04, 2000 at 06:55:36AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 04, 2000 at 06:55:36AM -0700, John Marvin wrote:
> > Alan wants to put some of our independnt parts in too.  I'm just sorting
> > out the stack direction and location issues in the way Linus wants
> > it done.
> 
> Well, here are some of the issues I would like to see addressed:
> 
> 1) When I last checked, the stack growth fix only fixed one of the locations
>    that cared about stack direction. There were others that were not fixed.
>    Are you going to fix them?

I've fixed the ones which I noticed.  You've pointed out some in your other
mail which I hadn't, I'll look for them.

> 2) The current fix duplicated machine independent code (expand_stack
>    and find_vma), modified them, and placed them into the machine
>    dependent code. The problem with that is that whenever changes are
>    made to expand_stack and/or find_vma, we have to notice that and
>    port the fixes, since whoever makes the changes is not likely to
>    notice our special versions. I was hoping that we could get some
>    support for stacks that grow up in the machine independent code
>    so that they are visible.

ok, that's ugly.  i'll try and fix those too.

> 3) I hope that we will have some control of the stack location in the
>    machine dependent code. I would like to be able to place the stack
>    near the top of memory, and have the location based on the stack
>    size limit (rlim[RLIMIT_STACK].rlim_max).

i think we can arrange that.

> 5) To make it clear "why" the code is different, I was hoping that
>    any #ifdef's in the machine independent code for stack grows up
>    changes would be something like #ifdef STACK_GROWS_UP, rather than
>    #ifdef parisc. Then STACK_GROWS_UP would be set for parisc. This
>    way, when people are making changes to the code, they will understand
>    what the different code is for, rather than wondering why parisc
>    has that code change. Also, it would help all those other future
>    architectures with stacks that grow up when they port Linux :-).

it's #ifdef ARCH_STACK_GROWSUP.  it's defined (or not..) in <asm/pgtable.h>
along with similar VM constants.

> I would appreciate it if you would keep us informed regarding discussions
> between you and Linus regarding this issue.

sure.  so far there's only been a mail from Alan to Linus asking for a
ruling on an appropriate way to handle this, and Linus is in favour of
a per-arch define.

-- 
Revolutions do not require corporate support.

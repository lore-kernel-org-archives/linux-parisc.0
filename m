Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA04129
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 11:19:30 -0700
Subject: Re: pci changes
To: jsm@udlkern.fc.hp.com (John Marvin)
Date: Mon, 4 Dec 2000 18:17:52 +0000 (GMT)
Cc: parisc-linux@puffin.external.hp.com
In-Reply-To: <200012041355.GAA16592@udlkern.fc.hp.com> from "John Marvin" at Dec 04, 2000 06:55:36 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E1430BW-00045p-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> 2) The current fix duplicated machine independent code (expand_stack
>    and find_vma), modified them, and placed them into the machine
>    dependent code. The problem with that is that whenever changes are
>    made to expand_stack and/or find_vma, we have to notice that and
>    port the fixes, since whoever makes the changes is not likely to
>    notice our special versions. I was hoping that we could get some
>    support for stacks that grow up in the machine independent code
>    so that they are visible.

Duplicating them is right for the 2.4 path, fixing the generic code is
probably right post 2.4

> 3) I hope that we will have some control of the stack location in the
>    machine dependent code. I would like to be able to place the stack
>    near the top of memory, and have the location based on the stack
>    size limit (rlim[RLIMIT_STACK].rlim_max).

Yep

> 4) The top of memory for user space is currently 0xc0000000, but I hope
>    to change that to 0xffffe000 in the next month or two.

Just frob the numbers, that isnt a big issue.

> 5) To make it clear "why" the code is different, I was hoping that
>    any #ifdef's in the machine independent code for stack grows up
>    changes would be something like #ifdef STACK_GROWS_UP, rather than
>    #ifdef parisc. Then STACK_GROWS_UP would be set for parisc. This

That is what Linus said when I asked him hppa v STACK_GROWS_UP v duplicating
all the code

> I would appreciate it if you would keep us informed regarding discussions
> between you and Linus regarding this issue.

I will do

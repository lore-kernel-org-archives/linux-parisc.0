Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8778482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 06:11:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19FC9r-0003aU-HT; Mon, 12 May 2003 13:11:55 +0100
Date: Mon, 12 May 2003 13:11:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
Message-ID: <20030512121155.GV29534@parcelfarce.linux.theplanet.co.uk>
References: <20030511133037.GN27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030511133037.GN27494@lug-owl.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, May 11, 2003 at 03:30:37PM +0200, Jan-Benedict Glaw wrote:
> Hi!

Hi Jan.  Thanks for all the work you've put in, I really appreciate it.

>  - Ressurect CONFIG_BINFM_SOM when built as module: the hpux/ directory
>    was completely missing (this part needs cleanup from a Makefile
>    specialist), EXPORT_SYMBOL() the hpux_gateway_page if neccessary.

I was already planning a CONFIG_HPUX; I just hadn't got round to
committing that bit to the tree.  I've done that now and I think it
should solve all the problems you were experiencing.

>  - Export some more symbols (memchr, pdc_tod_read, pdc_tod_set,
>    __flush_dcache_page, dcache_stride) to make various modules happy.

Done.  None of these seemed like stuff we shouldn't be exporting.

>  - Add various void * casts to pointer compares (to solve the
>    __canonicalize_funcptr_for_compare missing symbol when built as
>    module because libgcc.a isn't linked into these modules)

I'm not applying these bits.  It's just not reasonable to add (void *)
casts to every function pointer comparison.  I know Linus will reject it.
We need to find a better way to fix this one -- and I suspect the right
way is to implement a __canonicalize_funcptr_for_compare in the kernel
and EXPORT_SYMBOL it.

> --- arch/parisc/oprofile/init.c	8 May 2003 13:31:44 -0000	1.5
> +++ arch/parisc/oprofile/init.c	11 May 2003 13:09:18 -0000
> @@ -11,6 +11,8 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/oprofile.h>
> +#include <linux/init.h>
> +#include <linux/errno.h>

hmm... init.h and errno.h are already included earlier, so I didn't
apply this patch.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

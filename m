Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA22596
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Oct 1999 01:52:13 -0600
Date: Mon, 4 Oct 1999 09:52:20 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Linas Vepstas <linas@linas.org>
Cc: linux-kernel@vger.rutgers.edu, LINUX-VM@VM.MARIST.EDU,
        parisc-linux@thepuffingroup.com
Subject: Re: upwards growing stacks ??
Message-ID: <19991004095220.F526@mencheca.ch.genedata.com>
References: <199910040312.WAA05748@shadygrove.linas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199910040312.WAA05748@shadygrove.linas.org>; from Linas Vepstas on Sun, Oct 03, 1999 at 10:12:17PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Oct 03, 1999 at 10:12:17PM -0500, Linas Vepstas wrote:
> I've been porting the kernel to the ESA/390 architecture (mainframe)
> and have had the occasion to rethink the subroutine linkage.  In particular,
> I have some weak reasons to want the stack to grow up, not down.  However,
> the unix tradition & linux in particular usually have the stack grow down.
> So the questions:
> 
> -- is it a bad idea to make the stack grow up? 
> -- has anyone done this before w/ linux? (doesn't seem like it ...)

Some people are doing this right now with Linux/PARISC.  The only thing
which affected me was in fs/binfmt_*.c where we tamper with the argc
/ envp.  Alan tells me the mklinux people have sorted this one properly,
but I haven't looked yet.  There are probably other places where there are
problems.  Philipp?

> -- should I do this, or should I stick to the traditional design?

It's something which we need to fix for PARISC, so I think you should
do it too :-)

> -- I'm making the following mods, will these be sufficient?
>    Are they appropriate?
>    o  the expand_stack() inline in include/linux/mm.h assumes the
>       stack grows down, & I will rework it to suit my needs ...
>    o  change VM_STACK_FLAGS to grow up as well ...
>    o  create a new vma that holds the stack base, out in high-memory,
>       somewhere near TASK_SIZE - current->rlim[RLIMIT_STACK].rlim_cur


-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

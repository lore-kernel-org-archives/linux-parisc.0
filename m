Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA05368
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 04:50:54 -0700
Date: Sun, 7 Nov 1999 12:53:14 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Recent changes
Message-ID: <19991107125314.N25252@mencheca.ch.genedata.com>
References: <199911030250.TAA16563@puffin.external.hp.com> <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com> <19991106192023.F11609@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991106192023.F11609@mathe.stud.uni-erlangen.de>; from Philipp Rumpf on Sat, Nov 06, 1999 at 07:20:23PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Nov 06, 1999 at 07:20:23PM +0100, Philipp Rumpf wrote:
> On Tue, Nov 02, 1999 at 11:14:33PM -0500, Alex deVries wrote:
> > ld: Unsatisfied symbols:
> >    hpux_brk (code)
> 
> Why did the definition of hpux_brk (in kernel/sys_hpux.c) ever vanish ?  Some
> time ago, it looked like this:
> 
> unsigned long sys_brk(unsigned long addr);
> 
> unsigned long hpux_brk(unsigned long addr)
> {
>         /* Sigh.  Looks like HP/UX libc relies on kernel bugs. */
>         return sys_brk(addr + PAGE_SIZE);
> }

It looks like I'm accidentally responsible for deleting that.  Maybe this
explains why grant found that `alias' wasn't working well in sash.  I've
just committed this function back.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

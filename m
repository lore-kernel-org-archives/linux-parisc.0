Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C44E482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 05:40:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Sxlx-0004aR-Rg; Thu, 19 Jun 2003 12:40:09 +0100
Date: Thu, 19 Jun 2003 12:40:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <r.scholz@bluehash.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some 2.5-testing
Message-ID: <20030619114009.GA24357@parcelfarce.linux.theplanet.co.uk>
References: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca> <3EF1353C.8030705@bluehash.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3EF1353C.8030705@bluehash.de>
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

On Thu, Jun 19, 2003 at 05:59:56AM +0200, Rüdiger Scholz wrote:
> John David Anglin schrieb:
> 
> >Until issues related to the canonicalization of function pointers
> >and the alignment of stack locals are resolved, it is best to stick
> >with debian gcc-3.0.4 for kernel building.
> >
> So I installed gcc-3.04 from Debian, did "make distclean", "make 
> oldconfig" (selecting "PA7100LC") and booted...
> And got the same loop again ;)
> 
> ---------- SNIP---------------
> 
>     md: linear personality registered as nr 1
>    Badness in local_bh_enable at at kernel/softirq.c:109
>    Kernel addresses on the stack:
> 
>     [tirq.c:109
>    <4>Kernel addresses on the stack:
>    <4> [<10124edcc8>]  [<1010ea4c>]
>    <4> [<1012503c>]  [<1028ac08>]  [<10124cc>]
>    <4> [<1029a2a4>]  [<103ad4d4>]  [<10100284>]  [<10109c5ab8>] 
>    [<101289a8>]  [<1028ac20>]
>     [<1028b428>]  [<101070f28ac08>]  [<10124f10>]  [<1028adcc>]
>     [<1029a2a4>]  [<103adc>]
>    <4> [<1029a2a4>]  [<103ad4d4>]  [<10100284>]  [<10109c>] 
>    [<103ad4d4>]  [<10100284>]  [<10109c5c>]

So... what's going on here is that someone's enabling softirqs with hard
interrupts disabled.  This is not a smart thing to do.  Unfortunately,
something is messing up the stack backtrace, so it's hard tosee what's
going on.  Could you turn on CONFIG_KALLSYMS so the kernel prints out
its symbols?  The messages may still be corrupt, but we should have more
information to help us figure out what's going on.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

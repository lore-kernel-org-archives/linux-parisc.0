Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C839482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 13:56:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19T5WH-0004eS-04; Thu, 19 Jun 2003 20:56:29 +0100
Date: Thu, 19 Jun 2003 20:56:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <r.scholz@bluehash.de>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some 2.5-testing
Message-ID: <20030619195628.GH24357@parcelfarce.linux.theplanet.co.uk>
References: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca> <3EF1353C.8030705@bluehash.de> <20030619114009.GA24357@parcelfarce.linux.theplanet.co.uk> <3EF205C9.9010600@bluehash.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3EF205C9.9010600@bluehash.de>
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

On Thu, Jun 19, 2003 at 08:49:45PM +0200, Rüdiger Scholz wrote:
> Hi,
> 
> back again with new results! Compiled Kernel with CONFIG_KALLSYMS and 
> md-support. Here is a part from the boot-log:
> ---------SNIP
> 
>    md: linear personality registered as nr 1
>    Badness in local_bh_enable at kernel/softirq.c:109
>    Kernel addresses on the stack:
>     [<10124ee8>] printk+0xf0/0x128
>     [<10105adc>] dump_stack+0x10/0x1c
>     [<101289b8>] .L886+0x0/0x50
>     [<1028b3d0>] .L1082+0x8/0x18
>     [<1028bdd4>] .L812+0x0/0x9c
>     [<1012cdb8>] do_timer+0x68/0x118
>     [<1028c9b0>] .L917+0x48/0x58
>     [<1028cc0c>] hil_mlcs_process+0x28/0x4c

... we really need to get these .L symbols cleaned up; stop them entering
the System.map.  Any toolchain hackers interested in looking at this?

Anyway, the fault seems to be in the HIL drivers -- someone said Helge
was looking at this?  If you disable the HIL drivers, does it work?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

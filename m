Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1D034840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 12:45:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AMukJ-0001gL-TN; Thu, 20 Nov 2003 19:45:43 +0000
Date: Thu, 20 Nov 2003 19:45:43 +0000
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6
Message-ID: <20031120194543.GM30485@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie> <20031120190259.GL30485@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0311201920340.23498@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311201920340.23498@sal.ucc.ie>
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

On Thu, Nov 20, 2003 at 07:24:49PM +0000, M. Grabert wrote:
> On Thu, 20 Nov 2003, Matthew Wilcox wrote:
> 
> > > PS: Building network scheduling (QoS) as modules results in unresolved
> > >     symbols (using 2.4.22-pa13). Building then in the kernel (2.4.22-pa17)
> > >     works.
> >
> > ... which symbols?
> 
> I compiled -pa17 with the same config as -pa13, and the unresolved symbols
> in combination of QoS are gone now (of which there were many).
> 
> However I have another one here (albeit unrelated to QoS, but IPv6 netfilter):
> 
> root@beast:~# depmod -a
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.22-pa17/kernel/net/ipv6/netfilter/ip6_queue.o
> depmod:         ip6_route_me_harder

How strange.

$ find -type f |xargs grep ip6_route_me_harder
./include/net/ip6_route.h:extern int                    ip6_route_me_harder(struct sk_buff *skb);
./net/netsyms.c:EXPORT_SYMBOL(ip6_route_me_harder);

Are you sure the kernel you are currently running was compiled with
CONFIG_NETFILTER and CONFIG_IPV6 turned on?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 430894840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 12:24:52 -0700 (MST)
Date: Thu, 20 Nov 2003 19:24:49 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6
In-Reply-To: <20031120190259.GL30485@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.58.0311201920340.23498@sal.ucc.ie>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
 <20031120190259.GL30485@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 20 Nov 2003, Matthew Wilcox wrote:

> > PS: Building network scheduling (QoS) as modules results in unresolved
> >     symbols (using 2.4.22-pa13). Building then in the kernel (2.4.22-pa17)
> >     works.
>
> ... which symbols?

I compiled -pa17 with the same config as -pa13, and the unresolved symbols
in combination of QoS are gone now (of which there were many).

However I have another one here (albeit unrelated to QoS, but IPv6 netfilter):

root@beast:~# depmod -a
depmod: *** Unresolved symbols in
/lib/modules/2.4.22-pa17/kernel/net/ipv6/netfilter/ip6_queue.o
depmod:         ip6_route_me_harder



Slan,
  Max

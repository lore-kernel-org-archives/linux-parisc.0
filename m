Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Sorry was Re: [parisc-linux] FB on c3k 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Wed, 06 Mar 2002 16:10:11 GMT." <Pine.LNX.4.44.0203061559460.19204-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0203061559460.19204-100000@sal.ucc.ie> 
Date: Wed, 06 Mar 2002 09:58:02 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020306165802.E38DE4858@dsl2.external.hp.com>
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

"M. Grabert" wrote:
> On Wed, 6 Mar 2002, Grant Grundler wrote:
> Argll, I just took a look at the patch and your previous emails
> and now I understand that you try to fix 64/FB.

yes. But user space is still 32-bit. kernel has to
provide 32-bit address for frame buffer and that
seems to work.

> I thought the Visualize-EG stifb driver is also not working on Cxxx
> machines. Is this due to the same problem ?

Thomas Bogendoerf thinks all PA 2.0 machines don't map the user space
address correctly (40-bit physical address) in the CPU TLB/PDIR.
He also found that U-bit (mark pages as uncacheable) needs to be
set even though the CPU shouldn't require it. Maybe this is
a hint that 32-bit kernel needs more work for PA2.0 architecture.

> Or is this
> specific for true 64bit workstations as the Cyyyy (hence the
> 64iocls problem).

The goal is to run 32-bit kernel on Cxxx/Cyyyy machines.
I tried 64-bit to avoid the TLB/PDIR addressing problems.
32 vs 64-bit behaviours just help narrow down the scope
of the bugs.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A364485B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 09:49:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19mEv4-0002dY-4y; Mon, 11 Aug 2003 16:49:14 +0100
Date: Mon, 11 Aug 2003 16:49:14 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Naresh <knaresh@india.hp.com>, Thibaut VARENE <varenet@esiee.fr>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Affined IRQs.
Message-ID: <20030811154914.GQ3169@parcelfarce.linux.theplanet.co.uk>
References: <3F373D92.C287B6B4@india.hp.com> <20030811094324.17ed7a86.varenet@esiee.fr> <3F378CFE.2A12407@india.hp.com> <20030811154449.GC20405@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030811154449.GC20405@dsl2.external.hp.com>
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

On Mon, Aug 11, 2003 at 09:44:49AM -0600, Grant Grundler wrote:
> Interrupts can be direct at any one CPU.
> ia64 and parisc IPI use the same method as IO devices.
> 
> The code does a round-robin when assigning IO interrupts to CPUs.
> ie assign interrupts to a sequential order of the CPUs.
> 
> A minor improvement would be to round-robin based on device class.
> But I want this intelligence in user space, not the kernel.
> NUMA machines want interrupts directed at CPUs in the same node
> where the IO is "hosted".
> 
> > 2. If a CPU on an SMP system is stopped or its interrupts are blocked,
> > will its interrupts automatically be serviced on another online CPU,
> 
> no. The interrupt must be "manually" redirected to another CPU.
> 
> > due to their non-affining nature?
> 
> Not sure what you mean here.

I think there's some confusion here.  I would say that interrupts on
PA-RISC are strongly CPU-affine, but there is currently no mechanism 
for controlling that affinity.  One interrupt will always go to the CPU
it's been programmed for.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

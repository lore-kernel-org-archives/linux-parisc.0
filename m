Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 11 Aug 2003 09:44:49 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Naresh <knaresh@india.hp.com>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Affined IRQs.
Message-ID: <20030811154449.GC20405@dsl2.external.hp.com>
References: <3F373D92.C287B6B4@india.hp.com> <20030811094324.17ed7a86.varenet@esiee.fr> <3F378CFE.2A12407@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F378CFE.2A12407@india.hp.com>
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

On Mon, Aug 11, 2003 at 06:03:03PM +0530, Naresh wrote:
> A couple of questions:
> 1. Do does this mean interrupts can go to any CPU?

Interrupts can be direct at any one CPU.
ia64 and parisc IPI use the same method as IO devices.

The code does a round-robin when assigning IO interrupts to CPUs.
ie assign interrupts to a sequential order of the CPUs.

A minor improvement would be to round-robin based on device class.
But I want this intelligence in user space, not the kernel.
NUMA machines want interrupts directed at CPUs in the same node
where the IO is "hosted".


> 2. If a CPU on an SMP system is stopped or its interrupts are blocked,
> will its interrupts automatically be serviced on another online CPU,

no. The interrupt must be "manually" redirected to another CPU.

> due to their non-affining nature?

Not sure what you mean here.

grant

> Regards,
> Naresh.
> 
> Thibaut VARENE wrote:
> 
> > > Hi,
> > > The IA-64 Linux kernel has a concept of affined IRQs, wherein IRQs can
> > > be bound/affined to particular CPUs. The affinity information shows up
> > > in '/proc/irq/#/smp_affinity'. I cannot see any affinity of IRQs to CPUs
> > > in PA ( iosapic.c and irq.c).. Is my understanding correct?
> > > Regards,
> > > Naresh.
> >
> > This has to be implemented for parisc and is on my todo list ;)
> >
> > (BTW, on vacation till Aug 25th.)
> >
> > Thibaut VARENE
> > The PA/Linux ESIEE Team
> > http://pateam.esiee.fr/
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

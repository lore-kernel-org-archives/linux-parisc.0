Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Juergen Braukmann <juergen.braukmann@ruhr-west.de>,
	parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel panic, ccio-dma.c, C110 
In-Reply-To: Message from Ryan Bradetich <rbradetich@uswest.net>
   of "17 Jul 2002 17:53:00 MDT." <1026949980.10285.4.camel@beavis>
References: <3D35925D.71683E92@ruhr-west.de> <20020717181459.CCD8E48CF@dsl2.external.hp.com>  <1026949980.10285.4.camel@beavis> 
Date: Fri, 19 Jul 2002 01:17:58 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020719071758.A865B4834@dsl2.external.hp.com>
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

Ryan Bradetich wrote:
> Is there a way to make this more intelligent now that we have an I/O tree?

Probably. I'm looking at info given by "lspci -n".

o generalize characteristics of each PCI device class/subclass and
  assign them a score.
o sum scores by recursively walking all the PCI busses below an IOMMU.
o translate the total score into how much memory could be mapped at
  a time (ie size of IO pdir)
o make sure IO Pdir size can't map more than 50% or 75% of Host
  physical memory.

> Maybe driverfs in 2.5.X will help us figure out how to make it
> smarter ... it kinda sucks to recompile the kernel because you do not
> have enough memory for our default setting of 4.

driver fs would probably help since we could then do it the
same way for all bus types.

But in 2.5, I'd rather see all the drivers indicate "Max DMA Mappings"
in some static data since that's what is really driving
the IO Pdir size.

> Seems like we could develop a huristic based on devices below the
> iommus.

yup. Will need tweaks too though...just satisfies more people.

grant

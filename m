Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A1DF486C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Jul 2002 17:53:04 -0600 (MDT)
Subject: Re: [parisc-linux] Kernel panic, ccio-dma.c, C110
From: Ryan Bradetich <rbradetich@uswest.net>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Juergen Braukmann <juergen.braukmann@ruhr-west.de>,
	parisc list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20020717181459.CCD8E48CF@dsl2.external.hp.com>
References: <3D35925D.71683E92@ruhr-west.de>  
	<20020717181459.CCD8E48CF@dsl2.external.hp.com>
Content-Type: text/plain
Date: 17 Jul 2002 17:53:00 -0600
Message-Id: <1026949980.10285.4.camel@beavis>
Mime-Version: 1.0
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

Grant,

Is there a way to make this more intelligent now that we have an I/O
tree?  Maybe driverfs in 2.5.X will help us figure out how to make it
smarter ... it kinda sucks to recompile the kernel because you do not
have enough memory for our default setting of 4.

Seems like we could develop a huristic based on devices below the
iommus.

Just a thought..

- Ryan


On Wed, 2002-07-17 at 12:14, Grant Grundler wrote:
> Juergen Braukmann wrote:
> > Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> 
> Sorry Joel, this has nothing to do with SCSI termination.
> 
> Juergen,
> In arch/parisc/kernel/ccio-dma.c, change ccio_mem_ratio from 4 to 8 or 16.
> For more explanation, search for "Determine IOVA Space size" in ccio-dma.c.
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

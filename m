Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel panic, ccio-dma.c, C110 
In-Reply-To: Message from Juergen Braukmann <juergen.braukmann@ruhr-west.de>
   of "Wed, 17 Jul 2002 17:50:53 +0200." <3D35925D.71683E92@ruhr-west.de>
References: <3D35925D.71683E92@ruhr-west.de> 
Date: Wed, 17 Jul 2002 12:14:59 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020717181459.CCD8E48CF@dsl2.external.hp.com>
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

Juergen Braukmann wrote:
> Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
> resources.

Sorry Joel, this has nothing to do with SCSI termination.

Juergen,
In arch/parisc/kernel/ccio-dma.c, change ccio_mem_ratio from 4 to 8 or 16.
For more explanation, search for "Determine IOVA Space size" in ccio-dma.c.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A68B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 08:07:50 -0700 (MST)
Date: Tue, 26 Nov 2002 16:07:40 +0100
Message-ID: <3DAAAD4600004A10@ocpmta1.be.tiscali.com>
In-Reply-To: <20021124024358.7D5B0482E@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] [PATCH] highmem_io for the sym53c8xx_2 driver?? 
To: "Grant Grundler" <grundler@dsl2.external.hp.com>,
	"Ryan Bradetich" <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>yeah - ccio-dma.c isn't using sg_virt_address() to access to the virtual
>address of an SG list entry. It's defined in include/asm/scatterlist.h.
>See sba_iommu.c on how to use this correctly.
>
>Attached diff is a first cut, untested. My advice is to rewrite the
>loop so sg_virt_address() result is saved once instead of referencing
>the macro 3 (or more) times in the main loop.
>
Hey Grant,

Am I wrong or sg_virt_address() should be called sg_virt_addr()?

Joel

********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be

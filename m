Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A16A4848
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Jul 2002 08:25:51 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>,
	Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-(
Date: Mon, 22 Jul 2002 08:24:13 -0600
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
References: <3D383969.1657EF43@ruhr-west.de> <20020720152919.9D690483D@dsl2.external.hp.com>
In-Reply-To: <20020720152919.9D690483D@dsl2.external.hp.com>
MIME-Version: 1.0
Message-Id: <200207220824.13959.bjorn_helgaas@hp.com>
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

On Saturday 20 July 2002 9:29 am, Grant Grundler wrote:
> Juergen Braukmann wrote:
> > Hi Grant and all,
> >
> > still more tears. I compiled and replaced the kernel, using
> > 2.4.18pa55. I used the setting of ccio_mem_ratio=16, but still my
> > kernel panics with Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU
> > is out of mapping resources.
> > In interrupt handler - not syncing
>
> Sorry - my bad - I think I have it backwards.
> Using a smaller value will result in more IOMMU resource.

I have to ask the obvious question -- why not just always use
the largest possible IOVA space, as IA64 does?  Is it a question
of wasting space on IO PDIR entries?

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2CFD4841
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Jul 2002 17:34:19 -0600 (MDT)
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-(
From: Ryan Bradetich <rbradetich@uswest.net>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3D383969.1657EF43@ruhr-west.de>
References: <3D383969.1657EF43@ruhr-west.de>
Content-Type: text/plain
Date: 19 Jul 2002 17:34:18 -0600
Message-Id: <1027121658.16562.3.camel@beavis>
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

Juergen,

How much memory does this system have?  Also what cards do you have in
which slot. (Please also specify PCI or GSC).

What this driver does is allocates a certian portion of memory at
startup time for a TLB mapping.  Adjusting the ccio_mem_ratio affects
how much memory is allocated at boot.  The U2/UTurn chip has 2 iommus,
and the different GSC/PCI slots fall under specific iommus.  If you
system does not have much memory, and the cards are positioned
approparately, we could turn off the iommu memory allocatation for the
second iommu (the /10 bus).

this is just a thought ... will see what we can do with your
configuration :)

Thanks,

-  Ryan


On Fri, 2002-07-19 at 10:08, Juergen Braukmann wrote:
> Hi Grant and all,
> 
> still more tears. I compiled and replaced the kernel, using 2.4.18pa55.
> I used the setting of ccio_mem_ratio=16, but still my kernel panics with 
> 
> Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
> resources.
> In interrupt handler - not syncing
> 
> would there be more chance with the ccio_mem_ratio setting of 8? Is
> there a way to use more than one Kernel alternativly and select it at
> boottime with palo? Is there an example palo.conf somewhere?
> 
> I will shut down X next and try again. I managed to ftp a large file
> once and all I did after that was getting X to run.
> 
> Juergen
> 
> -- 
> ===========================================     __   _
> Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
> Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
> ===========================================_\_v __/_/_//_/\_,_/ /_/\_\
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

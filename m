Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-( 
In-Reply-To: Message from Juergen Braukmann <juergen.braukmann@ruhr-west.de>
   of "Fri, 19 Jul 2002 18:08:09 +0200." <3D383969.1657EF43@ruhr-west.de>
References: <3D383969.1657EF43@ruhr-west.de> 
Date: Sat, 20 Jul 2002 09:29:19 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020720152919.9D690483D@dsl2.external.hp.com>
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
> Hi Grant and all,
> 
> still more tears. I compiled and replaced the kernel, using 2.4.18pa55.
> I used the setting of ccio_mem_ratio=16, but still my kernel panics with 
> Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
> resources.
> In interrupt handler - not syncing

Sorry - my bad - I think I have it backwards.
Using a smaller value will result in more IOMMU resource.

> would there be more chance with the ccio_mem_ratio setting of 8?

Or 2 or 1 even.

> there a way to use more than one Kernel alternativly and select it at
> boottime with palo? Is there an example palo.conf somewhere?

Yes. Interrupt the boot process before palo is loaded and then
type "Y" to "Interact with IPL (Y/N/Q)?" question. You can then
specify which vmlinux to boot.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 6 Oct 2003 11:28:56 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	"M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on b2k finaly crash]
Message-ID: <20031006172856.GB19370@dsl2.external.hp.com>
References: <3F5CB6FB0000CBFC@ocpmta1.freegates.net> <3F803388.5090304@tiscali.be> <3F804FC9.9040401@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F804FC9.9040401@tiscali.be>
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

On Sun, Oct 05, 2003 at 05:07:21PM +0000, Joel Soete wrote:
> hmm don't think if it's related but just in case:
> I was just copying my kernel tree with 'tar cslpf - 
> linux-2.6.0-test6-pa6 | ( cd Work ; tar xslpf -)' when
> 
> Kernel panic: drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O M.

You ran out of mapping resources.
        panic(__FILE__ ": %s() I/O MMU is out of mapping resources.\n",
	              __FUNCTION__);

> I just retry same operation on the same system with same kernel but 
> doesn't occurs a second time?

Not surprising. The bitmap search will fail if everything gets
mapped "sparsely" or we try to search for a large mapping (>32K, ie more
than 8 pages) but can't find it. If this is repeatible problem, change

	/* Ratio of Host MEM to IOV Space size */
	static unsigned long ccio_mem_ratio = 4;

in drivers/parisc/ccio-dma.c (2.6 kernel) to 2.

One patch would be welcome here: figure out a threshold when
allocations for single pages should share an 8-page "chunk"
(effectively one TLB entry).  E.g. differentiate between LAN
and SCSI requests.  LAN typically wants 1 entry (1500 byte MTU)
unless someone starts testing "Large Send" and is very "linear"
in it's DMA behavior (one DMA stream at a time).  SCSI typically
wants 64k/128k (16 or 32 entries), has lots of those, and any one
of those could be the "next" DMA stream. ie thrashing the IO TLB
is much more likely with SCSI than LAN and we should allocate
entries differently based on that.

The patch might be something like:
	if ((pci_dev->class & MASK) == PCI_BASE_CLASS_NETWORK) {
	...

in the right places to use a different (and new?) search loop.

grant

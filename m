Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from virtualhost.dk (ns.virtualhost.dk [195.184.98.160])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07C1C482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 01:34:28 -0700 (MST)
Date: Fri, 16 Nov 2001 09:33:56 +0100
From: Jens Axboe <axboe@suse.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: "David S. Miller" <davem@redhat.com>, linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20011116093356.D27010@suse.de>
References: <200111160730.AAA18774@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200111160730.AAA18774@puffin.external.hp.com>
Subject: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
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

On Fri, Nov 16 2001, Grant Grundler wrote:
> Hi all,
> Could someone point me to any discussion about adding
> page/offset to struct scatterlist?

See lkml a couple months back, 32-bit dma etc discussion.
> 
> To me, it looks like a half-assed step to support DMA to HIGHMEM
> on 32-bit arches.  TBH, I'd like to see page/offset replace
> address in the pci_map* interfaces and struct scatterlist.
> But then replace it across the board so the DMA mapping code
> doesn't have to decide which field to use (KISS). This really
> belongs in 2.5 kernel.

It's not half-assed, it's needed. I would imagine that pci_map_single
etc stays though, although pci_map_page or pci_map_sg is the preferred
approach.

Regarding the patch -- please add a helper function to set the sg list
instead of introducing CONFIG_HIGHMEM all over the place. I'm assuming
you are missing the piece which leaves out page/offset for non-highmem,
if not you are really pedantic about saving a few cycles :-)

-- 
Jens Axboe

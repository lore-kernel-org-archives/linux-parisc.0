From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] I/O MMU @ fffffffffed20000 is out of mapping
	resources: re-occured
Date: Wed, 23 Feb 2005 15:00:55 -0700
Message-ID: <20050223220055.GD26124@colo.lackof.org>
References: <420B30A200004C1D@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <420B30A200004C1D@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Feb 22, 2005 at 09:30:59AM +0100, Joel Soete wrote:
> Hi all,
> 
> Sorry but this pb:
> Kernel panic - not syncing: /CAD/linux-2.6.11-rc4-pa2-050221/drivers/parisc/sba_iommu.c:
> I/O MMU @ fffffffffed20000 is out of mapping resources
> 
> just re-occured while an apt-get update again.
> (I wrongly though it disappeared because hiden last week eventhought
> I re-mirrored the slice containing deb 'depot')

This is a non-trivial issue that has been around since pci_dma mapping
interface was introduced. Two things need to happen:
1) parisc implements support for dma_mapping_error()
2) drivers use dma_mapping_error() to verify the mapping
   resource they asked for was available.

Sorry, I've been ignoring the issue since I don't see it on my boxes.
I'm not sure why you are seeing it and I'm not.
Likely you have less RAM installed than I (normally 2-4 GB).

Can you try changing sba_mem_ratio to 4 or 2 in drivers/parisc/sba_iommu.c:
/* Ratio of Host MEM to IOV Space size */
static unsigned long sba_mem_ratio = 8;

I'll even take a patch that makes this a commandline parameter :^)
(ie used by both ccio and sba drivers).

sorry,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

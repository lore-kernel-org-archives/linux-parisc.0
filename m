From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: 2.6.... b2k panic with raid1 :-( (I/O MMU ...
	out of mapping ressources)
Date: Thu, 20 Jan 2005 23:08:56 -0700
Message-ID: <20050121060856.GJ6582@colo.lackof.org>
References: <41DE61B800004297@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE61B800004297@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jan 20, 2005 at 11:51:00AM +0100, Joel Soete wrote:
> Hello all,
> 
> Since this morning I mirrored my disks (1 9Gb on 1 36Gb) but as soon as I
> try to 'apt-get update' the system now panic:
> 
> Kernel panic - not syncing: /CAD/linux-2.6.11-rc1-pa3/drivers/parisc/sba_iommu.c:
> I/O MMU @ fed20000 is out of mapping resources

Yes - this has been the expected behavior since ~1999.

The basic problem can be addressed by modifying the drivers that use DMA
services to also check dma_mapping_error() (or pci_dma_mapping_error()
if one prefers). I'll need to add some code to
include/asm-parisc/dma-mapping.h to provide support for failed mappings
before I can remove the panic. This won't happen soon unfortunately.

> I just find a work around: mark a slice failed (mdadm --fail /dev/sda10)
> and I can now doing my 'apt-get update'

Good idea - that just cut in half the number of mappings needed.

thanks for the report and feel free to remind in a few weeks about
this again.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75C8E483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 10:31:19 -0700 (MST)
Date: Wed, 24 Mar 2004 10:31:17 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Eric Sproul <esproul@ntelos.net>
Subject: Re: [parisc-linux] gdth driver on L2000
Message-ID: <20040324173117.GA32052@colo.lackof.org>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
Cc: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 24, 2004 at 10:31:20AM -0500, Eric Sproul wrote:
> Forgive me if this is a FAQ.

It's not - no problem

...
> I want to use an Intel SRCU RAID controller in this machine, so I
> modified my config to build the gdth driver into the kernel.  It fails
> with an error about DMA_MODE_CASCADE being undeclared.  Looking further,
> I note that this is normally declared in include/asm-$ARCH/dma.h, but it
> doesn't appear in include/asm-parisc/dma.h.  Is it undeclared because it
> doesn't work or because no one has needed it before?

DMA_MODE_CASCADE is for ISA bus support (8237A chips).
AFAIK, parisc doesn't support ISA.

And EISA support isn't fully working yet.
EISA support still needs some code written for the WAX chip IOMMU.

gdth is a "multi-bus" driver:
	static int gdth_init_eisa(ushort eisa_adr,gdth_ha_str *ha);
	static int gdth_init_isa(ulong32 bios_adr,gdth_ha_str *ha);
	static int gdth_init_pci(gdth_pci_str *pcistr,gdth_ha_str *ha);

The problem is the driver assumes EISA/ISA/PCI are all enabled.
The linux-2.6/drivers/scsi/Kconfig entry says only any one of those:
config SCSI_GDTH
        tristate "Intel/ICP (former GDT SCSI Disk Array) RAID Controller support
"
        depends on (ISA || EISA || PCI) && SCSI

In short, the driver needs to be mangled so it works with only PCI enabled.
[ Actually, this driver violates Documentation/CodingStyle pretty seriously.
  o too many "#if LINUX_VERSION_CODE" spread out all over the place.
  o indentation is 4 spaces and nests too deep
]

> Would I be better off with a 2.6 kernel?

Not really. linux-2.6 shows the same problem:
grundler <507>fgrep DMA_MODE_CASCADE drivers/*/gdth*
drivers/scsi/gdth.c:                set_dma_mode(ha->drq,DMA_MODE_CASCADE);

I've hacked a quick patch together that lets this driver *build* without
ISA/EISA support using linux-2.6/arch/parisc/configs/a500_defconfig.
Just enable CONFIG_GDTH and apply this patch:
	ftp://ftp.parisc-linux.org/patches/diff-2.6.5-gdth-01

If it "works for you", please submit the patch to linux-scsi mailing list
(linux-scsi@vger.kernel.org) and cc parisc-linux mailing list.


> I took the lack of stock 2.6
> kernels for hppa in sid to mean that there was a problem, but I'd love
> to be wrong about that.

2.6 is working pretty well and I think it's just up to someone to
package and upload a linux-2.6 kernel*hppa.deb.

Thanks to Paul Bame, prebuilt tar balls and .debs of nightly builds
are available for both 2.4 and 2.6 hppa kernels:
	http://cvs.parisc-linux.org/download/linux-2.4/
	http://cvs.parisc-linux.org/download/linux-2.6/

For the L2000, you can run the "a500" flavor builds.

grant

From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] what's in parisc-2.6.git
Date: Thu, 18 Oct 2007 04:29:53 -0400
Message-ID: <20071018082953.GB16148__12542.1542594724$1416624445$gmane$org@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: akpm@linux-foundation.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git
http://www.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

Any last minute things for the 2.6.24 merge window? I'm still sitting on
a lot of development work I've been doing for the last 6 months. Will be
working on getting that merged for 2.6.25 now that things seem to mostly
work from release to release in Linus' tree.

Hooray, this is the first -rc1 cycle where I haven't had to do a
bisect-from-hell to figure out why all my machines won't boot.

[Note, I've given up on the quilt tree for now, because it ended up
being a bit more hassle than just keeping topic branches around.]

Cheers,
	Kyle

Adrian Bunk (1):
      [PARISC] parisc: "extern inline" -> "static inline"

Christoph Lameter (1):
      [PARISC] Use page allocator instead of slab allocator in pci-dma.c

Jeff Bailey (1):
      [PARISC] Export pdc.h for palo

Kyle McMartin (15):
      [PARISC] Wire up sys_fallocate (and compat_sys_fallocate)
      [PARISC] Clean up asm-parisc/pdc.h
      [PARISC] Update defconfigs
      [PARISC] import necessary bits of libgcc.a
      [PARISC] Kill pointless variable use in time.c
      [PARISC] Unbreak processor_probe when we have more than NR_CPUS
      [PARISC] Kill zone_to_nid printk warning
      [PARISC] Kill incorrect cast warning in unwinder
      [PARISC] Clean up a resource_size_t warning in sba_iommu
      [PARISC] Kill off the last vestiges of ASM_PAGE_SIZE
      [PARISC] Clean up pointless ASM_PAGE_SIZE_DIV use
      [PARISC] Remove hardcoded uses of PAGE_SIZE
      [PARISC] Kill off broken irqstack code
      [PARISC] Squelch pci_enable_device __must_check warning in superio
      [PARISC] Quiet sysfs_create_link __must_check warnings in pdc_stable

Sam Ravnborg (2):
      [PARISC] Beautify parisc vmlinux.lds.S
      [PARISC] Kill off ASM_PAGE_SIZE use

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

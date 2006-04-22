From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [git patches] please pull on parisc tree
Date: Fri, 21 Apr 2006 20:01:09 -0400
Message-ID: <20060422000109.GA10514@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@osdl.org
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

Hi Linus,

Not a whole lot of change here so I think it is appropriate for 2.6.17-rc3.
The biggest diff here is catching up with the syscall additions, and making
ioremap default to _nocache behaviour so more drivers work. The multiple
page size code is mostly replacing hardcoded values with #defines where
appropriate, and is well tested by Helge.

Cheers,
	Kyle

The following changes since commit f4ffaa452e71495a06376f12f772342bc57051fc:
are found in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

Grant Grundler:
      [PARISC] Document that we tolerate "Relaxed Ordering"

Helge Deller:
      [PARISC] EISA regions must be mapped NO_CACHE
      [PARISC] Misc. janitorial work
      [PARISC] defconfig updates
      [PARISC] Further work for multiple page sizes

Kyle McMartin:
      [PARISC] Add new entries to the syscall table
      [PARISC] Make ioremap default to _nocache
      [PARISC] MAINTAINERS

Matthew Wilcox:
      [PARISC] Fix up hil_kbd.c mismerge

Stuart Brady:
      [PARISC] OSS ad1889: Match register names with ALSA driver

 MAINTAINERS                        |    4 
 arch/parisc/Kconfig                |   31 ++
 arch/parisc/defconfig              |  494 +++++++++++++++++++++++-------------
 arch/parisc/kernel/asm-offsets.c   |    3 
 arch/parisc/kernel/cache.c         |    4 
 arch/parisc/kernel/entry.S         |   36 ++-
 arch/parisc/kernel/head.S          |   15 +
 arch/parisc/kernel/init_task.c     |   10 -
 arch/parisc/kernel/pacache.S       |   25 +-
 arch/parisc/kernel/sys_parisc.c    |    8 +
 arch/parisc/kernel/syscall.S       |   10 -
 arch/parisc/kernel/syscall_table.S |    8 +
 arch/parisc/kernel/vmlinux.lds.S   |   54 ++--
 arch/parisc/mm/fault.c             |    2 
 arch/parisc/mm/init.c              |   28 +-
 arch/parisc/mm/ioremap.c           |    3 
 drivers/input/keyboard/hil_kbd.c   |    2 
 drivers/parisc/pdc_stable.c        |    2 
 drivers/parisc/sba_iommu.c         |   43 ++-
 drivers/parisc/superio.c           |    4 
 include/asm-parisc/io.h            |   17 -
 include/asm-parisc/page.h          |   25 ++
 include/asm-parisc/pgtable.h       |   63 +++--
 include/asm-parisc/unistd.h        |    8 +
 sound/oss/ad1889.c                 |  198 +++++++-------
 sound/oss/ad1889.h                 |  101 ++++---
 26 files changed, 734 insertions(+), 464 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

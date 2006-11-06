From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Changesets for Linus
Date: Sun, 5 Nov 2006 20:31:58 -0700
Message-ID: <20061106033157.GJ27140@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


Kyle's asked me to put together a set of patches for Linus, and here's a
list of the patches I'm intending to include.  I'd appreciate feedback if
there's anything that people don't feel is ready to go upstream yet.
I may well combine a few changesets if they happen to do something, take
it out, then put it back in again, for example.

commit 743eb36af4816ab78fad79bfa68e3d4cdd12696f
Author: Kyle McMartin <kyle@parisc-linux.org>
Date:   Sun Aug 13 22:19:53 2006 -0400

    Disallow RESOURCES_64BIT

commit 9d5cf02f00cce18072f5e4b1e10a4434beb9b422
Author: Helge Deller <deller@gmx.de>
Date:   Sat Oct 14 20:02:15 2006 +0200

            avoid compiler warnings when compiling 64bit

(portions of that one anyway, some bits aren't needed any more)

commit a563a4604c1d9d9d2952cfb1006dd0a10570a55e
Author: Helge Deller <deller@gmx.de>
Date:   Sat Oct 14 22:11:32 2006 +0200

        use BUILD_BUG_ON() and constify static array

commit 2e6dd5e77529c1b7d1f8bdf4bdd7e07cc60833cc
Author: Kyle McMartin <kyle@athena.road.mcmartin.ca>
Date:   Sun Oct 15 22:40:27 2006 -0400

    bloody printf fmt string warnings

(I might change the commit message ;-)

commit 7f4e3e4b954a2ed0467cae42fec52e7f8cb3511b
Author: Kyle McMartin <kyle@mako.i.cabal.ca>
Date:   Mon Oct 16 00:29:47 2006 -0400

    Reserve 1GB of space for vmalloc/tmpalias space on parisc64

commit 4b6e7aff55b30fae856fe58b9ccf430235ebddae
Author: Helge Deller <deller@gmx.de>
Date:   Sat Oct 14 22:10:44 2006 +0200

        show more memory information and memory layout at bootup as i386 does

commit 18292d9958132333df061fca631d74d91ddee9fc
Author: Kyle McMartin <kyle@mako.i.cabal.ca>
Date:   Mon Oct 16 20:34:00 2006 -0400

    Unbreak discontigmem configs

commit 2049c31ef50fd1b5ff569346ee53b057689a7bfd
Author: Helge Deller <deller@gmx.de>
Date:   Wed Oct 18 21:44:30 2006 +0200

        trivial: fix printk message, add missing ')'

commit b6f36d52c15c292bebf20e6af2f9234fd8dc99cc
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Fri Oct 13 12:32:50 2006 -0600

    Delete arch/parisc/mm/kmap.c again

commit fc0c84fdb74ae0dda94ae54c7bb10d62cc8ffce8
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Tue Oct 24 13:49:54 2006 -0600

    Fix integer/pointer warning

commit 1c390fb3ec8b9d3526e3b915c5c47ead21b7579a
Author: Ryan Bradetich <rbrad@j6000.(none)>
Date:   Thu Oct 26 01:27:18 2006 +0000

    Fix ccio_request_resource when CONFIG_IOMMU_CCIO is not defined.

commit 37a6195ce6a929b4bb4414aaad4a832ad0ad4bb7
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Thu Oct 26 10:06:07 2006 -0600

    PA-RISC: sparse fixes

commit 1c5484420c0a451eafd30121fd1fcc62bd234f1e
Author: Kyle McMartin <kyle@athena.road.mcmartin.ca>
Date:   Mon Oct 30 11:42:24 2006 -0500

    Enable CONFIG_LOCALVERSION_AUTO in defconfigs

commit 51b7e5b02eb56d5560ecf89231f2e2be5ef2805e
Author:  <rbradetich@gmail.com>
Date:   Fri Nov 3 05:05:01 2006 +0000

    HPPB bus updates for E-Class systems.

commit 0ce7ad9bc32ed7ee90df315bae7f6a406cae997f
Author:  <rbradetich@gmail.com>
Date:   Fri Nov 3 05:38:39 2006 +0000

    Mux driver bug fix.

commit 4519e71625d9c2bd44f8db3b4b7e0bac722e39c9
Author:  <rbradetich@gmail.com>
Date:   Fri Nov 3 05:52:41 2006 +0000

    Mux driver updates.
    
commit 6f53c0827f4083c84afce220f07b420ab88d6d78
Author:  <rbrad@j6000.bradetich.net>
Date:   Fri Nov 3 06:34:16 2006 +0000

    Claim resources for the Mux driver.

commit 5575d19a9c5d2dcf0ec79b6eb74a772f552c741d
Author: Ryan Bradetich <rbradetich@gmail.com>
Date:   Sun Nov 5 01:21:44 2006 +0000

    Make the Serial Mux driver work as module.

commit e1782fb22d23a5daa1c6b1184fc6a6944bc51995
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Sun Nov 5 15:24:48 2006 -0700

    PARISC: sparse fixes


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

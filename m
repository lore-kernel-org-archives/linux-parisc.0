From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: -pa2 broke N4000/A500
Date: Wed, 14 Dec 2005 12:02:19 -0700
Message-ID: <20051214190219.GC15899@colo.lackof.org>
References: <20051212151131.GD9286@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051212151131.GD9286@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 12, 2005 at 08:11:31AM -0700, Matthew Wilcox wrote:
> 
> Grant, your lba_pci changes to support rp3440 broke A500 and N4000.
> CVS2_6_15_RC5_PA1 boots fine.

Willy,
Just wanted to ACK on p-l mailing list that I did break this - apologies again.

I've posted the following patch (on top of what willy committed)
to parisc-linux-cvs mailing list and it only needs testing on C3000.

thanks,
grant

> willy@palinux:~/linux-2.6$ cvs up -rCVS2_6_15_RC5_PA2
> U Makefile
> U drivers/parisc/lba_pci.c
...


Index: drivers/parisc/lba_pci.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/lba_pci.c,v
retrieving revision 1.35
diff -u -p -r1.35 lba_pci.c
--- drivers/parisc/lba_pci.c	12 Dec 2005 15:50:34 -0000	1.35
+++ drivers/parisc/lba_pci.c	12 Dec 2005 17:21:26 -0000
@@ -809,8 +809,7 @@ lba_fixup_bus(struct pci_bus *bus)
 		}
 		/* advertize Host bridge resources to PCI bus */
 		bus->resource[0] = &(ldev->hba.io_space);
-		bus->resource[1] = &(ldev->hba.lmmio_space);
-		i = 2;
+		i = 1;
 
 		if (ldev->hba.elmmio_space.start) {
 			err = request_resource(&iomem_resource,
@@ -831,7 +830,7 @@ lba_fixup_bus(struct pci_bus *bus)
 
 		/*   Overlaps with elmmio can (and should) fail here.
 		 *   We will prune (or ignore) the distributed range.

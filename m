From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 8 Nov 2006 15:07:06 +0100
Message-ID: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Wed__8_Nov_2006_15_07_06_+0100_Az_r2JZvx/QF+cTa"
To: parisc-linux@lists.parisc-linux.org
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

This is a multi-part message in MIME format.

--Multipart=_Wed__8_Nov_2006_15_07_06_+0100_Az_r2JZvx/QF+cTa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi All,

Referencing this thread about a crash when there is a pcmcia bridge plugged in a C3600 :
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/030312.html

This small patch avoid a crash at boot time.

It's certainly not perfect as it would be better to fix pci_scan_bus_parented() which returns NULL but at least it makes the box booting.

Thanks for applying or fixing this in a better way :)


Cheers,
  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port Lead

--Multipart=_Wed__8_Nov_2006_15_07_06_+0100_Az_r2JZvx/QF+cTa
Content-Type: text/x-patch;
 name="lba-pci-no-crash.diff"
Content-Disposition: attachment;
 filename="lba-pci-no-crash.diff"
Content-Transfer-Encoding: 7bit

diff -uNr linux-2.6.18.2-hppa.orig/drivers/parisc/lba_pci.c linux-2.6.18.2-hppa/drivers/parisc/lba_pci.c
--- linux-2.6.18.2-hppa.orig/drivers/parisc/lba_pci.c	2006-11-08 13:59:32.000000000 +0100
+++ linux-2.6.18.2-hppa/drivers/parisc/lba_pci.c	2006-11-08 14:13:14.000000000 +0100
@@ -1557,7 +1557,8 @@
 		lba_dump_res(&lba_dev->hba.lmmio_space, 2);
 #endif
 	}
-	pci_enable_bridges(lba_bus);
+	if (lba_bus)
+		pci_enable_bridges(lba_bus);
 
 
 	/*

--Multipart=_Wed__8_Nov_2006_15_07_06_+0100_Az_r2JZvx/QF+cTa
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Wed__8_Nov_2006_15_07_06_+0100_Az_r2JZvx/QF+cTa--

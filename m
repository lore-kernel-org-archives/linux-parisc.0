Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FE484856
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 11:38:41 -0700 (MST)
Date: Tue, 9 Mar 2004 11:38:39 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Results of (IDE) kernel tests with modified io.c
Message-ID: <20040309183839.GA19675@colo.lackof.org>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040309072917.GN1113@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 08, 2004 at 11:29:17PM -0800, Randolph Chung wrote:
...
> Grant tells me that he suspects there's a bug somewhere in the pci
> config accessor functions tho...

After getting some sleep, I'm convinced the lba_pci.c cfg accessors
are wrong. The following patch should fix the write path and IIRC,
Randolph already tried this out.

Two remaining issues:
1) I still need to figure out why the "TR4PLUS" code path doesn't work
   for config space read function. It still crashes with changes
   similar to the write path.

2) Both "astro" based workstations and servers provide PCI config
   accessors via PDC. A patch to support those was submitted a month
   or so ago but I haven't heard back if the submitter could/would
   apply the requested changes.

thanks,
grant

Index: drivers/parisc/lba_pci.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/lba_pci.c,v
retrieving revision 1.9
diff -u -p -r1.9 lba_pci.c
--- a/drivers/parisc/lba_pci.c	4 Feb 2004 16:31:16 -0000	1.9
+++ b/drivers/parisc/lba_pci.c	9 Mar 2004 06:57:06 -0000
@@ -613,13 +612,14 @@ static int lba_cfg_write(struct pci_bus 
 	/* Basic Algorithm */
 	LBA_CFG_TR4_ADDR_SETUP(d, tok | pos);
 	switch(size) {
-	case 1: WRITE_REG8 (data, d->hba.base_addr + LBA_PCI_CFG_DATA);
+	case 1: WRITE_REG8 (data, d->hba.base_addr + LBA_PCI_CFG_DATA + (pos & 3));
 		   break;
-	case 2: WRITE_REG16(data, d->hba.base_addr + LBA_PCI_CFG_DATA);
+	case 2: WRITE_REG16(data, d->hba.base_addr + LBA_PCI_CFG_DATA + (pos & 2));
 		   break;
 	case 4: WRITE_REG32(data, d->hba.base_addr + LBA_PCI_CFG_DATA);
 		   break;
 	}
+	/* flush posted write */
 	lba_t32 = READ_REG32(d->hba.base_addr + LBA_PCI_CFG_ADDR);
 	return 0;
 }

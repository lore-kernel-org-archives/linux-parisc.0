Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9B534840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:29:30 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 3F9BD298043
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:29:30 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 26688-07 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 24 Nov 2003 00:29:29 -0700 (MST)
Date: Mon, 24 Nov 2003 00:29:29 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031124072929.GC26585@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] DIFF 2.6.0-test10 SATA dma_address
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

Willy, Alan,

SATA support attempts to directly reference scattergather.dma_address
and .dma_length. That's wrong since those are arch specific fields.
alpha, cris, parisc, ppc64, sparc, and sparc64 won't build SATA.

SATA code needs to use "sg_dma_address()" and sg_dma_len()" macros
to reference those fields.

If this patch looks good, please tell me which forum (linux-scsi?)
this needs to be posted to.

Patch appended and also available from:
	ftp://ftp.parisc-linux.org/patches/diff-2.6.0-t10-sata

The code now compiles but I've not yet built a kernel (forgot to
disable KALLSYMS - toolchain bugs) and don't have the HW to test it. 

cheers,
grant


Index: drivers/scsi/libata-core.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/scsi/libata-core.c,v
retrieving revision 1.3
diff -u -p -r1.3 libata-core.c
--- drivers/scsi/libata-core.c	24 Nov 2003 03:16:17 -0000	1.3
+++ drivers/scsi/libata-core.c	24 Nov 2003 06:28:18 -0000
@@ -1627,8 +1627,8 @@ static void ata_sg_clean(struct ata_queu
 	if (cmd->use_sg)
 		pci_unmap_sg(ap->host_set->pdev, sg, qc->n_elem, dir);
 	else
-		pci_unmap_single(ap->host_set->pdev, sg[0].dma_address,
-				 sg[0].length, dir);
+		pci_unmap_single(ap->host_set->pdev, sg_dma_address(&sg[0]),
+				 sg_dma_len(&sg[0]), dir);
 
 	qc->flags &= ~ATA_QCFLAG_SG;
 	qc->sg = NULL;
@@ -1651,8 +1651,8 @@ void ata_fill_sg(struct ata_queued_cmd *
 	assert(qc->n_elem > 0);
 
 	for (i = 0; i < qc->n_elem; i++) {
-		ap->prd[i].addr = cpu_to_le32(sg[i].dma_address);
-		ap->prd[i].flags_len = cpu_to_le32(sg[i].length);
+		ap->prd[i].addr = cpu_to_le32(sg_dma_address(&sg[i]));
+		ap->prd[i].flags_len = cpu_to_le32(sg_dma_len(&sg[i]));
 		VPRINTK("PRD[%u] = (0x%X, 0x%X)\n",
 			i, le32_to_cpu(ap->prd[i].addr), le32_to_cpu(ap->prd[i].flags_len));
 	}
@@ -1683,12 +1683,12 @@ static int ata_sg_setup_one(struct ata_q
 
 	sg->page = virt_to_page(cmd->request_buffer);
 	sg->offset = (unsigned long) cmd->request_buffer & ~PAGE_MASK;
-	sg->length = cmd->request_bufflen;
+	sg_dma_len(sg) = cmd->request_bufflen;
 
 	if (!have_sg)
 		return 0;
 
-	sg->dma_address = pci_map_single(ap->host_set->pdev,
+	sg_dma_address(sg) = pci_map_single(ap->host_set->pdev,
 					 cmd->request_buffer,
 					 cmd->request_bufflen, dir);
 
@@ -1909,7 +1909,7 @@ static void ata_pio_sector(struct ata_po
 	qc->cursg_ofs++;
 
 	if (cmd->use_sg)
-		if ((qc->cursg_ofs * ATA_SECT_SIZE) == sg[qc->cursg].length) {
+		if ((qc->cursg_ofs * ATA_SECT_SIZE) == sg_dma_len(&sg[qc->cursg])) {
 			qc->cursg++;
 			qc->cursg_ofs = 0;
 		}
Index: drivers/scsi/sata_promise.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/scsi/sata_promise.c,v
retrieving revision 1.3
diff -u -p -r1.3 sata_promise.c
--- drivers/scsi/sata_promise.c	24 Nov 2003 03:16:17 -0000	1.3
+++ drivers/scsi/sata_promise.c	24 Nov 2003 06:28:18 -0000
@@ -603,8 +603,8 @@ static void pdc20621_fill_sg(struct ata_
 	last = qc->n_elem;
 	idx = 0;
 	for (i = 0; i < last; i++) {
-		buf[idx++] = cpu_to_le32(sg[i].dma_address);
-		buf[idx++] = cpu_to_le32(sg[i].length);
+		buf[idx++] = cpu_to_le32(sg_dma_address(&sg[i]));
+		buf[idx++] = cpu_to_le32(sg_dma_len(&sg[i]));
 		total_len += sg[i].length;
 	}
 	buf[idx - 1] |= cpu_to_le32(ATA_PRD_EOT);

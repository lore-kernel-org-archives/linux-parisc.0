Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD905478C.dip.t-dialin.net [217.5.71.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F159482A
	for <parisc-linux@parisc-linux.org>; Thu, 21 Jun 2001 16:17:40 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id AAA12846
	for parisc-linux@parisc-linux.org; Fri, 22 Jun 2001 00:14:58 +0200
Date: Fri, 22 Jun 2001 00:14:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] misc stuff
Message-ID: <20010622001458.A12695@solo.franken.de>
References: <20010621225016.A10091@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010621225016.A10091@solo.franken.de>; from tsbogend@alpha.franken.de on Thu, Jun 21, 2001 at 10:50:16PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 21, 2001 at 10:50:16PM +0200, Thomas Bogendoerfer wrote:
> with the new changes to io.h enabling of HPPA_IOREMAP is really deadly. There
> are some ioremap in drivers missing. The diff below gets my 712 up again.

oops, forgot the diff.

Thomas.

Index: drivers/gsc/serial.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gsc/serial.c,v
retrieving revision 1.11
diff -u -r1.11 serial.c
--- drivers/gsc/serial.c	2001/06/14 09:50:22	1.11
+++ drivers/gsc/serial.c	2001/06/21 01:22:48
@@ -66,7 +66,7 @@
 	serial->type = PORT_16550A;
 
 	serial->line = serial_line_nr;
-	serial->iomem_base = (void*) (((unsigned long) d->hpa) + 0x800);
+	serial->iomem_base = (void*)ioremap((((unsigned long) d->hpa) + 0x800),0x80);
 
 	serial->irq = irq; 
 	serial->io_type = SERIAL_IO_MEM;	/* define access method */
Index: drivers/scsi/lasi7xx.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/scsi/lasi7xx.c,v
retrieving revision 1.14
diff -u -r1.14 lasi7xx.c
--- drivers/scsi/lasi7xx.c	2001/03/03 05:07:36	1.14
+++ drivers/scsi/lasi7xx.c	2001/06/21 01:29:02
@@ -88,7 +88,7 @@
 lasi_scsi_callback_700(struct hp_device *d, struct pa_iodc_driver *dri)
 {
 	hosts_used = sim700_init_host(hosts_tptr, 700, 
-			(unsigned long)d->hpa + LASI_SCSI_CORE_OFFSET,
+			ioremap((unsigned long)d->hpa + LASI_SCSI_CORE_OFFSET, 0x100),
 			busdevice_alloc_irq(d), OPT_NCR_LE);
 
 	return (hosts_used == 0);
@@ -98,7 +98,7 @@
 lasi_scsi_callback_710(struct hp_device *d, struct pa_iodc_driver *dri)
 {
 	hosts_used = sim700_init_host(hosts_tptr, 710, 
-			(unsigned long)d->hpa + LASI_SCSI_CORE_OFFSET,
+			ioremap((unsigned long)d->hpa + LASI_SCSI_CORE_OFFSET,0x100),
 			busdevice_alloc_irq(d), 0);
 
 	return (hosts_used == 0);

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 492F0482B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Feb 2002 12:48:58 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org,
	deller@dsl2.external.hp.com (Helge Deller),
	parisc-linux-cvs@lists.parisc-linux.org
Date: Sat, 2 Feb 2002 20:43:14 +0100
References: <20020202194652.B1F8D482A@dsl2.external.hp.com>
In-Reply-To: <20020202194652.B1F8D482A@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_248X1F1YIHV619DL20CM"
Message-Id: <200202022043.14099.deller@gmx.de>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux deller
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

--------------Boundary-00=_248X1F1YIHV619DL20CM
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

On Saturday 02 February 2002 20:46, Helge Deller wrote:
> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	deller	02/02/02 12:46:52
>
> Modified files:
> 	drivers/video/sti: sticore.c
>
> Log message:
> add #if 1 / #endif around the c3k VisEG PCI work-around, it easier to
> enable/disable

--------------Boundary-00=_248X1F1YIHV619DL20CM
Content-Type: text/plain;
  charset="iso-8859-1";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="diff"

Index: sticore.c
===================================================================
RCS file: /var/cvs/linux/drivers/video/sti/sticore.c,v
retrieving revision 1.33
diff -u -p -r1.33 sticore.c
--- sticore.c	2002/01/28 22:54:40	1.33
+++ sticore.c	2002/02/02 19:45:58
@@ -936,10 +936,11 @@ static int __devinit sticore_pci_init(st
 	/* XXX */
 	/* A Visualize EG PCI graphics card in a c3000 would crash the machine. */
 	/* This is an ugly work-around */
-#warning "FIXME: VisEG PCI graphic card crashes c3000"
 	switch (CPU_HVERSION) {
 	case 0x5BB:
 	case 0x5BC:
+#if 1
+#warning "FIXME: VisEG PCI graphic card crashes c3000"
 		if (pd->device == 0x1005) { /* "A4977A Visualize EG" */
 			printk("I'm not trying to set up the PCI graphic card now... "
 				"It would freeze your machine !\n");
@@ -947,6 +948,7 @@ static int __devinit sticore_pci_init(st
 			break;
 		}
 		/* fall through */
+#endif
 	default:
 		sti = sti_try_rom_generic(rom_base, fb_base, pd);
 		if (sti) {

--------------Boundary-00=_248X1F1YIHV619DL20CM--

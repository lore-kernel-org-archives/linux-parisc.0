Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EC3548D9
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 15:49:23 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3jPt-0001pk-LJ; Sun, 28 Sep 2003 22:49:21 +0100
Date: Sun, 28 Sep 2003 22:49:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: zalon/ncr53c720 (linux-2.6.0-test5-pa22) broken on C110
Message-ID: <20030928214921.GN24824@parcelfarce.linux.theplanet.co.uk>
References: <3F76A312.8090603@tiscali.be> <20030928122414.GF24824@parcelfarce.linux.theplanet.co.uk> <3F77227F.7000400@tiscali.be> <3F774571.6050100@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F774571.6050100@tiscali.be>
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

On Sun, Sep 28, 2003 at 08:32:49PM +0000, Joel Soete wrote:
> Joel Soete wrote:
> 
> >Sorry it already failled with following satck dump:

OK; we don't need the stack dump since that's already fixed in the top
of tree.

> >zalon_probe: Zalon vers field is 0x1, IRQ 34
> >ncr53c720-0: rev 0xf on bus 0 device 0 function 0 irq 34
> >ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> >ncr53c720-0: suspicious SCSI data while resetting the BUS.
> >ncr53c720-0: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 
> >0x3fdff00, expecting 0x100
> >ncr53c720-0: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE 
> >POWER etc.!
> >ncr53c720-0: detaching...
> >
> >Now what do you thing foward pa20 or backward pa14?
> >
> Well:
> hpalin login: root
> Password:
> Last login: Sun Sep 28 21:48:39 2003 on ttyS0
> Linux hpalin 2.6.0-test5-pa14 #1 Sun Sep 28 22:10:24 CEST 2003 parisc 
> GNU/Linux
> 
> So break is in patch...-pa14-pa18 (if I am lucky I could check it next 
> week :) )

OK.  Can you try applying the following patch to -pa18?  Note that
applying this patch to the top of the tree will not work (you'd need an
additional patch for that).

Index: sym53c8xx_defs.h
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/scsi/sym53c8xx_defs.h,v
retrieving revision 1.4
retrieving revision 1.3
diff -u -p -r1.4 -r1.3
--- sym53c8xx_defs.h	24 Sep 2003 02:43:42 -0000	1.4
+++ sym53c8xx_defs.h	11 Sep 2003 18:50:08 -0000	1.3
@@ -497,10 +554,20 @@
 
 #else
 
+#ifdef CONFIG_SCSI_NCR53C8XX_NO_WORD_TRANSFERS
+/* Only 8 or 32 bit transfers allowed */
+#define INW_OFF(o)		(readb((char *)np->reg + ncr_offw(o)) << 8 | readb((char *)np->reg + ncr_offw(o) + 1))
+#else
 #define INW_OFF(o)		readw_raw((char *)np->reg + ncr_offw(o))
+#endif
 #define INL_OFF(o)		readl_raw((char *)np->reg + (o))
 
+#ifdef CONFIG_SCSI_NCR53C8XX_NO_WORD_TRANSFERS
+/* Only 8 or 32 bit transfers allowed */
+#define OUTW_OFF(o, val)	do { writeb((char)((val) >> 8), (char *)np->reg + ncr_offw(o)); writeb((char)(val), (char *)np->reg + ncr_offw(o) + 1); } while (0)
+#else
 #define OUTW_OFF(o, val)	writew_raw((val), (char *)np->reg + ncr_offw(o))
+#endif
 #define OUTL_OFF(o, val)	writel_raw((val), (char *)np->reg + (o))
 
 #endif

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

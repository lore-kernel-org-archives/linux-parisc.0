Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: jochen@scram.de (Jochen Friedrich),
	parisc-linux@lists.parisc-linux.org (HP900 PARISC mailing list)
Subject: Re: [parisc-linux] Patch to enable IrDA :-) 
In-Reply-To: Message from Alan Cox <alan@lxorguk.ukuu.org.uk>
   of "Wed, 01 May 2002 01:43:25 BST." <E172iDN-0000pm-00@the-village.bc.nu>
References: <E172iDN-0000pm-00@the-village.bc.nu> 
Date: Sun, 07 Jul 2002 00:33:49 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020707063349.DAB344850@dsl2.external.hp.com>
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

Alan Cox wrote:
> With these ifdefs for ARM and parisc maybe
> 
> 	arg = IRDA_MODEM_BITS;
> 
> and sticking tha tin the header would be good ?

A few monthes later...here's a patch that does this for i386 and parisc.
Should I commit this to the parisc-linux CVS?

(also available as ftp://ftp.parisc-linux.org/patches/diff.irtty_bits)

grant


Index: drivers/net/irda/irtty.c
===================================================================
RCS file: /var/cvs/linux/drivers/net/irda/irtty.c,v
retrieving revision 1.8
diff -u -p -r1.8 irtty.c
--- drivers/net/irda/irtty.c	2001/11/09 23:36:06	1.8
+++ drivers/net/irda/irtty.c	2002/07/07 06:30:36
@@ -760,14 +760,11 @@ static int irtty_set_dtr_rts(struct net_
 	struct irtty_cb *self;
 	struct tty_struct *tty;
 	mm_segment_t fs;
-	int arg = 0;
+	int arg = TIOCM_MODEM_BITS;
 
 	self = (struct irtty_cb *) dev->priv;
 	tty = self->tty;
 
-#ifdef TIOCM_OUT2 /* Not defined for ARM */
-	arg = TIOCM_OUT2;
-#endif
 	if (rts)
 		arg |= TIOCM_RTS;
 	if (dtr)
Index: include/asm-i386/termios.h
===================================================================
RCS file: /var/cvs/linux/include/asm-i386/termios.h,v
retrieving revision 1.3
diff -u -p -r1.3 termios.h
--- include/asm-i386/termios.h	2001/07/05 21:38:41	1.3
+++ include/asm-i386/termios.h	2002/07/07 06:30:36
@@ -37,6 +37,8 @@ struct termio {
 #define TIOCM_OUT2	0x4000
 #define TIOCM_LOOP	0x8000
 
+#define TIOCM_MODEM_BITS       TIOCM_OUT2      /* IRDA support */
+
 /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
 
 /* line disciplines */
Index: include/asm-parisc/termios.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/termios.h,v
retrieving revision 1.6
diff -u -p -r1.6 termios.h
--- include/asm-parisc/termios.h	2001/07/11 17:20:32	1.6
+++ include/asm-parisc/termios.h	2002/07/07 06:30:36
@@ -37,6 +37,9 @@ struct termio {
 #define TIOCM_OUT2	0x4000
 #define TIOCM_LOOP	0x8000
 
+/* IRDA support - PA-RISC uses OUT1 as hardware flow control bit. */
+#define TIOCM_MODEM_BITS        (TIOCM_OUT2 | TIOCM_OUT1)
+
 /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
 
 /* line disciplines */

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64D37482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Jun 2002 11:06:46 -0600 (MDT)
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Patch to enable IrDA :-) 
In-Reply-To: Message from Jochen Friedrich <jochen@scram.de>
   of "Wed, 01 May 2002 02:08:48 +0200." <Pine.LNX.4.44.0205010207430.4938-100000@alpha.bocc.de>
References: <Pine.LNX.4.44.0205010207430.4938-100000@alpha.bocc.de> 
Date: Sun, 02 Jun 2002 11:06:46 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020602170646.64D37482A@dsl2.external.hp.com>
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

Jochen Friedrich wrote:
> Hi,
> 
> this tiny patch enables the usage of IrDA dongles on the PA-RISC :-)

No one has committed this yet since Alan Cox suggested:

| With these ifdefs for ARM and parisc maybe
| 
|        arg = IRDA_MODEM_BITS;
| 
| and sticking that in the header would be good ?

I took a quick look.

>  #ifdef TIOCM_OUT2 /* Not defined for ARM */
>         arg = TIOCM_OUT2;
> +#endif

This comment is wrong:
include/asm-arm/termios.h:#define TIOCM_OUT2    0x4000

Seems every arch defines this now in include/asm-*/termios.h.

> +#ifdef CONFIG_PARISC  /* PA-RISC uses OUT1 as hardware flow control bit 
> */
> +       arg |= TIOCM_OUT1;
>  #endif

I'v re-hacked this along the lines that Alan suggested.
But given the comment was wrong, thoughts?

I'm not able to test this.
Someone else will have to test and commit.

grant

Index: include/asm-i386/termios.h
===================================================================
RCS file: /var/cvs/linux/include/asm-i386/termios.h,v
retrieving revision 1.3
diff -u -p -r1.3 termios.h
--- include/asm-i386/termios.h	2001/07/05 21:38:41	1.3
+++ include/asm-i386/termios.h	2002/06/02 17:05:03
@@ -37,6 +37,8 @@ struct termio {
 #define TIOCM_OUT2	0x4000
 #define TIOCM_LOOP	0x8000
 
+#define TIOCM_MODEM_BITS	TIOCM_OUT2	/* IRDA support */
+
 /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
 
 /* line disciplines */
Index: include/asm-parisc/termios.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/termios.h,v
retrieving revision 1.6
diff -u -p -r1.6 termios.h
--- include/asm-parisc/termios.h	2001/07/11 17:20:32	1.6
+++ include/asm-parisc/termios.h	2002/06/02 17:05:03
@@ -37,6 +37,9 @@ struct termio {
 #define TIOCM_OUT2	0x4000
 #define TIOCM_LOOP	0x8000
 
+/* IRDA support - PA-RISC uses OUT1 as hardware flow control bit. */
+#define TIOCM_MODEM_BITS        (TIOCM_OUT2 | TIOCM_OUT1)
+
 /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
 
 /* line disciplines */
Index: arch/parisc/config.in
===================================================================
RCS file: /var/cvs/linux/arch/parisc/config.in,v
retrieving revision 1.39
diff -u -p -r1.39 config.in
--- arch/parisc/config.in	2001/11/08 21:17:52	1.39
+++ arch/parisc/config.in	2002/06/02 17:05:03
@@ -128,6 +128,8 @@ if [ "$CONFIG_SCSI" != "n" ]; then
 fi
 endmenu
 
+source net/irda/Config.in
+
 if [ "$CONFIG_NET" = "y" ]; then
    mainmenu_option next_comment
    comment 'Network device support'
Index: drivers/net/irda/irtty.c
===================================================================
RCS file: /var/cvs/linux/drivers/net/irda/irtty.c,v
retrieving revision 1.8
diff -u -p -r1.8 irtty.c
--- drivers/net/irda/irtty.c	2001/11/09 23:36:06	1.8
+++ drivers/net/irda/irtty.c	2002/06/02 17:05:03
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

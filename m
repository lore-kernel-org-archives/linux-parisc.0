Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA02249
	for <parisc-linux@puffin.external.hp.com>; Sun, 21 Nov 1999 18:10:46 -0700
Message-Id: <199911220112.UAA05614@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sun, 21 Nov 1999 20:12:25 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199911212307.SAA11686@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 21, 99 06:07:29 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > > I also need to slow down the console messages.
> > 
> > edit arch/parisc/kernel/pdc_cons.c and put a __delay(N); in pdc_putc.  N is
> > approximately the number of CPU cycles you want to wait.  I suggest placing
> > it directly after the "case 'n':" as that gives you a per-line delay instead
> > of a per-character one.
> 
> I tried this and it didn't work.  It looks like __delay() is broken.  The
> ".balignl" is clearly bogus.  I think the "addib" tests need to bew looked
> at more closely.

__delay() in delay.h is ok except for ".balignl".  The .balignl inserts
a bunch of "ldi 1a,%r0" instructions which do nothing.  I just didn't specify
enough cycles before.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

--- delay.h.orig	Mon Oct 11 14:52:33 1999
+++ delay.h	Sun Nov 21 19:29:28 1999
@@ -11,8 +11,7 @@
 
 extern __inline__ void __delay(unsigned long loops) {
 	asm volatile(
-	"	.balignl	64,0x34000034
-		addib,UV,n      -1,%0,.
+	"	addib,UV,n      -1,%0,.
 		addib,NUV,n     -1,%0,.+8
 		nop"
 		: "=r" (loops) : "0" (loops));

From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re:[parisc-linux] A smal chg proposal about: [PATCH] [PARISC] Allow
	nested interrupts
Date: Mon, 18 Sep 2006 17:57:50 +0200
Message-ID: <J5SPOE$8243830BDDFA5BBEFC3713115E8239B8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "James.Bottomley" <James.Bottomley@SteelEye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "soete.joel" <soete.joel@scarlet.be>
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

> Hello James,
> 
> Sorry to have read it so lately but I just figure out this:
> - we can read in:
> include/linux/bitops.h
> --- snip ---
> static inline unsigned fls_long(unsigned long l)
> {
>          if (sizeof(l) =3D=3D 4)
>                  return fls(l);
>          return fls64(l);
> }
> --- snip ---
> 
> - otoh in your patch you wrote:
> +static inline int eirr_to_irq(unsigned long eirr)
> +{
> +#ifdef CONFIG_64BIT
> +       int bit =3D fls64(eirr);
> +#else
> +       int bit =3D fls(eirr);
> +#endif
> +       return (BITS_PER_LONG - bit) + TIMER_IRQ;
> +}
> +
> 
> so may be could it be simply writen:
> 	int bit =3D fls_long(eirr);
> 
> Hth,
> 	Joel
> 
> PS: I still have somewhere an optimized version for this stuff I will t=
ry to
find it back ;-)

Sorry for delay but I needed some more time to update my system and test =
stuff
on some; so here is my proposal:
--- ./arch/parisc/kernel/irq.c.Orig	2006-09-18 13:41:05.000000000 +0200
+++ ./arch/parisc/kernel/irq.c	2006-09-18 13:41:38.000000000 +0200
@@ -331,11 +331,7 @@
 
 static inline int eirr_to_irq(unsigned long eirr)
 {
-#ifdef CONFIG_64BIT
-	int bit =3D fls64(eirr);
-#else
-	int bit =3D fls(eirr);
-#endif
+	int bit =3D fls_long(eirr);
 	return (BITS_PER_LONG - bit) + TIMER_IRQ;
 }
 
--- ./include/asm-parisc/bitops.h.Orig	2006-09-18 12:10:23.000000000 +020=
0
+++ ./include/asm-parisc/bitops.h	2006-09-18 12:38:06.000000000 +0200
@@ -173,34 +173,43 @@
  * fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
  */
 
-static __inline__ int fls(int x)
+#define __HAVE_ARCH_FLS_LONG
+#define fls(x)	fls_long((unsigned long)(x))
+
+static __inline__ int fls_long(unsigned long l)
 {
-	int ret;
-	if (!x)
-		return 0;
+	unsigned long ret;
 
 	__asm__(
-	"	ldi		1,%1\n"
-	"	extru,<>	%0,15,16,%%r0\n"
-	"	zdep,TR		%0,15,16,%0\n"		/* xxxx0000 */
-	"	addi		16,%1,%1\n"
-	"	extru,<>	%0,7,8,%%r0\n"
-	"	zdep,TR		%0,23,24,%0\n"		/* xx000000 */
-	"	addi		8,%1,%1\n"
-	"	extru,<>	%0,3,4,%%r0\n"
-	"	zdep,TR		%0,27,28,%0\n"		/* x0000000 */
-	"	addi		4,%1,%1\n"
-	"	extru,<>	%0,1,2,%%r0\n"
-	"	zdep,TR		%0,29,30,%0\n"		/* y0000000 (y&3 =3D 0) */
-	"	addi		2,%1,%1\n"
-	"	extru,=3D		%0,0,1,%%r0\n"
-	"	addi		1,%1,%1\n"		/* if y & 8, add 1 */
-		: "+r" (x), "=3Dr" (ret) );
-
-	return ret;
+#ifdef __LP64__
+		"ldi		64,%1		\n\t"
+		"extrd,u,*=3D	%0,31,32,%%r0	\n\t"
+		"extrd,u,*TR	%0,31,32,%0	\n\t"	/* move top 32-bits down */
+		"addi		-32,%1,%1	\n\t"
+#else
+		"ldi		32,%1		\n\t"
+#endif
+		"extru,=3D	%0,15,16,%%r0	\n\t"
+		"extru,TR	%0,15,16,%0	\n\t"	/* xxxx0000 -> 0000xxxx */
+		"addi		-16,%1,%1	\n\t"
+		"extru,=3D	%0,23,8,%%r0	\n\t"
+		"extru,TR	%0,23,8,%0	\n\t"	/* 0000xx00 -> 000000xx */
+		"addi		-8,%1,%1	\n\t"
+		"extru,=3D	%0,27,4,%%r0	\n\t"
+		"extru,TR	%0,27,4,%0	\n\t"	/* 000000x0 -> 0000000x */
+	 	"addi		-4,%1,%1	\n\t"
+		"extru,=3D	%0,29,2,%%r0	\n\t"
+		"extru,TR	%0,29,2,%0	\n\t"	/* 0000000y, 1100b -> 0011b */
+		"addi		-2,%1,%1	\n\t"
+		"extru,=3D	%0,30,1,%%r0	\n\t"
+		"extru,TR	%0,30,1,%0	\n\t"	/* 0000000z, 10b -> 01b */
+		"addi		-1,%1,%1	\n\t"
+		"extru,<>	%0,31,1,%%r0	\n\t"	/* check last bit */
+		"addi		-1,%1,%1	\n\t"
+		: "+r" (l), "=3Dr" (ret) );
+	return (int)ret;
 }
 
-#include <asm-generic/bitops/fls64.h>
 #include <asm-generic/bitops/hweight.h>
 #include <asm-generic/bitops/sched.h>
 
--- ./include/linux/bitops.h.Orig	2006-09-18 12:35:04.000000000 +0200
+++ ./include/linux/bitops.h	2006-09-18 13:56:14.000000000 +0200
@@ -53,11 +53,13 @@
 	return (word >> shift) | (word << (32 - shift));
 }
 
+#ifndef __HAVE_ARCH_FLS_LONG
 static inline unsigned fls_long(unsigned long l)
 {
 	if (sizeof(l) =3D=3D 4)
 		return fls(l);
 	return fls64(l);
 }
+#endif 
 
 #endif

=3D=3D=3D=3D <> =3D=3D=3D=3D
tested (build and boot fine) on d380 32bit smp, b2k 32 & 64 bit up kernel=

(have encountered unrelated pb to build n4k up kernel?)

Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devene=
z aujourd'hui Scarlet One grace a un client existant de Scarlet, vous rec=
evez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur ht=
tp://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

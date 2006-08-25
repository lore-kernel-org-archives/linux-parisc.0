From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Just A suggestion to highlight mb() and
	cpu_relax() in s files?
Date: Fri, 25 Aug 2006 14:39:08 +0200
Message-ID: <J4K0H8$704B2688EDEDE27EBD0E625D0652B863@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1156509548.2A.707118.42.27770.52.42.007.1964481327"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 matthew <matthew@wil.cx>
To: "kyle" <kyle@mcmartin.ca>
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

--_=__=_XaM3_.1156509548.2A.707118.42.27770.52.42.007.1964481327
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On Thu, Aug 24, 2006 at 09:47:21AM -0600, Matthew Wilcox wrote:
> > I like the idea.  How about using the function name instead, though?
> > 
> > +#define __mb(s)           __asm__ __volatile__(s "()":::"memory") /*=

barrier() */
> > +#define mb()	__mb("mb")
> > +#define rmb()          __mb("rmb")
> > +#define wmb()          __mb("wmb")
> > +#define smp_mb()       __mb("smp_mb")
> 
> I liek it.
> 
--- include/asm-parisc/system.h.Orig    2006-08-24 08:43:12.000000000 +02=
00
+++ include/asm-parisc/system.h 2006-08-25 12:05:51.000000000 +0200
@@ -141,12 +141,13 @@
 ** The __asm__ op below simple prevents gcc/ld from reordering
 ** instructions across the mb() "call".
 */
-#define mb()           __asm__ __volatile__("":::"memory")     /* barrie=
r() */
-#define rmb()          mb()
-#define wmb()          mb()
-#define smp_mb()       mb()
-#define smp_rmb()      mb()
-#define smp_wmb()      mb()
+#define __mb(s)                __asm__ __volatile__("# " s "()":::"memor=
y") 
  /* barrier() */
+#define mb()           __mb("mb")
+#define rmb()          __mb("rmb")
+#define wmb()          __mb("wmb")
+#define smp_mb()       __mb("smp_mb")
+#define smp_rmb()      __mb("smp_rmb")
+#define smp_wmb()      __mb("smp_wmb")
 #define smp_read_barrier_depends()     do { } while(0)
 #define read_barrier_depends()         do { } while(0)

--- include/asm-parisc/processor.h.Orig 2006-08-24 08:47:36.000000000 +02=
00
+++ include/asm-parisc/processor.h      2006-08-25 11:07:28.000000000 +02=
00
@@ -330,7 +330,7 @@
 #define KSTK_EIP(tsk)  ((tsk)->thread.regs.iaoq[0])
 #define KSTK_ESP(tsk)  ((tsk)->thread.regs.gr[30])

-#define cpu_relax()    barrier()
+#define cpu_relax()    __mb("cpu_relax")

 #endif /* __ASSEMBLY__ */

=3D=3D=3D=3D <> =3D=3D=3D=3D

(also attached in case of bad wraping ;-)

Cheers,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be
--_=__=_XaM3_.1156509548.2A.707118.42.27770.52.42.007.1964481327
Content-Type: text/plain;
	name="=?iso-8859-1?Q?MbComment.txt?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?MbComment.txt?="

--- include/asm-parisc/system.h.Orig	2006-08-24 08:43:12.000000000 +0200=0A=
+++ include/asm-parisc/system.h	2006-08-25 12:05:51.000000000 +0200=0A@@ =
-141,12 +141,13 @@=0A ** The __asm__ op below simple prevents gcc/ld from=
 reordering=0A ** instructions across the mb() "call".=0A */=0A-#define m=
b()		__asm__ __volatile__("":::"memory")	/* barrier() */=0A-#define rmb()=
		mb()=0A-#define wmb()		mb()=0A-#define smp_mb()	mb()=0A-#define smp_rmb=
()	mb()=0A-#define smp_wmb()	mb()=0A+#define __mb(s)		__asm__ __volatile_=
_("# " s "()":::"memory")	/* barrier() */=0A+#define mb()		__mb("mb")=0A+=
#define rmb()		__mb("rmb")=0A+#define wmb()		__mb("wmb")=0A+#define smp_m=
b()	__mb("smp_mb")=0A+#define smp_rmb()	__mb("smp_rmb")=0A+#define smp_wm=
b()	__mb("smp_wmb")=0A #define smp_read_barrier_depends()	do { } while(0)=
=0A #define read_barrier_depends()		do { } while(0)=0A =0A--- include/asm=
-parisc/processor.h.Orig	2006-08-24 08:47:36.000000000 +0200=0A+++ includ=
e/asm-parisc/processor.h	2006-08-25 11:07:28.000000000 +0200=0A@@ -330,7 =
+330,7 @@=0A #define KSTK_EIP(tsk)	((tsk)->thread.regs.iaoq[0])=0A #defin=
e KSTK_ESP(tsk)	((tsk)->thread.regs.gr[30])=0A =0A-#define cpu_relax()	ba=
rrier()=0A+#define cpu_relax()	__mb("cpu_relax")=0A =0A #endif /* __ASSEM=
BLY__ */=0A =0A
--_=__=_XaM3_.1156509548.2A.707118.42.27770.52.42.007.1964481327
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1156509548.2A.707118.42.27770.52.42.007.1964481327--

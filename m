From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] parisc trap.c unwind.c small question?
Date: Mon, 24 Jul 2006 16:18:15 +0200
Message-ID: <J2WVQF$103CC701D3667777526743F0D77A2136@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hi *,

While taking a break, istr it was better to write (ptr =3D=3D NULL) is pl=
ace
(!ptr)?--- arch/parisc/kernel/traps.c.Orig     2006-07-24 15:21:46.000000=
000 +0200
+++ arch/parisc/kernel/traps.c  2006-07-24 16:01:13.000000000 +0200
@@ -182,14 +182,14 @@
 {
        struct unwind_frame_info info;

-       if (!task) {
+       if (task =3D=3D NULL) {
                unsigned long sp;
                struct pt_regs *r;

 HERE:
                asm volatile ("copy %%r30, %0" : "=3Dr"(sp));
                r =3D kzalloc(sizeof(struct pt_regs), GFP_KERNEL);
-               if (!r)
+               if (r =3D=3D NULL)
                        return;
                r->iaoq[0] =3D (unsigned long)&&HERE;
                r->gr[2] =3D (unsigned long)__builtin_return_address(0);
@@ -238,7 +238,7 @@
         * to initialize the serial or STI console. In that case we shoul=
d
         * re-enable the pdc console, so that the user will be able to
         * identify the problem. */
-       if (!console_drivers)
+       if (console_drivers =3D=3D NULL)
                pdc_console_restart();

        printk(KERN_CRIT "%s (pid %d): %s (code %ld)\n",
@@ -423,7 +423,7 @@
        pdc_emergency_unlock();

        /* restart pdc console if necessary */
-       if (!console_drivers)
+       if (console_drivers =3D=3D NULL)
                pdc_console_restart();

        /* Not all paths will gutter the processor... */
--- arch/parisc/kernel/unwind.c.Orig    2006-07-24 15:49:07.000000000 +02=
00
+++ arch/parisc/kernel/unwind.c 2006-07-24 15:49:51.000000000 +0200
@@ -345,7 +345,7 @@
        struct pt_regs *r2;

        r2 =3D (struct pt_regs *)kmalloc(sizeof(struct pt_regs), GFP_KERN=
EL);
-       if (!r2)
+       if (r2 =3D=3D NULL)
                return;
        *r2 =3D *r;
        r2->gr[30] =3D r->ksp;
=3D=3D=3D=3D<>=3D=3D=3D=3D

Thanks,
    Joel

=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

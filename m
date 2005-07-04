From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Mon, 4 Jul 2005 16:51:31 +0200
Message-ID: <42BAE7C300003107@mail-5-bnl.tiscali.it>
References: <200507031847.j63IlFQZ016629@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507031847.j63IlFQZ016629@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

> 
> > > good news with gcc-4.0 (debian pakage) and '-mfixed-range=3Dfr6-fr2=
1,fr27-fr31'
> > > 
> > >     o 2.6.9-rc2-pa1 seems to works as fine as with original option
> > >     o 2.6.9-rc2-pa13 the same 
> > > 
> > > (just have to backport some small stuff to  reach to compile kernel=
s)
> > > 
> > > I apply my stress test (tar loops + kernel build loops) during a fu=
ll
> day
> > > for each one without any pb ;-)
> > > 
> > > I can now try a step forward: 2.6.10-pa + gcc-4.0, ...
> 
> I'll have to try a gcc-4.0 built kernel to see if it improves things
> on the c3k.
> 
cool ;-)

btw for the 2.6.10-pa11 I had to apply those small backports:
diff -NaurX dontdiff linux-2.6.10-pa10-20050112/arch/parisc/Makefile linu=
x-2.6.10-pa10-20050112-gcc40/arch/parisc/Makefile
--- linux-2.6.10-pa10-20050112/arch/parisc/Makefile     2005-01-04 07:37:=
20.000000000
+0100
+++ linux-2.6.10-pa10-20050112-gcc40/arch/parisc/Makefile       2005-07-0=
1
17:30:00.000000000 +0200
@@ -44,6 +44,7 @@
 # If that gets optimized, we might need to disable the use of fpregs in
the
 # kernel.
 #cflags-y      +=3D -mdisable-fpregs
+cflags-y       +=3D -mfixed-range=3Dfr6-fr21,fr27-fr31
 
 # Without this, "ld -r" results in .text sections that are too big
 # (> 0x40000) for branches to reach stubs.
diff -NaurX dontdiff linux-2.6.10-pa10-20050112/drivers/eisa/Makefile lin=
ux-2.6.10-pa10-20050112-gcc40/drivers/eisa/Makefile
--- linux-2.6.10-pa10-20050112/drivers/eisa/Makefile    2003-09-08 23:42:=
02.000000000
+0200
+++ linux-2.6.10-pa10-20050112-gcc40/drivers/eisa/Makefile      2005-07-0=
1
18:12:25.000000000 +0200
@@ -1,8 +1,5 @@
 # Makefile for the Linux device tree
 
-# Being anal sometimes saves a crash/reboot cycle... ;-)
-EXTRA_CFLAGS    :=3D -Werror
-
 obj-$(CONFIG_EISA)             +=3D eisa-bus.o
 obj-${CONFIG_EISA_PCI_EISA}     +=3D pci_eisa.o
 
diff -NaurX dontdiff linux-2.6.10-pa10-20050112/include/linux/fb.h linux-=
2.6.10-pa10-20050112-gcc40/include/linux/fb.h
--- linux-2.6.10-pa10-20050112/include/linux/fb.h       2004-11-30 07:45:=
36.000000000
+0100
+++ linux-2.6.10-pa10-20050112-gcc40/include/linux/fb.h 2005-07-01 18:38:=
07.000000000
+0200
@@ -857,7 +857,6 @@
 
 /* drivers/video/modedb.c */
 #define VESA_MODEDB_SIZE 34
-extern const struct fb_videomode vesa_modes[];
 extern void fb_var_to_videomode(struct fb_videomode *mode,
                                struct fb_var_screeninfo *var);
 extern void fb_videomode_to_var(struct fb_var_screeninfo *var,
@@ -902,6 +901,8 @@
        u32 flag;
 };
 
+extern const struct fb_videomode vesa_modes[];
+
 struct fb_modelist {
        struct list_head list;
        struct fb_videomode mode;
=3D=3D=3D=3D<>=3D=3D=3D=3D

And eventualy:
diff -NaurX dontdiff linux-2.6.10-pa10-20050112/Makefile linux-2.6.10-pa1=
0-20050112-gcc40/Makefile
--- linux-2.6.10-pa10-20050112/Makefile 2005-01-10 12:00:43.000000000 +01=
00
+++ linux-2.6.10-pa10-20050112-gcc40/Makefile   2005-07-01 17:29:16.00000=
0000
+0200
@@ -201,7 +201,7 @@
          else if [ -x /bin/bash ]; then echo /bin/bash; \
          else echo sh; fi ; fi)
 
-HOSTCC         =3D gcc
+HOSTCC         =3D gcc-4.0
 HOSTCXX        =3D g++
 HOSTCFLAGS     =3D -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
 HOSTCXXFLAGS   =3D -O2
@@ -318,7 +318,7 @@
 
 AS             =3D $(CROSS_COMPILE)as
 LD             =3D $(CROSS_COMPILE)ld
-CC             =3D $(CROSS_COMPILE)gcc
+CC             =3D $(CROSS_COMPILE)gcc-4.0
 CPP            =3D $(CC) -E
 AR             =3D $(CROSS_COMPILE)ar
 NM             =3D $(CROSS_COMPILE)nm
=3D=3D=3D=3D<>=3D=3D=3D=3D

Still have to find back what should still have to be backported (as kyle
did for 2.6.8) for b2k ;-)

> Just a note, a patch to fix the function pointer canonicalization
> issue that you and others noticed was installed Friday to the 4.0 branc=
h,
> and Saturday to the GCC head.
> 
Thanks for feedback (I will try it asap),

    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

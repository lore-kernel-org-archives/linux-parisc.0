From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] hppa clone() glibc proposal (1/3)
Date: Fri, 24 Mar 2006 10:52:57 +0100
Message-ID: <IWMM49$513E19C6ADC2A088CC019BF51611E013@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1143193977.2A.502342.42.20515.52.42.007.1138687764"
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>,
 carlos@systemhalted.org,
 "Randolph Chung" <randolph@tausq.org>
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

--_=__=_XaM3_.1143193977.2A.502342.42.20515.52.42.007.1138687764
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mike and pa*,

Attempting to fix the clone() bug mentioned by Mike, I reach to find a fi=
x
which I submit you for adivse.

This first step just import latest cvs.p-l.org ci by Carlos:
"
Final checkin to implement NPTL.

2005-08-02  Carlos O'Donell <carlos@systemhalted.org>

	* sysdeps/unix/sysv/linux/hppa/clone.S (__clone): Use 5 arguments.
	* sysdeps/unix/sysv/linux/hppa/sysdep.h: Don't include tls.h.
	(INTERNAL_SYSCALL_NCS): New.
	(INTERNAL_SYSCALL_DECL): Don't provide anything.
"

  1/ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S (see below diff)

  2/ associated sysdeps/unix/sysv/linux/hppa/sysdep.[ch]. I did't touch t=
hose 
     and as it modifie files present in debian glibc235-hppa-sysdeps.diff=
,
     I just propose a refresh.

--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.orig       2006-03-2=
4
09:57:47.000000000 +0100
+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S    2006-03-24
09:58:17.000000000 +0100
@@ -26,29 +26,49 @@
 #define _ERRNO_H       1
 #include <bits/errno.h>
 
-/* int clone(int (*fn)(void *arg), void *child_stack, int flags, void *a=
rg) */
+/* Non-thread code calls __clone with the following parameters:
+   int clone(int (*fn)(void *arg), void *child_stack, int flags, void *a=
rg)
+   
+   NPTL Code will call __clone with the following parameters:
+   int clone(int (*fn)(void *arg), void *child_stack, int flags, void *a=
rg,
+            int *parent_tidptr, struct user_desc *newtls, int *child_pid=
ptr)
+
+   The code should not mangle the extra input registers.
+   Syscall expects:                            Input to __clone:
+       r26 - clone flags.                      (arg2)
+       r25 - user stack pointer.               (arg1)
+       r24 - parent tid pointer.               (stack - 52)
+       r23 - struct user_desc newtls pointer.  (stack - 56)
+       r22 - child tid pointer.                (stack - 60)
+       r20 - clone syscall number              (constant)
+ */
 
         .text
 ENTRY(__clone)
-       /* FIXME: I have no idea how profiling works on hppa. */
-
-       /* Sanity check arguments.  */
-       comib,=3D  0,%arg0,.Lerror        /* no NULL function pointers */=

-       ldi     -EINVAL,%ret0
-       comib,=3D  0,%arg1,.Lerror        /* no NULL stack pointers */
-       nop
 
        /* Save the fn ptr and arg on the new stack.  */
-       stwm    %arg0,64(%arg1)
-       stw     %arg3,-60(%arg1)
+       stwm    %r26,64(%r25)
+       stw     %r23,-60(%r25)
+       /* Clone arguments are (int flags, void * child_stack) */
+       copy    %r24,%r26       /* flags are first */
+       /* User stack pointer is in the correct register already */
+
+       /* Load args from stack... */
+       ldw     -52(%sp), %r24  /* Load parent_tidptr */
+       ldw     -56(%sp), %r23  /* Load newtls */
+       ldw     -60(%sp), %r22  /* Load child_tidptr */
+
+       /* Create frame for function */
+       copy    %sp, %r21
+       stwm    %r3, 64(%sp)
+       stw     %r21, -4(%sp)
 
        /* Save the PIC register. */
 #ifdef PIC
-       stw     %r19,-32(%sr0, %sp)     /* parent */
+       copy    %r19, %r3               /* parent */
 #endif
 
        /* Do the system call */
-       copy    %arg2,%arg0
        ble     0x100(%sr2,%r0)
        ldi     __NR_clone,%r20
 
@@ -63,18 +83,23 @@
           since we return immediately. */
 
        bv      %r0(%rp)
-       nop
+       ldwm    -64(%sp), %r3
 
        /* Something bad happened -- no child created */
 .Lerror:
 
        /* Restore the PIC register on error */
 #ifdef PIC
-       ldw     -32(%sr0, %sp), %r19    /* parent */
+       copy    %r3, %r19               /* parent */ 
 #endif
-
+       /* Set errno */
+       copy    %ret0, %r3
        b       __syscall_error
        sub     %r0,%ret0,%arg0
+       copy    %r3, %ret0
+       /* Return after setting errno */
+       bv      %r0(%rp)
+       ldwm    -64(%sp), %r3
 
 thread_start:
 
@@ -92,7 +117,7 @@
        copy    %ret0,%arg0
 
        /* Die horribly.  */
-       iitlbp  %r0,(%r0)
+       iitlbp  %r0,(%sr0,%r0)
=3D=3D=3D=3D<>=3D=3D=3D=3D

(the last hunk was already ci by Kyle)

Joel

PS: here attached files: clone.S.diff-1_3, a new glibc235-hppa-sysdeps.di=
ff 
=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A
--_=__=_XaM3_.1143193977.2A.502342.42.20515.52.42.007.1138687764
Content-Type: application/octet-stream;
	name="=?iso-8859-1?Q?clone.S.diff-1=5F3?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="=?iso-8859-1?Q?clone.S.diff-1=5F3?="

LS0tIGdsaWJjLTIuMy42L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2hwcGEvY2xvbmUuUy5v
cmlnCTIwMDYtMDMtMjQgMDk6NTc6NDcuMDAwMDAwMDAwICswMTAwCisrKyBnbGliYy0yLjMu
Ni9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9ocHBhL2Nsb25lLlMJMjAwNi0wMy0yNCAwOTo1
ODoxNy4wMDAwMDAwMDAgKzAxMDAKQEAgLTI2LDI5ICsyNiw0OSBAQAogI2RlZmluZSBfRVJS
Tk9fSAkxCiAjaW5jbHVkZSA8Yml0cy9lcnJuby5oPgogCi0vKiBpbnQgY2xvbmUoaW50ICgq
Zm4pKHZvaWQgKmFyZyksIHZvaWQgKmNoaWxkX3N0YWNrLCBpbnQgZmxhZ3MsIHZvaWQgKmFy
ZykgKi8KKy8qIE5vbi10aHJlYWQgY29kZSBjYWxscyBfX2Nsb25lIHdpdGggdGhlIGZvbGxv
d2luZyBwYXJhbWV0ZXJzOgorICAgaW50IGNsb25lKGludCAoKmZuKSh2b2lkICphcmcpLCB2
b2lkICpjaGlsZF9zdGFjaywgaW50IGZsYWdzLCB2b2lkICphcmcpCisgICAKKyAgIE5QVEwg
Q29kZSB3aWxsIGNhbGwgX19jbG9uZSB3aXRoIHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVyczoK
KyAgIGludCBjbG9uZShpbnQgKCpmbikodm9pZCAqYXJnKSwgdm9pZCAqY2hpbGRfc3RhY2ss
IGludCBmbGFncywgdm9pZCAqYXJnLAorCSAgICAgaW50ICpwYXJlbnRfdGlkcHRyLCBzdHJ1
Y3QgdXNlcl9kZXNjICpuZXd0bHMsIGludCAqY2hpbGRfcGlkcHRyKQorCQorICAgVGhlIGNv
ZGUgc2hvdWxkIG5vdCBtYW5nbGUgdGhlIGV4dHJhIGlucHV0IHJlZ2lzdGVycy4KKyAgIFN5
c2NhbGwgZXhwZWN0czoJCQkJSW5wdXQgdG8gX19jbG9uZToKKwlyMjYgLSBjbG9uZSBmbGFn
cy4JCQkoYXJnMikKKwlyMjUgLSB1c2VyIHN0YWNrIHBvaW50ZXIuCQkoYXJnMSkKKwlyMjQg
LSBwYXJlbnQgdGlkIHBvaW50ZXIuCQkoc3RhY2sgLSA1MikKKwlyMjMgLSBzdHJ1Y3QgdXNl
cl9kZXNjIG5ld3RscyBwb2ludGVyLgkoc3RhY2sgLSA1NikKKwlyMjIgLSBjaGlsZCB0aWQg
cG9pbnRlci4JCShzdGFjayAtIDYwKQorCXIyMCAtIGNsb25lIHN5c2NhbGwgbnVtYmVyCQko
Y29uc3RhbnQpCisgKi8KIAogICAgICAgICAudGV4dAogRU5UUlkoX19jbG9uZSkKLQkvKiBG
SVhNRTogSSBoYXZlIG5vIGlkZWEgaG93IHByb2ZpbGluZyB3b3JrcyBvbiBocHBhLiAqLwot
Ci0JLyogU2FuaXR5IGNoZWNrIGFyZ3VtZW50cy4gICovCi0JY29taWIsPSAgMCwlYXJnMCwu
TGVycm9yICAgICAgICAvKiBubyBOVUxMIGZ1bmN0aW9uIHBvaW50ZXJzICovCi0JbGRpICAg
ICAtRUlOVkFMLCVyZXQwCi0JY29taWIsPSAgMCwlYXJnMSwuTGVycm9yICAgICAgICAvKiBu
byBOVUxMIHN0YWNrIHBvaW50ZXJzICovCi0Jbm9wCiAKIAkvKiBTYXZlIHRoZSBmbiBwdHIg
YW5kIGFyZyBvbiB0aGUgbmV3IHN0YWNrLiAgKi8KLQlzdHdtICAgICVhcmcwLDY0KCVhcmcx
KQotCXN0dwklYXJnMywtNjAoJWFyZzEpCisJc3R3bSAgICAlcjI2LDY0KCVyMjUpCisJc3R3
CSVyMjMsLTYwKCVyMjUpCisJLyogQ2xvbmUgYXJndW1lbnRzIGFyZSAoaW50IGZsYWdzLCB2
b2lkICogY2hpbGRfc3RhY2spICovCisJY29weQklcjI0LCVyMjYJLyogZmxhZ3MgYXJlIGZp
cnN0ICovCisJLyogVXNlciBzdGFjayBwb2ludGVyIGlzIGluIHRoZSBjb3JyZWN0IHJlZ2lz
dGVyIGFscmVhZHkgKi8KKworCS8qIExvYWQgYXJncyBmcm9tIHN0YWNrLi4uICovCisJbGR3
CS01Miglc3ApLCAlcjI0CS8qIExvYWQgcGFyZW50X3RpZHB0ciAqLworCWxkdwktNTYoJXNw
KSwgJXIyMyAJLyogTG9hZCBuZXd0bHMgKi8KKwlsZHcJLTYwKCVzcCksICVyMjIJLyogTG9h
ZCBjaGlsZF90aWRwdHIgKi8KKworCS8qIENyZWF0ZSBmcmFtZSBmb3IgZnVuY3Rpb24gKi8K
Kwljb3B5CSVzcCwgJXIyMQorCXN0d20JJXIzLCA2NCglc3ApCisJc3R3CSVyMjEsIC00KCVz
cCkKIAogCS8qIFNhdmUgdGhlIFBJQyByZWdpc3Rlci4gKi8KICNpZmRlZiBQSUMKLQlzdHcJ
JXIxOSwtMzIoJXNyMCwgJXNwKQkvKiBwYXJlbnQgKi8KKwljb3B5CSVyMTksICVyMwkJLyog
cGFyZW50ICovCiAjZW5kaWYKIAogCS8qIERvIHRoZSBzeXN0ZW0gY2FsbCAqLwotCWNvcHkJ
JWFyZzIsJWFyZzAKIAlibGUgICAgIDB4MTAwKCVzcjIsJXIwKQogCWxkaQlfX05SX2Nsb25l
LCVyMjAKIApAQCAtNjMsMTggKzgzLDIzIEBACiAJICAgc2luY2Ugd2UgcmV0dXJuIGltbWVk
aWF0ZWx5LiAqLwogCiAJYnYJJXIwKCVycCkKLQlub3AKKwlsZHdtCS02NCglc3ApLCAlcjMK
IAogCS8qIFNvbWV0aGluZyBiYWQgaGFwcGVuZWQgLS0gbm8gY2hpbGQgY3JlYXRlZCAqLwog
LkxlcnJvcjoKIAogCS8qIFJlc3RvcmUgdGhlIFBJQyByZWdpc3RlciBvbiBlcnJvciAqLwog
I2lmZGVmIFBJQwotCWxkdwktMzIoJXNyMCwgJXNwKSwgJXIxOQkvKiBwYXJlbnQgKi8KKwlj
b3B5CSVyMywgJXIxOQkJLyogcGFyZW50ICovIAogI2VuZGlmCi0KKwkvKiBTZXQgZXJybm8g
Ki8KKwljb3B5CSVyZXQwLCAlcjMKIAliCV9fc3lzY2FsbF9lcnJvcgogCXN1YiAgICAgJXIw
LCVyZXQwLCVhcmcwCisJY29weQklcjMsICVyZXQwCisJLyogUmV0dXJuIGFmdGVyIHNldHRp
bmcgZXJybm8gKi8KKwlidgklcjAoJXJwKQorCWxkd20JLTY0KCVzcCksICVyMwogCiB0aHJl
YWRfc3RhcnQ6CiAKQEAgLTkyLDcgKzExNyw3IEBACiAJY29weQklcmV0MCwlYXJnMAogCiAJ
LyogRGllIGhvcnJpYmx5LiAgKi8KLQlpaXRsYnAJJXIwLCglcjApCisJaWl0bGJwCSVyMCwo
JXNyMCwlcjApCiAKIFBTRVVET19FTkQoX19jbG9uZSkKIAo=

--_=__=_XaM3_.1143193977.2A.502342.42.20515.52.42.007.1138687764
Content-Type: text/plain;
	name="=?iso-8859-1?Q?glibc235-hppa-sysdeps.diff?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?glibc235-hppa-sysdeps.diff?="

#! /bin/sh -e=0A=0A# All lines beginning with `# DP:' are a description o=
f the patch.=0A# DP: Description: Make glibc-2.3.5 compile to enable hppa=
 sysdeps=0A#		   and linuxthreads correctly again.=0A# DP: Related bugs: =
=0A# DP: Dpatch author: Jeff Bailey <jbailey@ubuntu.com>=0A# DP: Patch au=
thor: Carlos O'Donell=0A# DP: Upstream status: Pending=0A# DP: Status Det=
ails: =0A# DP: Date: 2005-07-17=0A=0APATCHLEVEL=3D1=0A=0Aif [ $# -ne 2 ];=
 then=0A    echo >&2 "`basename $0`: script expects -patch|-unpatch as ar=
gument"=0A    exit 1=0Afi=0Acase "$1" in=0A    -patch) patch -d "$2" -f -=
-no-backup-if-mismatch -p$PATCHLEVEL < $0;;=0A    -unpatch) patch -d "$2"=
 -f --no-backup-if-mismatch -R -p$PATCHLEVEL < $0;;=0A    *)=0A	echo >&2 =
"`basename $0`: script expects -patch|-unpatch as argument"=0A	exit 1=0Ae=
sac=0Aexit 0=0A=0A# append the patch here and adjust the -p? flag in the =
patch calls.=0A--- libc-orig/sysdeps/generic/dl-sysdep.c	2004-12-14 15:30=
:41.000000000 -0500=0A+++ libc/sysdeps/generic/dl-sysdep.c	2004-12-14 15:=
30:29.000000000 -0500=0A@@ -89,7 +89,7 @@=0A #else=0A   uid_t uid =3D 0;=0A=
   gid_t gid =3D 0;=0A-  unsigned int seen =3D 0;=0A+  int seen =3D 0;=0A=
 # define set_seen_secure() (seen =3D -1)=0A # ifdef HAVE_AUX_XID=0A #  d=
efine set_seen(tag) (tag)	/* Evaluate for the side effects.  */=0A--- lib=
c-orig/sysdeps/hppa/atomicity.h	1969-12-31 19:00:00.000000000 -0500=0A+++=
 libc/sysdeps/hppa/atomicity.h	2003-12-08 21:25:00.000000000 -0500=0A@@ -=
0,0 +1,55 @@=0A+/* Low-level functions for atomic operations.  HP-PARISC =
version.=0A+   Copyright (C) 1997,2001 Free Software Foundation, Inc.=0A+=
   This file is part of the GNU C Library.=0A+=0A+   The GNU C Library is=
 free software; you can redistribute it and/or=0A+   modify it under the =
terms of the GNU Lesser General Public=0A+   License as published by the =
Free Software Foundation; either=0A+   version 2.1 of the License, or (at=
 your option) any later version.=0A+=0A+   The GNU C Library is distribut=
ed in the hope that it will be useful,=0A+   but WITHOUT ANY WARRANTY; wi=
thout even the implied warranty of=0A+   MERCHANTABILITY or FITNESS FOR A=
 PARTICULAR PURPOSE.  See the GNU=0A+   Lesser General Public License for=
 more details.=0A+=0A+   You should have received a copy of the GNU Lesse=
r General Public=0A+   License along with the GNU C Library; if not, writ=
e to the Free=0A+   Software Foundation, Inc., 59 Temple Place, Suite 330=
, Boston, MA=0A+   02111-1307 USA.  */=0A+=0A+#ifndef _ATOMICITY_H=0A+#de=
fine _ATOMICITY_H	1=0A+=0A+#include <inttypes.h>=0A+=0A+#warning stub ato=
micity functions are not atomic=0A+#warning CAO This will get implemented=
 soon=0A+=0A+static inline int=0A+__attribute__ ((unused))=0A+exchange_an=
d_add (volatile uint32_t *mem, int val)=0A+{=0A+  int result =3D *mem;=0A=
+  *mem +=3D val;=0A+  return result;=0A+}=0A+=0A+static inline void=0A+_=
_attribute__ ((unused))=0A+atomic_add (volatile uint32_t *mem, int val)=0A=
+{=0A+  *mem +=3D val;=0A+}=0A+=0A+static inline int=0A+__attribute__ ((u=
nused))=0A+compare_and_swap (volatile long int *p, long int oldval, long =
int newval)=0A+{=0A+  if (*p !=3D oldval)=0A+    return 0;=0A+=0A+  *p =3D=
 newval;=0A+  return 1;=0A+}=0A+=0A+#endif /* atomicity.h */=0A--- libc-o=
rig/sysdeps/hppa/bits/link.h	2005-01-28 14:39:49.000000000 -0500=0A+++ li=
bc/sysdeps/hppa/bits/link.h	2005-03-01 13:42:58.000000000 -0500=0A@@ -0,0=
 +1,63 @@=0A+/* Copyright (C) 2005 Free Software Foundation, Inc.=0A+   T=
his file is part of the GNU C Library.=0A+=0A+   The GNU C Library is fre=
e software; you can redistribute it and/or=0A+   modify it under the term=
s of the GNU Lesser General Public=0A+   License as published by the Free=
 Software Foundation; either=0A+   version 2.1 of the License, or (at you=
r option) any later version.=0A+=0A+   The GNU C Library is distributed i=
n the hope that it will be useful,=0A+   but WITHOUT ANY WARRANTY; withou=
t even the implied warranty of=0A+   MERCHANTABILITY or FITNESS FOR A PAR=
TICULAR PURPOSE.  See the GNU=0A+   Lesser General Public License for mor=
e details.=0A+=0A+   You should have received a copy of the GNU Lesser Ge=
neral Public=0A+   License along with the GNU C Library; if not, write to=
 the Free=0A+   Software Foundation, Inc., 59 Temple Place, Suite 330, Bo=
ston, MA=0A+   02111-1307 USA.  */=0A+=0A+#ifndef	_LINK_H=0A+# error "Nev=
er include <bits/link.h> directly; use <link.h> instead."=0A+#endif=0A+=0A=
+/* Registers for entry into PLT on hppa.  */=0A+typedef struct La_hppa_r=
egs=0A+{=0A+  uint32_t lr_r8;=0A+  uint32_t lr_r9;=0A+  uint32_t lr_r10;=0A=
+  uint32_t lr_r11;=0A+  uint32_t lr_gr [8];=0A+  double lr_fr [8];=0A+  =
uint32_t lr_unat;=0A+  uint32_t lr_sp;=0A+} La_hppa_regs;=0A+=0A+/* Retur=
n values for calls from PLT on hppa.  */=0A+typedef struct La_hppa_retval=
=0A+{=0A+  uint32_t lrv_r8;=0A+  uint32_t lrv_r9;=0A+  uint32_t lrv_r10;=0A=
+  uint32_t lrv_r11;=0A+  double lr_fr [8];=0A+} La_hppa_retval;=0A+=0A+=0A=
+__BEGIN_DECLS=0A+=0A+extern Elf32_Addr la_hppa_gnu_pltenter (Elf32_Sym *=
__sym, unsigned int __ndx,=0A+				       uintptr_t *__refcook,=0A+				   =
    uintptr_t *__defcook,=0A+				       La_hppa_regs *__regs,=0A+				    =
   unsigned int *__flags,=0A+				       const char *__symname,=0A+				   =
    long int *__framesizep);=0A+extern unsigned int la_hppa_gnu_pltexit (=
Elf32_Sym *__sym, unsigned int __ndx,=0A+					uintptr_t *__refcook,=0A+		=
			uintptr_t *__defcook,=0A+					const La_hppa_regs *__inregs,=0A+					La=
_hppa_retval *__outregs,=0A+					const char *symname);=0A+=0A+__END_DECLS=
=0A--- libc-orig/sysdeps/hppa/dl-trampoline.S	1969-12-31 19:00:00.0000000=
00 -0500=0A+++ libc/sysdeps/hppa/dl-trampoline.S	2005-04-05 15:51:55.0000=
00000 -0400=0A@@ -0,0 +1,194 @@=0A+/* PLT trampolines. hppa version.=0A+ =
  Copyright (C) 2005 Free Software Foundation, Inc.=0A+   This file is pa=
rt of the GNU C Library.=0A+=0A+   The GNU C Library is free software; yo=
u can redistribute it and/or=0A+   modify it under the terms of the GNU L=
esser General Public=0A+   License as published by the Free Software Foun=
dation; either=0A+   version 2.1 of the License, or (at your option) any =
later version.=0A+=0A+   The GNU C Library is distributed in the hope tha=
t it will be useful,=0A+   but WITHOUT ANY WARRANTY; without even the imp=
lied warranty of=0A+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.  See the GNU=0A+   Lesser General Public License for more details.=0A+=
=0A+   You should have received a copy of the GNU Lesser General Public=0A=
+   License along with the GNU C Library; if not, write to the Free=0A+  =
 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=0A+   =
02111-1307 USA.  */=0A+=0A+#include <sysdep.h>=0A+=0A+/* This code gets c=
alled via the .plt stub, and is used in=0A+   dl-runtime.c to call the `_=
dl_fixup' function and then redirect =0A+   to the    address it returns.=
 `_dl_fixup' takes two=0A+   arguments, however `_dl_profile_fixup' takes=
 a number of =0A+   parameters for use with library auditing (LA).=0A+   =
=0A+   WARNING: This template is also used by gcc's __cffc, and expects=0A=
+   that the "bl" for _dl_runtime_resolve exist at a particular offset.=0A=
+   Do not change this template without changing gcc, while the prefix=0A=
+   "bl" should fix everything so gcc finds the right spot, it will=0A+  =
 slow down __cffc when it attempts to call fixup to resolve function=0A+ =
  descriptor references. Please refer to gcc/gcc/config/pa/fptr.c=0A+   =0A=
+   Enter with r19 =3D reloc offset, r20 =3D got-8, r21 =3D fixup ltp.  *=
/=0A+=0A+	/* FAKE bl to provide gcc's __cffc with fixup loc. */=0A+	.text=
=0A+	bl	_dl_fixup, %r2=0A+        .text=0A+        .align 4=0A+        .g=
lobal _dl_runtime_resolve=0A+        .type _dl_runtime_resolve,@function=0A=
+_dl_runtime_resolve:=0A+        .PROC=0A+        .CALLINFO FRAME=3D128,C=
ALLS,SAVE_RP,ENTRY_GR=3D3=0A+        .ENTRY=0A+        /* SAVE_RP says we=
 do */=0A+        stw %rp, -20(%sp)=0A+=0A+	/* Save static link register =
*/=0A+	stw	%r29,-16(%sp)=0A+ 	/* Save argument registers in the call stac=
k frame. */=0A+	stw	%r26,-36(%sp)=0A+	stw	%r25,-40(%sp)=0A+	stw	%r24,-44(=
%sp)=0A+	stw	%r23,-48(%sp)=0A+=0A+	/* Build a call frame, and save struct=
ure pointer. */=0A+	copy	%sp, %r26	/* Copy previous sp */=0A+	/* Save fun=
ction result address (on entry) */=0A+	stwm	%r28,128(%sp)=0A+=0A+	/* Save=
 floating point argument registers */=0A+	ldo	-56(%sp),%r26	=0A+	fstd,ma	=
%fr4,-8(%r26)=0A+	fstd,ma	%fr5,-8(%r26)=0A+	fstd,ma	%fr6,-8(%r26)=0A+	fst=
d	%fr7,0(%r26)=0A+=0A+	/* Fillin some frame info to follow ABI */=0A+	stw=
	%r21,-32(%sp)	/* PIC register value */=0A+	stw	%r26,-4(%sp)	/* Previous =
sp */=0A+=0A+ 	/* Set up args to fixup func, needs only two arguments  */=
=0A+	ldw	8+4(%r20),%r26		/* (1) got[1] =3D=3D struct link_map */=0A+	copy=
	%r19,%r25		/* (2) reloc offset  */=0A+=0A+ 	/* Call the real address res=
olver. */=0A+	bl	_dl_fixup,%rp=0A+	copy	%r21,%r19		/* set fixup func ltp =
*/=0A+=0A+	/* Load up the returned func descriptor */=0A+	copy	%ret0, %r2=
2=0A+	copy	%ret1, %r19=0A+=0A+	/* Reload arguments fp args */=0A+	ldo	-80=
(%sp),%r26=0A+	fldd,ma	8(%r26),%fr7=0A+	fldd,ma	8(%r26),%fr6=0A+	fldd,ma	=
8(%r26),%fr5=0A+	fldd	0(%r26),%fr4=0A+=0A+	/* Adjust sp, and restore func=
tion result address*/=0A+	ldwm	-128(%sp),%r28=0A+=0A+	/* Reload static li=
nk register */=0A+	ldw	-16(%sp),%r29=0A+	/* Reload general args */=0A+	ld=
w	-36(%sp),%r26=0A+	ldw	-40(%sp),%r25=0A+	ldw	-44(%sp),%r24=0A+	ldw	-48(%=
sp),%r23=0A+=0A+	/* Jump to new function, but return to previous function=
 */=0A+	bv	%r0(%r22)=0A+	ldw	-20(%sp),%rp=0A+        .EXIT=0A+        .PR=
OCEND=0A+	.size   _dl_runtime_resolve, . - _dl_runtime_resolve=0A+=0A+=0A=
+	/* FIXME:=0A+		Need to largely rewrite the bottom half of=0A+		this cod=
e in order to save and restore the=0A+		LA struct from the stack along wi=
th=0A+		interpreted parameters.=0A+	*/=0A+        .text=0A+        .align=
 4=0A+        .global _dl_runtime_profile=0A+        .type _dl_runtime_pr=
ofile,@function=0A+_dl_runtime_profile:=0A+        .PROC=0A+        .CALL=
INFO FRAME=3D128,CALLS,SAVE_RP,ENTRY_GR=3D3=0A+        .ENTRY=0A+=0A+    =
    /* SAVE_RP says we do */=0A+        stw %rp, -20(%sp)=0A+=0A+	/* Save=
 static link register */=0A+	stw	%r29,-16(%sp)=0A+ 	/* Save argument regi=
sters in the call stack frame. */=0A+	stw	%r26,-36(%sp)=0A+	stw	%r25,-40(=
%sp)=0A+	stw	%r24,-44(%sp)=0A+	stw	%r23,-48(%sp)=0A+=0A+	/* Build a call =
frame, and save structure pointer. */=0A+	copy	%sp, %r26	/* Copy previous=
 sp */=0A+	/* Save function result address (on entry) */=0A+	stwm	%r28,12=
8(%sp)=0A+=0A+	/* Save floating point argument registers */=0A+	ldo	-56(%=
sp),%r26	=0A+	fstd,ma	%fr4,-8(%r26)=0A+	fstd,ma	%fr5,-8(%r26)=0A+	fstd,ma=
	%fr6,-8(%r26)=0A+	fstd	%fr7,0(%r26)=0A+=0A+	/* Fillin some frame info to=
 follow ABI */=0A+	stw	%r21,-32(%sp)	/* PIC register value */=0A+	stw	%r2=
6,-4(%sp)	/* Previous sp */=0A+=0A+ 	/* Set up args to fixup func, needs =
three arguments  */=0A+	ldw	8+4(%r20),%r26		/* (1) got[1] =3D=3D struct l=
ink_map */=0A+	copy	%r19,%r25		/* (2) reloc offset  */=0A+	copy    %rp,%r=
24		/* (3) profile_fixup needs rp */=0A+=0A+ 	/* Call the real address re=
solver. */=0A+	bl	_dl_profile_fixup,%rp=0A+	copy	%r21,%r19		/* set fixup =
func ltp */=0A+=0A+	/* Load up the returned func descriptor */=0A+	copy	%=
ret0, %r22=0A+	copy	%ret1, %r19=0A+=0A+	/* Reload arguments fp args */=0A=
+	ldo	-80(%sp),%r26=0A+	fldd,ma	8(%r26),%fr7=0A+	fldd,ma	8(%r26),%fr6=0A+=
	fldd,ma	8(%r26),%fr5=0A+	fldd	0(%r26),%fr4=0A+=0A+	/* Adjust sp, and res=
tore function result address*/=0A+	ldwm	-128(%sp),%r28=0A+=0A+	/* Reload =
static link register */=0A+	ldw	-16(%sp),%r29=0A+	/* Reload general args =
*/=0A+	ldw	-36(%sp),%r26=0A+	ldw	-40(%sp),%r25=0A+	ldw	-44(%sp),%r24=0A+	=
ldw	-48(%sp),%r23=0A+=0A+	/* Jump to new function, but return to previous=
 function */=0A+	bv	%r0(%r22)=0A+	ldw	-20(%sp),%rp=0A+        .EXIT=0A+  =
      .PROCEND=0A+	.size   _dl_runtime_profile, . - _dl_runtime_profile=0A=
+=0A+=0A+=0A--- libc-orig/sysdeps/hppa/fpu/libm-test-ulps	2003-03-22 19:5=
2:10.000000000 -0500=0A+++ libc/sysdeps/hppa/fpu/libm-test-ulps	2004-09-2=
9 23:50:16.000000000 -0400=0A@@ -1,6 +1,9 @@=0A # Begin of automatic gene=
ration=0A =0A # atan2=0A+Test "atan2 (-0.00756827042671106339, -.00179273=
5857538728036) =3D=3D -1.80338464113663849327153994380":=0A+float: 6=0A+i=
float: 6=0A Test "atan2 (-0.75, -1.0) =3D=3D -2.4980915447965088516598341=
5456218025":=0A float: 3=0A ifloat: 3=0A@@ -258,9 +261,6 @@=0A ifloat: 1=0A=
 =0A # ctan=0A-Test "Real part of: ctan (-2 - 3 i) =3D=3D 0.3764025641504=
24829275122113032269084e-2 - 1.00323862735360980144635859782192726 i":=0A=
-double: 1=0A-idouble: 1=0A Test "Imaginary part of: ctan (0.75 + 1.25 i)=
 =3D=3D 0.160807785916206426725166058173438663 + 0.9753632850312356461935=
81759755216379 i":=0A double: 1=0A idouble: 1=0A@@ -479,6 +479,11 @@=0A f=
loat: 1=0A ifloat: 1=0A =0A+# lround=0A+Test "lround (1071930.0008) =3D=3D=
 1071930":=0A+double: -214511494=0A+idouble: -214511494=0A+=0A # sincos=0A=
 Test "sincos (M_PI_6l*2.0, &sin_res, &cos_res) puts 0.5 in cos_res":=0A =
double: 1=0A@@ -640,8 +645,8 @@=0A =0A # Maximal error of functions:=0A F=
unction: "atan2":=0A-float: 3=0A-ifloat: 3=0A+float: 6=0A+ifloat: 6=0A =0A=
 Function: "atanh":=0A float: 1=0A@@ -777,10 +782,6 @@=0A float: 1=0A ifl=
oat: 1=0A =0A-Function: Real part of "ctan":=0A-double: 1=0A-idouble: 1=0A=
-=0A Function: Imaginary part of "ctan":=0A double: 1=0A idouble: 1=0A---=
 libc-orig/sysdeps/hppa/sysdep.h	2003-10-15 01:31:42.000000000 -0400=0A++=
+ libc/sysdeps/hppa/sysdep.h	2004-11-01 01:51:58.000000000 -0500=0A@@ -22=
,9 +22,8 @@=0A #include <sys/syscall.h>=0A #include "config.h"=0A =0A-#if=
ndef ASM_LINE_SEP=0A-#define ASM_LINE_SEP ;=0A-#endif=0A+#undef ASM_LINE_=
SEP=0A+#define ASM_LINE_SEP ! =0A =0A #ifdef	__ASSEMBLER__=0A =0A@@ -51,1=
3 +50,9 @@=0A #define END(name)							      \=0A   .PROCEND=0A =0A-=0A-/*=
 If compiled for profiling, call `mcount' at the start of each function. =
 */=0A+/* GCC does everything for us. */=0A #ifdef	PROF=0A-/* The mcount =
code relies on a normal frame pointer being on the stack=0A-   to locate =
our caller, so push one just for its benefit.  */=0A-#define CALL_MCOUNT =
\=0A-  XXX	ASM_LINE_SEP=0A+#define CALL_MCOUNT =0A #else=0A #define CALL_=
MCOUNT		/* Do nothing.  */=0A #endif=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/sysdep.h.O=
rig	2006-03-15 16:07:33.000000000 +0100=0A+++ glibc-2.3.6/sysdeps/unix/sy=
sv/linux/hppa/sysdep.h	2006-03-15 16:08:17.000000000 +0100=0A@@ -22,28 +2=
2,34 @@=0A #include <asm/unistd.h>=0A #include <sysdeps/generic/sysdep.h>=
=0A #include <sys/syscall.h>=0A-#include "config.h"=0A =0A-#ifndef ASM_LI=
NE_SEP=0A-# define ASM_LINE_SEP ;=0A-#endif=0A+#undef ASM_LINE_SEP=0A+#de=
fine ASM_LINE_SEP ! =0A =0A #undef SYS_ify=0A #define SYS_ify(syscall_nam=
e)	(__NR_##syscall_name)=0A =0A+/* WARNING: TREG must be a callee saves r=
egister so =0A+   that it doesn't have to be restored after a call =0A+  =
 to another function */=0A #ifdef PIC=0A-/* WARNING: CANNOT BE USED IN A =
NOP! */=0A-# define STW_PIC stw %r19, -32(%sr0, %sp) ASM_LINE_SEP=0A-# de=
fine LDW_PIC ldw -32(%sr0, %sp), %r19 ASM_LINE_SEP=0A-# define STW_ASM_PI=
C	"       copy %%r19, %%r4\n"=0A-# define LDW_ASM_PIC	"       copy %%r4, =
%%r19\n"=0A-# define USING_GR4	"%r4",=0A+# define TREG %r3=0A+# define SA=
VE_PIC(SREG) copy		%r19, SREG	ASM_LINE_SEP=0A+# define LOAD_PIC(LREG) cop=
y		LREG, %r19	ASM_LINE_SEP=0A+/* Inline assembly defines */=0A+# define T=
REG_ASM "%r4" /* Cant clobber r3, it holds framemarker */=0A+# define SAV=
E_ASM_PIC	"       copy		%%r19, %" TREG_ASM "\n"=0A+# define LOAD_ASM_PIC	=
"       copy		%" TREG_ASM ", %%r19\n"=0A+# define USING_TREG	TREG_ASM,=0A=
 #else=0A-# define STW_PIC ASM_LINE_SEP=0A-# define LDW_PIC ASM_LINE_SEP=0A=
-# define STW_ASM_PIC	" \n"=0A-# define LDW_ASM_PIC	" \n"=0A-# define USI=
NG_GR4=0A+# define TREG %r3=0A+# define SAVE_PIC(SREG) nop ASM_LINE_SEP=0A=
+# define LOAD_PIC(LREG) nop ASM_LINE_SEP=0A+/* Inline assembly defines *=
/=0A+# define TREG_ASM =0A+# define SAVE_ASM_PIC	"nop \n"=0A+# define LOA=
D_ASM_PIC	"nop \n"=0A+# define USING_TREG=0A #endif=0A =0A #ifdef __ASSEM=
BLER__=0A@@ -76,31 +82,73 @@=0A =0A /* We don't want the label for the er=
ror handle to be global when we define=0A    it here.  */=0A-#ifdef PIC=0A=
+/*#ifdef PIC=0A # define SYSCALL_ERROR_LABEL 0f=0A #else=0A # define SYS=
CALL_ERROR_LABEL syscall_error=0A-#endif=0A+#endif*/=0A+=0A+/* Argument m=
anipulation from the stack for preparing to=0A+   make a syscall */=0A+=0A=
+#define DOARGS_0 /* nothing */=0A+#define DOARGS_1 /* nothing */=0A+#def=
ine DOARGS_2 /* nothing */=0A+#define DOARGS_3 /* nothing */=0A+#define D=
OARGS_4 /* nothing */=0A+#define DOARGS_5 ldw		-52(%sp), %r22		ASM_LINE_S=
EP=0A+#define DOARGS_6 DOARGS_5 ldw		-56(%sp), %r21	ASM_LINE_SEP=0A+=0A+#=
define UNDOARGS_0 /* nothing */=0A+#define UNDOARGS_1 /* nothing */=0A+#d=
efine UNDOARGS_2 /* nothing */=0A+#define UNDOARGS_3 /* nothing */=0A+#de=
fine UNDOARGS_4 /* nothing */=0A+#define UNDOARGS_5 /* nothing */=0A+#def=
ine UNDOARGS_6 /* nothing */=0A =0A /* Define an entry point visible from=
 C.=0A =0A    There is currently a bug in gdb which prevents us from spec=
ifying=0A    incomplete stabs information.  Fake some entries here which =
specify=0A    the current source file.  */=0A-#define	ENTRY(name)						\=0A=
-	.text					ASM_LINE_SEP	\=0A-	.export C_SYMBOL_NAME(name)		ASM_LINE_SEP	=
\=0A-	.type	C_SYMBOL_NAME(name),@function	ASM_LINE_SEP	\=0A-	C_LABEL(name=
)				ASM_LINE_SEP	\=0A-	CALL_MCOUNT				ASM_LINE_SEP=0A+#define	ENTRY(name=
)							\=0A+	.text						ASM_LINE_SEP	\=0A+	.align ALIGNARG(4)				ASM_LIN=
E_SEP	\=0A+	.export C_SYMBOL_NAME(name)			ASM_LINE_SEP	\=0A+	.type	C_SYMB=
OL_NAME(name),@function		ASM_LINE_SEP	\=0A+	C_LABEL(name)					ASM_LINE_SE=
P	\=0A+	.PROC						ASM_LINE_SEP	\=0A+	.CALLINFO FRAME=3D64,CALLS,SAVE_RP,=
ENTRY_GR=3D3	ASM_LINE_SEP	\=0A+	.ENTRY						ASM_LINE_SEP	\=0A+	/* SAVE_RP=
 says we do */			ASM_LINE_SEP	\=0A+	stw		%rp, -20(%sr0, %sp)		ASM_LINE_SE=
P	\=0A+	/*FIXME: Call mcount? (carefull with stack!) */=0A+=0A+/* Some sy=
scall wrappers do not call other functions, and=0A+   hence are classifie=
d as leaf, so add NO_CALLS for gdb */=0A+#define	ENTRY_LEAF(name)						\=0A=
+	.text						ASM_LINE_SEP	\=0A+	.align	ALIGNARG(4)				ASM_LINE_SEP	\=0A+	=
.export C_SYMBOL_NAME(name)			ASM_LINE_SEP	\=0A+	.type	C_SYMBOL_NAME(name=
),@function		ASM_LINE_SEP	\=0A+	C_LABEL(name)					ASM_LINE_SEP	\=0A+	.PRO=
C						ASM_LINE_SEP	\=0A+	.CALLINFO FRAME=3D64,NO_CALLS,SAVE_RP,ENTRY_GR=3D=
3	ASM_LINE_SEP	\=0A+	.ENTRY						ASM_LINE_SEP	\=0A+	/* SAVE_RP says we do=
 */			ASM_LINE_SEP	\=0A+	stw		%rp, -20(%sr0, %sp)		ASM_LINE_SEP	\=0A+	/*F=
IXME: Call mcount? (carefull with stack!) */=0A =0A #undef	END=0A #define=
 END(name)							\=0A-1:							ASM_LINE_SEP	\=0A-.size	C_SYMBOL_NAME(name=
),1b-C_SYMBOL_NAME(name)	ASM_LINE_SEP=0A-=0A-/* If compiled for profiling=
, call `mcount' at the start of each function.  */=0A-/* No, don't bother=
.  gcc will put the call in for us.  */=0A+ 	.EXIT						ASM_LINE_SEP	\=0A=
+	.PROCEND					ASM_LINE_SEP	\=0A+.size	C_SYMBOL_NAME(name), .-C_SYMBOL_NA=
ME(name)	ASM_LINE_SEP=0A+=0A+/* If compiled for profiling, call `mcount' =
at the start =0A+   of each function. No, don't bother.  gcc will put the=
 =0A+   call in for us.  */=0A #define CALL_MCOUNT		/* Do nothing.  */=0A=
 =0A /* syscall wrappers consist of=0A@@ -117,59 +165,66 @@=0A 	nop=0A */=
=0A =0A-#define	PSEUDO(name, syscall_name, args)			\=0A-  ENTRY (name)			=
				\=0A-  DO_CALL(syscall_name, args)			ASM_LINE_SEP	\=0A-  nop						ASM=
_LINE_SEP=0A+#define	PSEUDO(name, syscall_name, args)				\=0A+	ENTRY (nam=
e)					ASM_LINE_SEP	\=0A+	/* If necc. load args from stack */		ASM_LINE_S=
EP	\=0A+	DOARGS_##args					ASM_LINE_SEP	\=0A+	DO_CALL (syscall_name, args=
)			ASM_LINE_SEP	\=0A+	UNDOARGS_##args					ASM_LINE_SEP	\=0A+	nop						AS=
M_LINE_SEP=0A =0A #define ret \=0A 	/* Return value set by ERRNO code */	=
ASM_LINE_SEP	\=0A-	bv 0(2)					ASM_LINE_SEP	\=0A-	nop					ASM_LINE_SEP=0A=
+	bv,n		0(2)				ASM_LINE_SEP=0A =0A #undef	PSEUDO_END=0A-#define	PSEUDO_E=
ND(name)					\=0A-  END (name)=0A+#define	PSEUDO_END(name)						\=0A+	END=
 (name)=0A =0A /* We don't set the errno on the return from the syscall *=
/=0A-#define	PSEUDO_NOERRNO(name, syscall_name, args)		\=0A-  ENTRY (name=
)							\=0A-  DO_CALL_NOERRNO(syscall_name, args)		ASM_LINE_SEP	\=0A-  n=
op						ASM_LINE_SEP=0A+#define	PSEUDO_NOERRNO(name, syscall_name, args)	=
		\=0A+	ENTRY_LEAF (name)				ASM_LINE_SEP	\=0A+	DOARGS_##args					ASM_LIN=
E_SEP	\=0A+	DO_CALL_NOERRNO (syscall_name, args)		ASM_LINE_SEP	\=0A+	UNDO=
ARGS_##args					ASM_LINE_SEP	\=0A+	nop						ASM_LINE_SEP=0A =0A-#define r=
et_NOERRNO ret=0A+#define ret_NOERRNO	ret=0A =0A #undef	PSEUDO_END_NOERRN=
O=0A-#define	PSEUDO_END_NOERRNO(name)				\=0A-  END (name)=0A+#define	PSE=
UDO_END_NOERRNO(name)					\=0A+	END (name)=0A =0A /* This has to return t=
he error value */=0A #undef  PSEUDO_ERRVAL=0A-#define PSEUDO_ERRVAL(name,=
 syscall_name, args)			\=0A-	ENTRY(name)						\=0A-	DO_CALL_ERRVAL(syscal=
l_name, args)	ASM_LINE_SEP	\=0A-	nop					ASM_LINE_SEP=0A+#define PSEUDO_E=
RRVAL(name, syscall_name, args)				\=0A+	ENTRY_LEAF (name)				ASM_LINE_SE=
P	\=0A+	DOARGS_##args					ASM_LINE_SEP	\=0A+	DO_CALL_ERRVAL (syscall_name=
, args)		ASM_LINE_SEP	\=0A+	UNDOARGS_##args					ASM_LINE_SEP	\=0A+	nop			=
			ASM_LINE_SEP=0A =0A #define ret_ERRVAL ret=0A =0A #undef	PSEUDO_END_ER=
RVAL=0A-#define PSEUDO_END_ERRVAL(name)					\=0A-	END(name)=0A+#define PS=
EUDO_END_ERRVAL(name)						\=0A+	END (name)=0A =0A #undef JUMPTARGET=0A #=
define JUMPTARGET(name)	name=0A #define SYSCALL_PIC_SETUP	/* Nothing.  */=
=0A =0A =0A-/* All the syscall assembly macros rely on finding the appror=
iate=0A+/* FIXME: This comment is not true.=0A+ * All the syscall assembl=
y macros rely on finding the approriate=0A    SYSCALL_ERROR_LABEL or rath=
er HANDLER. */=0A =0A /* int * __errno_location(void) so you have to stor=
e your value=0A    into the return address! */=0A-#define DEFAULT_SYSCALL=
_ERROR_HANDLER 			\=0A-	.import __errno_location,code	ASM_LINE_SEP	\=0A-	=
/* branch to errno handler */	ASM_LINE_SEP	\=0A-	bl __errno_location,%rp	=
	ASM_LINE_SEP=0A+#define DEFAULT_SYSCALL_ERROR_HANDLER 					\=0A+	.import=
 __errno_location,code			ASM_LINE_SEP	\=0A+	/* branch to errno handler */=
			ASM_LINE_SEP	\=0A+	bl		__errno_location, %rp		ASM_LINE_SEP=0A =0A /* H=
ere are the myriad of configuration options that the above can=0A    work=
 for... what we've done is provide the framework for future=0A@@ -193,7 +=
248,6 @@=0A # endif=0A #endif=0A =0A-=0A /* Linux takes system call argum=
ents in registers:=0A 	syscall number	gr20=0A 	arg 1		gr26=0A@@ -209,8 +2=
63,8 @@=0A 	arg 2		gr25=0A 	arg 3		gr24=0A 	arg 4		gr23=0A-	arg 5		-52(gr=
30)=0A-	arg 6		-56(gr30)=0A+	arg 5		-52(sp)=0A+	arg 6		-56(sp)=0A =0A    =
gr22 and gr21 are caller-saves, so we can just load the arguments=0A    t=
here and generally be happy. */=0A@@ -219,81 +273,63 @@=0A  * is intended=
 to mimic the if (__sys_res...)=0A  * code inside INLINE_SYSCALL=0A  */=0A=
+#define NO_ERROR -0x1000=0A =0A #undef	DO_CALL=0A-#define DO_CALL(syscal=
l_name, args)				\=0A-	DOARGS_##args				ASM_LINE_SEP	\=0A-	STW_PIC					AS=
M_LINE_SEP	\=0A-	/* Do syscall, delay loads # */		ASM_LINE_SEP	\=0A-	ble =
 0x100(%sr2,%r0)			ASM_LINE_SEP	\=0A-	ldi SYS_ify (syscall_name), %r20	AS=
M_LINE_SEP	\=0A-	ldi -0x1000,%r1				ASM_LINE_SEP	\=0A-	cmpb,>>=3D,n %r1,%=
ret0,0f			ASM_LINE_SEP	\=0A-	/* save rp or we get lost */		ASM_LINE_SEP	\=
=0A-	stw %rp, -20(%sr0,%sp)			ASM_LINE_SEP	\=0A-	/* Restore r19 from fram=
e */		ASM_LINE_SEP	\=0A-	LDW_PIC					ASM_LINE_SEP	\=0A-	stw %ret0, -24(%s=
r0,%sp)		ASM_LINE_SEP	\=0A-	SYSCALL_ERROR_HANDLER			ASM_LINE_SEP	\=0A-	/*=
 create frame */			ASM_LINE_SEP	\=0A-	ldo 64(%sp), %sp			ASM_LINE_SEP	\=0A=
-	ldo -64(%sp), %sp			ASM_LINE_SEP	\=0A-	/* OPTIMIZE: Don't reload r19 */=
	ASM_LINE_SEP	\=0A-	/* do a -1*syscall_ret0 */		ASM_LINE_SEP	\=0A-	ldw -2=
4(%sr0,%sp), %r26			ASM_LINE_SEP	\=0A-	sub %r0, %r26, %r26			ASM_LINE_SEP=
	\=0A-	/* Store into errno location */		ASM_LINE_SEP	\=0A-	stw %r26, 0(%s=
r0,%ret0)			ASM_LINE_SEP	\=0A-	/* return -1 as error */		ASM_LINE_SEP	\=0A=
-	ldo -1(%r0), %ret0			ASM_LINE_SEP	\=0A-	ldw -20(%sr0,%sp), %rp			ASM_LI=
NE_SEP	\=0A-0:						ASM_LINE_SEP	\=0A-	UNDOARGS_##args				ASM_LINE_SEP=0A=
+#define DO_CALL(syscall_name, args)					\=0A+  	copy		TREG, %r1			ASM_LI=
NE_SEP	\=0A+	copy		%sp, TREG			ASM_LINE_SEP	\=0A+	/* Create a frame */			=
	ASM_LINE_SEP	\=0A+	stwm		%r1, 64(%sp)			ASM_LINE_SEP	\=0A+	stw		%rp, -20=
(%sp)			ASM_LINE_SEP	\=0A+	stw		TREG, -4(%sp)			ASM_LINE_SEP	\=0A+	/* Sav=
e r19 */					ASM_LINE_SEP	\=0A+	SAVE_PIC (TREG)					ASM_LINE_SEP	\=0A+	/*=
 Do syscall, delay loads # */			ASM_LINE_SEP	\=0A+	ble		0x100(%sr2, %r0)	=
	ASM_LINE_SEP	\=0A+	ldi		SYS_ify (syscall_name), %r20	ASM_LINE_SEP	\=0A+	=
ldi		NO_ERROR, %r1			ASM_LINE_SEP	\=0A+	cmpb,>>=3D,n	%r1, %ret0,L(pre_end=
)		ASM_LINE_SEP	\=0A+	/* Restore r19 from TREG */			ASM_LINE_SEP	\=0A+	LO=
AD_PIC(TREG) /* delay */			ASM_LINE_SEP	\=0A+	SYSCALL_ERROR_HANDLER				AS=
M_LINE_SEP	\=0A+	/* Use TREG for temp storage */			ASM_LINE_SEP	\=0A+	cop=
y		%ret0, TREG /* delay */		ASM_LINE_SEP	\=0A+	/* OPTIMIZE: Don't reload =
r19 */		ASM_LINE_SEP	\=0A+	/* do a -1*syscall_ret0 */			ASM_LINE_SEP	\=0A=
+	sub		%r0, TREG, TREG			ASM_LINE_SEP	\=0A+	/* Store into errno location =
*/			ASM_LINE_SEP	\=0A+	stw		TREG, 0(%sr0, %ret0)		ASM_LINE_SEP	\=0A+	/* =
return -1 as error */			ASM_LINE_SEP	\=0A+	ldo		-1(%r0), %ret0			ASM_LINE=
_SEP	\=0A+L(pre_end):						ASM_LINE_SEP	\=0A+	/* Restore return pointer *=
/			ASM_LINE_SEP	\=0A+	ldw		-84(%sp), %rp			ASM_LINE_SEP	\=0A+	/* Restore=
 our frame, restoring TREG */		ASM_LINE_SEP	\=0A+	ldwm		-64(%sp), TREG			=
ASM_LINE_SEP=0A =0A /* We do nothing with the return, except hand it back=
 to someone else */=0A #undef  DO_CALL_NOERRNO=0A-#define DO_CALL_NOERRNO=
(syscall_name, args)			\=0A-	DOARGS_##args                               =
            \=0A-	/* No need to store r19 */		ASM_LINE_SEP	\=0A-	ble  0x1=
00(%sr2,%r0)                    ASM_LINE_SEP    \=0A-	ldi SYS_ify (syscal=
l_name), %r20        ASM_LINE_SEP    \=0A-	/* Caller will restore r19 */	=
	ASM_LINE_SEP	\=0A-	UNDOARGS_##args=0A+#define DO_CALL_NOERRNO(syscall_na=
me, args)				\=0A+	/* No need to store r19 */			ASM_LINE_SEP	\=0A+	ble		0=
x100(%sr2, %r0)		ASM_LINE_SEP    \=0A+	ldi		SYS_ify (syscall_name), %r20	=
ASM_LINE_SEP    \=0A+	/* Caller will restore r19 */			ASM_LINE_SEP=0A =0A=
 /* Here, we return the ERRVAL in assembly, note we don't call the=0A    =
error handler function, but we do 'negate' the return _IF_=0A    it's an =
error. Not sure if this is the right semantic. */=0A =0A #undef	DO_CALL_E=
RRVAL=0A-#define DO_CALL_ERRVAL(syscall_name, args)			\=0A-	DOARGS_##args=
				ASM_LINE_SEP	\=0A-	/* No need to store r19 */		ASM_LINE_SEP	\=0A-	ble=
  0x100(%sr2,%r0)			ASM_LINE_SEP	\=0A-	ldi SYS_ify (syscall_name), %r20	A=
SM_LINE_SEP	\=0A-	/* Caller will restore r19 */		ASM_LINE_SEP	\=0A-	ldi -=
0x1000,%r1				ASM_LINE_SEP	\=0A-	cmpb,>>=3D,n %r1,%ret0,0f			ASM_LINE_SEP=
	\=0A-	sub %r0, %ret0, %ret0			ASM_LINE_SEP	\=0A-0:						ASM_LINE_SEP	\=0A=
-	UNDOARGS_##args				ASM_LINE_SEP=0A-=0A-#define DOARGS_0 /* nothing */=0A=
-#define DOARGS_1 /* nothing */=0A-#define DOARGS_2 /* nothing */=0A-#def=
ine DOARGS_3 /* nothing */=0A-#define DOARGS_4 /* nothing */=0A-#define D=
OARGS_5 ldw -52(%r30), %r22		ASM_LINE_SEP=0A-#define DOARGS_6 ldw -52(%r3=
0), %r22		ASM_LINE_SEP	\=0A-		 ldw -56(%r30), %r21		ASM_LINE_SEP=0A-=0A-=0A=
-#define UNDOARGS_0 /* nothing */=0A-#define UNDOARGS_1 /* nothing */=0A-=
#define UNDOARGS_2 /* nothing */=0A-#define UNDOARGS_3 /* nothing */=0A-#=
define UNDOARGS_4 /* nothing */=0A-#define UNDOARGS_5 /* nothing */=0A-#d=
efine UNDOARGS_6 /* nothing */=0A+#define DO_CALL_ERRVAL(syscall_name, ar=
gs)				\=0A+	/* No need to store r19 */			ASM_LINE_SEP	\=0A+	ble		0x100(%=
sr2, %r0)		ASM_LINE_SEP	\=0A+	ldi		SYS_ify (syscall_name), %r20	ASM_LINE_=
SEP	\=0A+	/* Caller will restore r19 */			ASM_LINE_SEP	\=0A+	ldi		NO_ERRO=
R, %r1			ASM_LINE_SEP	\=0A+	cmpb,>>=3D,n	%r1, %ret0, 0f			ASM_LINE_SEP	\=0A=
+	sub		%r0, %ret0, %ret0		ASM_LINE_SEP	\=0A+0:							ASM_LINE_SEP=0A =0A =
#else=0A =0A@@ -305,27 +341,28 @@=0A    registers r20 -> r26 will conflic=
t with the list so they=0A    are treated specially. Although r19 is clob=
bered by the syscall=0A    we cannot say this because it would violate AB=
I, thus we say=0A-   r4 is clobbered and use that register to save/restor=
e r19=0A+   TREG is clobbered and use that register to save/restore r19=0A=
    across the syscall. */=0A =0A-#define CALL_CLOB_REGS	"%r1", "%r2", US=
ING_GR4 \=0A+#define CALL_CLOB_REGS	"%r1", "%r2", USING_TREG \=0A 		 	"%r=
20", "%r29", "%r31"=0A =0A #undef INLINE_SYSCALL=0A-#define INLINE_SYSCAL=
L(name, nr, args...)	({			\=0A+#define INLINE_SYSCALL(name, nr, args...)	=
			\=0A+({									\=0A 	long __sys_res;							\=0A 	{								\=0A 		regi=
ster unsigned long __res asm("r28");		\=0A 		LOAD_ARGS_##nr(args)					\=0A=
-		/* FIXME: HACK stw/ldw r19 around syscall */		\=0A+		/* FIXME: HACK sa=
ve/load r19 around syscall */		\=0A 		asm volatile(						\=0A-			STW_ASM_=
PIC					\=0A-			"	ble  0x100(%%sr2, %%r0)\n"		\=0A-			"	ldi %1, %%r20\n"	=
		\=0A-			LDW_ASM_PIC					\=0A+			SAVE_ASM_PIC					\=0A+			"	ble		0x100(%=
%sr2, %%r0)\n"	\=0A+			"	ldi		%1, %%r20\n"		\=0A+			LOAD_ASM_PIC					\=0A=
 			: "=3Dr" (__res)					\=0A 			: "i" (SYS_ify(name)) ASM_ARGS_##nr		\=0A=
-			: CALL_CLOB_REGS CLOB_ARGS_##nr			\=0A+			: "memory", CALL_CLOB_REGS =
CLOB_ARGS_##nr	\=0A 		);							\=0A 		__sys_res =3D (long)__res;				\=0A =
	}								\=0A@@ -339,13 +376,13 @@=0A /* INTERNAL_SYSCALL_DECL - Allows =
us to setup some function static=0A    value to use within the context of=
 the syscall=0A    INTERNAL_SYSCALL_ERROR_P - Returns 0 if it wasn't an e=
rror, 1 otherwise=0A-   You are allowed to use the syscall result (val) a=
nd the DECL error variable=0A-   to determine what went wrong.=0A+   You =
are allowed to use the syscall result (val) and the DECL error =0A+   var=
iable to determine what went wrong.=0A    INTERLAL_SYSCALL_ERRNO - Munges=
 the val/err pair into the error number.=0A    In our case we just flip t=
he sign. */=0A =0A #undef INTERNAL_SYSCALL_DECL=0A-#define INTERNAL_SYSCA=
LL_DECL(err) do { } while (0)=0A+#define INTERNAL_SYSCALL_DECL(err) =0A =0A=
 /* Equivalent to  (val < 0)&&(val > -4095) which is what we want */=0A #=
undef INTERNAL_SYSCALL_ERROR_P=0A@@ -357,45 +394,69 @@=0A =0A /* Similar =
to INLINE_SYSCALL but we don't set errno */=0A #undef INTERNAL_SYSCALL=0A=
-#define INTERNAL_SYSCALL(name, err, nr, args...) 		\=0A-({								\=0A-	=
long __sys_res;						\=0A-	{							\=0A-		register unsigned long __res as=
m("r28");	\=0A-		LOAD_ARGS_##nr(args)				\=0A-		/* FIXME: HACK stw/ldw r1=
9 around syscall */	\=0A-		asm volatile(					\=0A-			STW_ASM_PIC				\=0A-=
			"	ble  0x100(%%sr2, %%r0)\n"	\=0A-			"	ldi %1, %%r20\n"		\=0A-			LDW_A=
SM_PIC				\=0A-			: "=3Dr" (__res)				\=0A-			: "i" (SYS_ify(name)) ASM_A=
RGS_##nr	\=0A-			: CALL_CLOB_REGS CLOB_ARGS_##nr		\=0A-		);						\=0A-		_=
_sys_res =3D (long)__res;			\=0A-	}							\=0A-	__sys_res;						\=0A+#def=
ine INTERNAL_SYSCALL(name, err, nr, args...) 			\=0A+({									\=0A+	lon=
g __sys_res;							\=0A+	{								\=0A+		register unsigned long __res asm=
("r28");		\=0A+		LOAD_ARGS_##nr(args)					\=0A+		/* FIXME: HACK save/load=
 r19 around syscall */		\=0A+		asm volatile(						\=0A+			SAVE_ASM_PIC			=
		\=0A+			"	ble	0x100(%%sr2, %%r0)\n"		\=0A+			"	ldi	%1, %%r20\n"			\=0A+=
			LOAD_ASM_PIC					\=0A+			: "=3Dr" (__res)					\=0A+			: "i" (SYS_ify(n=
ame)) ASM_ARGS_##nr		\=0A+			: "memory", CALL_CLOB_REGS CLOB_ARGS_##nr	\=0A=
+		);							\=0A+		__sys_res =3D (long)__res;				\=0A+	}								\=0A+	__s=
ys_res;							\=0A+ })=0A+=0A+=0A+/* The _NCS variant allows non-constant=
 syscall numbers.  */=0A+#undef INTERNAL_SYSCALL_NCS=0A+#define INTERNAL_=
SYSCALL_NCS(name, err, nr, args...) 			\=0A+({									\=0A+	long __sys_r=
es;							\=0A+	{								\=0A+		register unsigned long __res asm("r28");	=
	\=0A+		LOAD_ARGS_##nr(args)					\=0A+		/* FIXME: HACK save/load r19 arou=
nd syscall */		\=0A+		asm volatile(						\=0A+			SAVE_ASM_PIC					\=0A+		=
	"	ble	0x100(%%sr2, %%r0)\n"		\=0A+			"	copy	%1, %%r20\n"			\=0A+			LOAD_=
ASM_PIC					\=0A+			: "=3Dr" (__res)					\=0A+			: "r" (name) ASM_ARGS_##=
nr			\=0A+			: "memory", CALL_CLOB_REGS CLOB_ARGS_##nr	\=0A+		);							\=0A=
+		__sys_res =3D (long)__res;				\=0A+	}								\=0A+	__sys_res;							\=0A=
  })=0A =0A #define LOAD_ARGS_0()=0A-#define LOAD_ARGS_1(r26)					\=0A-	r=
egister unsigned long __r26 __asm__("r26") =3D (unsigned long)(r26);   \=0A=
+#define LOAD_ARGS_1(r26)						\=0A+	register unsigned long __r26 __asm__=
("r26") =3D (unsigned long)(r26); \=0A 	LOAD_ARGS_0()=0A-#define LOAD_ARG=
S_2(r26,r25)					\=0A-	register unsigned long __r25 __asm__("r25") =3D (u=
nsigned long)(r25);   \=0A+#define LOAD_ARGS_2(r26,r25)						\=0A+	regist=
er unsigned long __r25 __asm__("r25") =3D (unsigned long)(r25); \=0A 	LOA=
D_ARGS_1(r26)=0A-#define LOAD_ARGS_3(r26,r25,r24)				\=0A-	register unsig=
ned long __r24 __asm__("r24") =3D (unsigned long)(r24);   \=0A+#define LO=
AD_ARGS_3(r26,r25,r24)					\=0A+	register unsigned long __r24 __asm__("r2=
4") =3D (unsigned long)(r24); \=0A 	LOAD_ARGS_2(r26,r25)=0A-#define LOAD_=
ARGS_4(r26,r25,r24,r23)				\=0A-	register unsigned long __r23 __asm__("r2=
3") =3D (unsigned long)(r23);   \=0A+#define LOAD_ARGS_4(r26,r25,r24,r23)=
					\=0A+	register unsigned long __r23 __asm__("r23") =3D (unsigned long=
)(r23); \=0A 	LOAD_ARGS_3(r26,r25,r24)=0A-#define LOAD_ARGS_5(r26,r25,r24=
,r23,r22)			\=0A-	register unsigned long __r22 __asm__("r22") =3D (unsign=
ed long)(r22);   \=0A+#define LOAD_ARGS_5(r26,r25,r24,r23,r22)				\=0A+	r=
egister unsigned long __r22 __asm__("r22") =3D (unsigned long)(r22); \=0A=
 	LOAD_ARGS_4(r26,r25,r24,r23)=0A-#define LOAD_ARGS_6(r26,r25,r24,r23,r22=
,r21)			\=0A-	register unsigned long __r21 __asm__("r21") =3D (unsigned l=
ong)(r21);   \=0A+#define LOAD_ARGS_6(r26,r25,r24,r23,r22,r21)				 \=0A+	=
register unsigned long __r21 __asm__("r21") =3D (unsigned long)(r21); \=0A=
 	LOAD_ARGS_5(r26,r25,r24,r23,r22)=0A =0A /* Even with zero args we use r=
20 for the syscall number */=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/sysdep.c.Orig	20=
06-03-15 09:58:13.000000000 +0100=0A+++ glibc-2.3.6/sysdeps/unix/sysv/lin=
ux/hppa/sysdep.c	2006-03-15 11:00:04.000000000 +0100=0A@@ -16,12 +16,12 @=
@=0A    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=
=0A    02111-1307 USA.  */=0A =0A+#include <stdarg.h>=0A #include <sysdep=
.h>=0A #include <errno.h>=0A =0A extern int __syscall_error(int err_no);=0A=
-extern int syscall (int sysnum, int arg0, int arg1, int arg2,=0A-		    i=
nt arg3, int arg4, int arg5);=0A+extern long int syscall (long int __sysn=
o, ...) __THROW;=0A =0A /* This routine is jumped to by all the syscall h=
andlers, to stash=0A    an error number into errno.  */=0A@@ -37,22 +37,3=
5 @@=0A    typically be in syscall.S. Also note that we have INLINE_SYSCA=
LL,=0A    INTERNAL_SYSCALL, and all the generated pure assembly syscall w=
rappers.=0A    How often the function is used is unknown. */=0A-int=0A-sy=
scall (int sysnum, int arg0, int arg1, int arg2, int arg3, int arg4,=0A-	=
 int arg5)=0A+=0A+long int =0A+syscall (long int __sysno, ...) =0A {=0A  =
 /* FIXME: Keep this matching INLINE_SYSCALL for hppa */=0A+  va_list arg=
s;=0A+  long int arg0, arg1, arg2, arg3, arg4, arg5;=0A   long int __sys_=
res;=0A+=0A+  /* Load varargs */=0A+  va_start (args, __sysno);=0A+  arg0=
 =3D va_arg (args, long int);=0A+  arg1 =3D va_arg (args, long int);=0A+ =
 arg2 =3D va_arg (args, long int);=0A+  arg3 =3D va_arg (args, long int);=
=0A+  arg4 =3D va_arg (args, long int);=0A+  arg5 =3D va_arg (args, long =
int);=0A+  va_end (args);=0A+  =0A   {=0A     register unsigned long int =
__res asm("r28");=0A     LOAD_ARGS_6 (arg0, arg1, arg2, arg3, arg4, arg5)=
=0A-    asm volatile (STW_ASM_PIC=0A-		  "	ble  0x100(%%sr2, %%r0)	\n"=0A=
-		  "	copy %1, %%r20		\n"=0A-		  LDW_ASM_PIC=0A+    asm volatile (SAVE_A=
SM_PIC=0A+		  "	ble		0x100(%%sr2, %%r0)	\n"=0A+		  "	copy		%1, %%r20		\n"=
=0A+		  LOAD_ASM_PIC=0A 		  : "=3Dr" (__res)=0A-		  : "r" (sysnum) ASM_AR=
GS_6=0A-		  : CALL_CLOB_REGS CLOB_ARGS_6);=0A+		  : "r" (__sysno) ASM_ARG=
S_6=0A+		  : "memory", CALL_CLOB_REGS CLOB_ARGS_6);=0A     __sys_res =3D =
__res;=0A   }=0A   if ((unsigned long int) __sys_res >=3D (unsigned long =
int) -4095)=0A@@ -62,3 +75,4 @@=0A     }=0A   return __sys_res;=0A }=0A+=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A--- libc-orig/sysde=
ps/unix/sysv/linux/posix_fadvise.c	2003-08-16 20:36:22.000000000 -0400=0A=
+++ libc/sysdeps/unix/sysv/linux/posix_fadvise.c	2004-09-26 22:45:33.0000=
00000 -0400=0A@@ -35,6 +35,19 @@=0A     return INTERNAL_SYSCALL_ERRNO (re=
t, err);=0A   return 0;=0A #else=0A+# ifdef __NR_fadvise64_64=0A+  INTERN=
AL_SYSCALL_DECL (err);  =0A+  int ret =3D INTERNAL_SYSCALL (fadvise64_64,=
 err, 6, fd,=0A+			      __LONG_LONG_PAIR ((long) (offset >> 31),=0A+				=
		(long) offset),=0A+			      __LONG_LONG_PAIR ((long) (len >> 31),=0A+		=
				(long) len),=0A+			      advise);=0A+  if (INTERNAL_SYSCALL_ERROR_P (=
ret, err))=0A+    return INTERNAL_SYSCALL_ERRNO (ret, err);=0A+  return 0=
;=0A+# else=0A   return ENOSYS;=0A+# endif=0A #endif=0A }=0A--- glibc-2.3=
.5.old/sysdeps/hppa/dl-lookupcfg.h	2005-05-15 20:36:10.383193082 -0600=0A=
+++ glibc-2.3.5/sysdeps/hppa/dl-lookupcfg.h	2005-05-15 21:44:07.543952666=
 -0600=0A@@ -67,3 +69,15 @@=0A #define DL_DT_FINI_ADDRESS(map, addr) \=0A=
   ((Elf32_Addr)(addr) & 2 ? (addr) : DL_AUTO_FUNCTION_ADDRESS (map, addr=
))=0A =0A+/* The type of the return value of fixup/profile_fixup */=0A+#d=
efine DL_FIXUP_VALUE_TYPE struct fdesc=0A+=0A+/* Construct a fixup value =
from the address and linkmap */=0A+#define DL_FIXUP_MAKE_VALUE(map, addr)=
 \=0A+   ((struct fdesc) { (addr), (map)->l_info[DT_PLTGOT]->d_un.d_ptr }=
)=0A+=0A+/* Extract the code address from a fixup value */=0A+#define DL_=
FIXUP_VALUE_CODE_ADDR(value) ((value).ip)=0A+#define DL_FIXUP_VALUE_ADDR(=
value) ((uintptr_t) &(value))=0A+#define DL_FIXUP_ADDR_VALUE(addr) (*(str=
uct fdesc *) (addr))=0A+=0A
--_=__=_XaM3_.1143193977.2A.502342.42.20515.52.42.007.1138687764
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1143193977.2A.502342.42.20515.52.42.007.1138687764--

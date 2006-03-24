From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] hppa glibc clone() patch proposal (2/3)
Date: Fri, 24 Mar 2006 10:58:45 +0100
Message-ID: <IWMMDX$A24E762190074040ED8D2FFC3A080C67@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1143194325.2A.148139.42.22441.52.42.007.782426930"
To: "Kyle McMartin" <kyle@parisc-linux.org>,
 "Parisc List" <parisc-linux@lists.parisc-linux.org>,
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

--_=__=_XaM3_.1143194325.2A.148139.42.22441.52.42.007.782426930
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Mike, pa*,

This 2d step is just tab/whitespace adjustment (beautify ;-) )

--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.orig1      2006-03-2=
4
09:58:17.000000000 +0100
+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S    2006-03-24
10:09:12.000000000 +0100
@@ -47,78 +47,78 @@
 ENTRY(__clone)
 
        /* Save the fn ptr and arg on the new stack.  */
-       stwm    %r26,64(%r25)
-       stw     %r23,-60(%r25)
+       stwm            %arg0, 64(%arg1)
+       stw             %arg3, -60(%arg1)
        /* Clone arguments are (int flags, void * child_stack) */
-       copy    %r24,%r26       /* flags are first */
+       copy            %arg2, %arg0            /* flags are first */
        /* User stack pointer is in the correct register already */
 
        /* Load args from stack... */
-       ldw     -52(%sp), %r24  /* Load parent_tidptr */
-       ldw     -56(%sp), %r23  /* Load newtls */
-       ldw     -60(%sp), %r22  /* Load child_tidptr */
+       ldw             -52(%sp), %arg2         /* Load parent_tidptr */
+       ldw             -56(%sp), %arg3         /* Load newtls */
+       ldw             -60(%sp), %r22          /* Load child_tidptr */
 
        /* Create frame for function */
-       copy    %sp, %r21
-       stwm    %r3, 64(%sp)
-       stw     %r21, -4(%sp)
+       copy            %sp, %r21
+       stwm            %r3, 64(%sp)
+       stw             %r21, -4(%sp)
 
        /* Save the PIC register. */
 #ifdef PIC
-       copy    %r19, %r3               /* parent */
+       copy            %r19, %r3               /* parent */
 #endif
 
        /* Do the system call */
-       ble     0x100(%sr2,%r0)
-       ldi     __NR_clone,%r20
+       ble             0x100(%sr2, %r0)
+       ldi             __NR_clone, %r20
 
-       ldi     -4096,%r1
-       comclr,>>=3D %r1,%ret0,%r0        /* Note: unsigned compare. */
-       b,n     .Lerror
+       ldi             -4096, %r1
+       comclr,>>=3D      %r1, %ret0, %r0         /* Note: unsigned compa=
re. */
+       b,n             .Lerror
 
-       comib,=3D,n 0,%ret0,thread_start
+       comib,=3D,n       0, %ret0, thread_start
 
        /* Successful return from the parent
           No need to restore the PIC register, 
           since we return immediately. */
 
-       bv      %r0(%rp)
-       ldwm    -64(%sp), %r3
+       bv              %r0(%rp)
+       ldwm            -64(%sp), %r3
 
        /* Something bad happened -- no child created */
 .Lerror:
 
        /* Restore the PIC register on error */
 #ifdef PIC
-       copy    %r3, %r19               /* parent */ 
+       copy            %r3, %r19               /* parent */ 
 #endif
        /* Set errno */
-       copy    %ret0, %r3
-       b       __syscall_error
-       sub     %r0,%ret0,%arg0
-       copy    %r3, %ret0
+       copy            %ret0, %r3
+       b               __syscall_error
+       sub             %r0, %ret0, %arg0
+       copy            %r3, %ret0
        /* Return after setting errno */
-       bv      %r0(%rp)
-       ldwm    -64(%sp), %r3
+       bv              %r0(%rp)
+       ldwm            -64(%sp), %r3
 
 thread_start:
 
        /* Load up the arguments.  */
-       ldw     -60(%sr0, %sp),%arg0
-       ldw     -64(%sr0, %sp),%r22
+       ldw             -60(%sr0, %sp), %arg0
+       ldw             -64(%sr0, %sp), %r22
 
        /* $$dyncall fixes childs PIC register */
 
        /* Call the user's function */
-       bl      $$dyncall,%r31
-       copy    %r31,%rp
+       bl              $$dyncall, %r31
+       copy            %r31, %rp
 
-       bl      _exit,%rp
-       copy    %ret0,%arg0
+       bl              _exit, %rp
+       copy            %ret0, %arg0
 
        /* Die horribly.  */
-       iitlbp  %r0,(%sr0,%r0)
+       iitlbp          %r0, (%sr0, %r0)
 
 PSEUDO_END(__clone)
 
-weak_alias(__clone, clone)
+weak_alias (__clone, clone)
=3D=3D=3D=3D<>=3D=3D=3D=3D

(Ah yes also reuse older arg[123] notation)

Joel=0A=0A-------------------------------------------------------=0ANOTE!=
 My email address is changing to ... @scarlet.be=0APlease make the necess=
ary changes in your address book. =0A=0A
--_=__=_XaM3_.1143194325.2A.148139.42.22441.52.42.007.782426930
Content-Type: application/octet-stream;
	name="=?iso-8859-1?Q?clone.S.diff-2=5F3?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="=?iso-8859-1?Q?clone.S.diff-2=5F3?="

LS0tIGdsaWJjLTIuMy42L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2hwcGEvY2xvbmUuUy5v
cmlnMQkyMDA2LTAzLTI0IDA5OjU4OjE3LjAwMDAwMDAwMCArMDEwMAorKysgZ2xpYmMtMi4z
LjYvc3lzZGVwcy91bml4L3N5c3YvbGludXgvaHBwYS9jbG9uZS5TCTIwMDYtMDMtMjQgMTA6
MDk6MTIuMDAwMDAwMDAwICswMTAwCkBAIC00Nyw3OCArNDcsNzggQEAKIEVOVFJZKF9fY2xv
bmUpCiAKIAkvKiBTYXZlIHRoZSBmbiBwdHIgYW5kIGFyZyBvbiB0aGUgbmV3IHN0YWNrLiAg
Ki8KLQlzdHdtICAgICVyMjYsNjQoJXIyNSkKLQlzdHcJJXIyMywtNjAoJXIyNSkKKwlzdHdt
CQklYXJnMCwgNjQoJWFyZzEpCisJc3R3CQklYXJnMywgLTYwKCVhcmcxKQogCS8qIENsb25l
IGFyZ3VtZW50cyBhcmUgKGludCBmbGFncywgdm9pZCAqIGNoaWxkX3N0YWNrKSAqLwotCWNv
cHkJJXIyNCwlcjI2CS8qIGZsYWdzIGFyZSBmaXJzdCAqLworCWNvcHkJCSVhcmcyLCAlYXJn
MAkJLyogZmxhZ3MgYXJlIGZpcnN0ICovCiAJLyogVXNlciBzdGFjayBwb2ludGVyIGlzIGlu
IHRoZSBjb3JyZWN0IHJlZ2lzdGVyIGFscmVhZHkgKi8KIAogCS8qIExvYWQgYXJncyBmcm9t
IHN0YWNrLi4uICovCi0JbGR3CS01Miglc3ApLCAlcjI0CS8qIExvYWQgcGFyZW50X3RpZHB0
ciAqLwotCWxkdwktNTYoJXNwKSwgJXIyMyAJLyogTG9hZCBuZXd0bHMgKi8KLQlsZHcJLTYw
KCVzcCksICVyMjIJLyogTG9hZCBjaGlsZF90aWRwdHIgKi8KKwlsZHcJCS01Miglc3ApLCAl
YXJnMgkJLyogTG9hZCBwYXJlbnRfdGlkcHRyICovCisJbGR3CQktNTYoJXNwKSwgJWFyZzMJ
CS8qIExvYWQgbmV3dGxzICovCisJbGR3CQktNjAoJXNwKSwgJXIyMgkJLyogTG9hZCBjaGls
ZF90aWRwdHIgKi8KIAogCS8qIENyZWF0ZSBmcmFtZSBmb3IgZnVuY3Rpb24gKi8KLQljb3B5
CSVzcCwgJXIyMQotCXN0d20JJXIzLCA2NCglc3ApCi0Jc3R3CSVyMjEsIC00KCVzcCkKKwlj
b3B5CQklc3AsICVyMjEKKwlzdHdtCQklcjMsIDY0KCVzcCkKKwlzdHcJCSVyMjEsIC00KCVz
cCkKIAogCS8qIFNhdmUgdGhlIFBJQyByZWdpc3Rlci4gKi8KICNpZmRlZiBQSUMKLQljb3B5
CSVyMTksICVyMwkJLyogcGFyZW50ICovCisJY29weQkJJXIxOSwgJXIzCQkvKiBwYXJlbnQg
Ki8KICNlbmRpZgogCiAJLyogRG8gdGhlIHN5c3RlbSBjYWxsICovCi0JYmxlICAgICAweDEw
MCglc3IyLCVyMCkKLQlsZGkJX19OUl9jbG9uZSwlcjIwCisJYmxlCQkweDEwMCglc3IyLCAl
cjApCisJbGRpCQlfX05SX2Nsb25lLCAlcjIwCiAKLQlsZGkJLTQwOTYsJXIxCi0JY29tY2xy
LD4+PSAlcjEsJXJldDAsJXIwCS8qIE5vdGU6IHVuc2lnbmVkIGNvbXBhcmUuICovCi0JYixu
CS5MZXJyb3IKKwlsZGkJCS00MDk2LCAlcjEKKwljb21jbHIsPj49CSVyMSwgJXJldDAsICVy
MAkJLyogTm90ZTogdW5zaWduZWQgY29tcGFyZS4gKi8KKwliLG4JCS5MZXJyb3IKIAotCWNv
bWliLD0sbiAwLCVyZXQwLHRocmVhZF9zdGFydAorCWNvbWliLD0sbgkwLCAlcmV0MCwgdGhy
ZWFkX3N0YXJ0CiAKIAkvKiBTdWNjZXNzZnVsIHJldHVybiBmcm9tIHRoZSBwYXJlbnQKIAkg
ICBObyBuZWVkIHRvIHJlc3RvcmUgdGhlIFBJQyByZWdpc3RlciwgCiAJICAgc2luY2Ugd2Ug
cmV0dXJuIGltbWVkaWF0ZWx5LiAqLwogCi0JYnYJJXIwKCVycCkKLQlsZHdtCS02NCglc3Ap
LCAlcjMKKwlidgkJJXIwKCVycCkKKwlsZHdtCQktNjQoJXNwKSwgJXIzCiAKIAkvKiBTb21l
dGhpbmcgYmFkIGhhcHBlbmVkIC0tIG5vIGNoaWxkIGNyZWF0ZWQgKi8KIC5MZXJyb3I6CiAK
IAkvKiBSZXN0b3JlIHRoZSBQSUMgcmVnaXN0ZXIgb24gZXJyb3IgKi8KICNpZmRlZiBQSUMK
LQljb3B5CSVyMywgJXIxOQkJLyogcGFyZW50ICovIAorCWNvcHkJCSVyMywgJXIxOQkJLyog
cGFyZW50ICovIAogI2VuZGlmCiAJLyogU2V0IGVycm5vICovCi0JY29weQklcmV0MCwgJXIz
Ci0JYglfX3N5c2NhbGxfZXJyb3IKLQlzdWIgICAgICVyMCwlcmV0MCwlYXJnMAotCWNvcHkJ
JXIzLCAlcmV0MAorCWNvcHkJCSVyZXQwLCAlcjMKKwliCQlfX3N5c2NhbGxfZXJyb3IKKwlz
dWIJCSVyMCwgJXJldDAsICVhcmcwCisJY29weQkJJXIzLCAlcmV0MAogCS8qIFJldHVybiBh
ZnRlciBzZXR0aW5nIGVycm5vICovCi0JYnYJJXIwKCVycCkKLQlsZHdtCS02NCglc3ApLCAl
cjMKKwlidgkJJXIwKCVycCkKKwlsZHdtCQktNjQoJXNwKSwgJXIzCiAKIHRocmVhZF9zdGFy
dDoKIAogCS8qIExvYWQgdXAgdGhlIGFyZ3VtZW50cy4gICovCi0JbGR3CS02MCglc3IwLCAl
c3ApLCVhcmcwCi0JbGR3ICAgICAtNjQoJXNyMCwgJXNwKSwlcjIyCisJbGR3CQktNjAoJXNy
MCwgJXNwKSwgJWFyZzAKKwlsZHcJCS02NCglc3IwLCAlc3ApLCAlcjIyCiAKIAkvKiAkJGR5
bmNhbGwgZml4ZXMgY2hpbGRzIFBJQyByZWdpc3RlciAqLwogCiAJLyogQ2FsbCB0aGUgdXNl
cidzIGZ1bmN0aW9uICovCi0JYmwJJCRkeW5jYWxsLCVyMzEKLQljb3B5CSVyMzEsJXJwCisJ
YmwJCSQkZHluY2FsbCwgJXIzMQorCWNvcHkJCSVyMzEsICVycAogCi0JYmwJX2V4aXQsJXJw
Ci0JY29weQklcmV0MCwlYXJnMAorCWJsCQlfZXhpdCwgJXJwCisJY29weQkJJXJldDAsICVh
cmcwCiAKIAkvKiBEaWUgaG9ycmlibHkuICAqLwotCWlpdGxicAklcjAsKCVzcjAsJXIwKQor
CWlpdGxicAkJJXIwLCAoJXNyMCwgJXIwKQogCiBQU0VVRE9fRU5EKF9fY2xvbmUpCiAKLXdl
YWtfYWxpYXMoX19jbG9uZSwgY2xvbmUpCit3ZWFrX2FsaWFzIChfX2Nsb25lLCBjbG9uZSkK

--_=__=_XaM3_.1143194325.2A.148139.42.22441.52.42.007.782426930
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1143194325.2A.148139.42.22441.52.42.007.782426930--

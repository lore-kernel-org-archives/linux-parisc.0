From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] input constraints in atomic.h too loose ?
Date: Fri, 2 Feb 2007 22:15:50 -0500
Message-ID: <200702022215.50914.vapier__33994.1175342121$1416624274$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_m5/wFZqfBswZx60"
To: parisc-linux@lists.parisc-linux.org
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

--Boundary-00=_m5/wFZqfBswZx60
Content-Type: multipart/signed; boundary="nextPart1567940.GMsSYHFemH";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1567940.GMsSYHFemH
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

while building glibc-2.5/cvs with gcc-4.1.1, i hit an error about invalid=20
operands in the locking code ... looks like the declared constraints for th=
e=20
inputs in atomic.h are too loose ?

$ hppa2.0-unknown-linux-gnu-gcc -O1 -fPIC vfprintf.i -c
/tmp/ccvCRbqg.s: Assembler messages:
/tmp/ccvCRbqg.s:41: Error: bad expression
/tmp/ccvCRbqg.s:41: Error: bad expression
/tmp/ccvCRbqg.s:41: Error: bad expression
/tmp/ccvCRbqg.s:41: Error: bad expression
/tmp/ccvCRbqg.s:41: Error: bad expression
/tmp/ccvCRbqg.s:41: Error: bad expression
/tmp/ccvCRbqg.s:41: Error: Invalid operands=20
/tmp/ccvCRbqg.s:43: Error: bad expression
/tmp/ccvCRbqg.s:43: Error: bad expression
/tmp/ccvCRbqg.s:43: Error: bad expression
/tmp/ccvCRbqg.s:43: Error: bad expression
/tmp/ccvCRbqg.s:43: Error: bad expression
/tmp/ccvCRbqg.s:43: Error: bad expression
/tmp/ccvCRbqg.s:43: Error: Invalid operands=20
=2Dmike

--nextPart1567940.GMsSYHFemH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARcP+ZkFjO5/oN/WBAQJqiBAAhlZLUsR/sL87g9IfjoDYzYHkjtClC5Lw
aPFLI3owlIo4K1zIvus+LfwDr8EwEbl/ZiDjuRBcvAFUiYbkrQV06wYHhD/UHtgj
adPPrh++hj0GmpRPVmyDjEZcskcB0y+QsrZYNv/xmSXTKENbXa2gdjSZnUMRUWkZ
x948dhtYmCpk7gQVP/z6L5tAHFmrcIMREYcuKsEYbtl3Qg83QNIJQfZ59PHX5wNR
wDRd8JXSwC2yhdtHhL3IvGxf73c3iyFYmQniWo47H5DosGUnoBL6gEKk/C6gPCiQ
Tq/gFw+DbYtldCHOyQK0Bdds6ZSAG663b7Scw5ued8h+NZzSDlnVp1e6SoPI7LNZ
YLYk7wXW00Gh1IkcWX1Vh9Yfy7o1Wkd3d+rFGpij9ZUlPc+5Zp2W7nE74/8dqo8i
H0OxOlHjA9RoiyO7CM4phlvoCreWjUXcIgxpTl6v/VPjpSf6qvJUrfZewHjrKS1a
kI3hIQYG6e107VtqhGKlwEnuJLWkLP/XCNxBddsrn0k59+U7PdX5bR7EcsB5fcZa
Jn2S/Lqqsl8nxv2wtbCsM00jJO72KAbu8A2huoU5+LAAN2A1ezIUngb5kHrE6DSK
d8M6tye6zWEVIaT/bGj1II1X51QfzZYQj1Jw4pjabbB7yD1wGsxIj5ATi9HE79cb
4IcrRX1rsOw=
=Md4a
-----END PGP SIGNATURE-----

--nextPart1567940.GMsSYHFemH--

--Boundary-00=_m5/wFZqfBswZx60
Content-Type: text/x-objcsrc;
  charset="us-ascii";
  name="vfprintf.i"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="vfprintf.i"

static void __lll_mutex_lock(int *futex)
{
	int lws_errno = 14; 
	int lws_ret;
	asm (
"0:					\n\t" 
"copy	%3, %%r26			\n\t" 
"copy	%4, %%r25			\n\t" 
"copy	%5, %%r24			\n\t" 
"ble	" "0xb0" "(%%sr2, %%r0)		\n\t" 
"ldi	" "0" ", %%r20		\n\t" 
"cmpib,=,n " "11" ",%%r21,0b	\n\t" 
"nop					\n\t" 
"stw	%%r28, %0			\n\t" 
"sub	%%r0, %%r21, %%r21		\n\t" 
"stw	%%r21, %1			\n\t"
: "=m" (lws_ret), "=m"(lws_errno), "=m"(*futex)
: "r"(futex), "r"(0), "r"(1)
:"r1", "r26", "r25", "r24", "r23", "r22", "r21", "r20", "r28", "r31", "memory"
);
}
typedef struct {
	char *_IO_write_end;
	int lock;
} _IO_FILE;
__attribute__ ((__nothrow__)) __attribute__ ((noinline))
static int buffered_vfprintf(_IO_FILE *s)
{
	char buf[8192];
	_IO_FILE *hp;
	hp->_IO_write_end = buf;
	__lll_mutex_lock(&s->lock);
}
void foo(_IO_FILE *s)
{
	buffered_vfprintf(s);
}

--Boundary-00=_m5/wFZqfBswZx60
Content-Type: text/plain;
  charset="us-ascii";
  name="vfprintf.s"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="vfprintf.s"

	.LEVEL 1.1
	.text
	.align 4
	.type	buffered_vfprintf, @function
buffered_vfprintf:
	.PROC
	.CALLINFO FRAME=8320,CALLS,SAVE_RP,ENTRY_GR=7
	.ENTRY
	stw %r2,-20(%r30)
	addil L'8320,%r30
	ldo R'8320(%r1),%r30
	stw %r8,-112(%r30)
	stw %r7,-108(%r30)
	stw %r6,-104(%r30)
	stw %r5,-100(%r30)
	stw %r4,-96(%r30)
	stw %r19,-32(%r30)
	copy %r26,%r8
	ldil L'-16384,%r28
	ldo 8072(%r28),%r28
	addl %r30,%r28,%r6
	stw %r6,0(%r28)
	ldo 4(%r26),%r5
	ldil L'8192,%r7
	addl %r6,%r7,%r20
	ldi 14,%r28
	stw %r28,0(%r20)
	ldi 0,%r2
	ldi 1,%r29
	ldil L'16384,%r4
	ldo -8188(%r4),%r4
#APP
	0:					
	copy	%r5, %r26			
	copy	%r2, %r25			
	copy	%r29, %r24			
	ble	0xb0(%sr2, %r0)		
	ldi	0, %r20		
	cmpib,=,n 11,%r21,0b	
	nop					
	stw	%r28, %r6(%r4)			
	sub	%r0, %r21, %r21		
	stw	%r21, %r6(%r7)			
	
#NO_APP
	ldw -112(%r30),%r8
	ldw -108(%r30),%r7
	ldw -104(%r30),%r6
	ldw -100(%r30),%r5
	ldw -96(%r30),%r4
	addil L'-8320,%r30
	ldo R'-8320(%r1),%r30
	ldw -20(%r30),%r2
	bv,n %r0(%r2)
	.EXIT
	.PROCEND
	.size	buffered_vfprintf, .-buffered_vfprintf
	.align 4
.globl foo
	.type	foo, @function
foo:
	.PROC
	.CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
	.ENTRY
	stw %r2,-20(%r30)
	stwm %r4,64(%r30)
	bl buffered_vfprintf,%r2
	stw %r19,-32(%r30)
	ldw -84(%r30),%r2
	bv %r0(%r2)
	ldwm -64(%r30),%r4
	.EXIT
	.PROCEND
	.size	foo, .-foo
	.ident	"GCC: (GNU) 4.1.1 (Gentoo 4.1.1-r3)"

--Boundary-00=_m5/wFZqfBswZx60
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_m5/wFZqfBswZx60--

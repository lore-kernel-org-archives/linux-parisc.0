From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: copy_user_page_asm suggested 64bit improvment
	(Test case)
Date: Tue, 28 Dec 2004 16:25:45 +0000
Message-ID: <41D18909.9060308@tiscali.be>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<20041227073654.GI29492@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------090506050100010806040901"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041227073654.GI29492@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------090506050100010806040901
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

A test case may can help better to show improvement:

gcc -O2 -o cpup0 cpup0.c
gcc -march=2.0 -O2 -DLP64 -o cpup1 cpup0.c
gcc -march=2.0 -O2 -DLP64 -DV1 -o cpup2 cpup0.c
gcc -march=2.0 -O2 -DLP64 -DV2 -o cpup3 cpup0.c

Linux patst006 2.6.10-rc3-pa4-n4kmp #3 SMP Fri Dec 10 13:45:46 CET 2004 parisc64 GNU/Linux

# time ./cpup0 ; time ./cpup1; time ./cpup2 ; time ./cpup3

real	0m2.294s
user	0m0.226s
sys	0m2.068s

real	0m2.213s
user	0m0.140s
sys	0m2.074s

real	0m2.217s
user	0m0.108s
sys	0m2.110s

real	0m2.208s
user	0m0.108s
sys	0m2.100s
# time ./cpup0 ; time ./cpup1; time ./cpup2 ; time ./cpup3

real	0m2.316s
user	0m0.197s
sys	0m2.119s

real	0m2.217s
user	0m0.117s
sys	0m2.101s

real	0m2.203s
user	0m0.119s
sys	0m2.084s

real	0m2.205s
user	0m0.126s
sys	0m2.079s
# time ./cpup0 ; time ./cpup1; time ./cpup2 ; time ./cpup3

real	0m2.316s
user	0m0.194s
sys	0m2.122s

real	0m2.211s
user	0m0.126s
sys	0m2.086s

real	0m2.208s
user	0m0.106s
sys	0m2.102s

real	0m2.217s
user	0m0.113s
sys	0m2.105s
# time ./cpup0 ; time ./cpup1; time ./cpup2 ; time ./cpup3

real	0m2.311s
user	0m0.219s
sys	0m2.093s

real	0m2.222s
user	0m0.141s
sys	0m2.082s

real	0m2.207s
user	0m0.115s
sys	0m2.093s

real	0m2.208s
user	0m0.117s
sys	0m2.091s
# time ./cpup0 ; time ./cpup1; time ./cpup2 ; time ./cpup3

real	0m2.310s
user	0m0.205s
sys	0m2.105s

real	0m2.213s
user	0m0.104s
sys	0m2.109s

real	0m2.207s
user	0m0.115s
sys	0m2.092s

real	0m2.205s
user	0m0.108s
sys	0m2.096s

I would like here to know if the order could have importance?

# time ./cpup0 ; time ./cpup1; time ./cpup3 ; time ./cpup2

real	0m2.294s
user	0m0.196s
sys	0m2.100s

real	0m2.221s
user	0m0.111s
sys	0m2.111s

real	0m2.226s
user	0m0.097s
sys	0m2.130s

real	0m2.208s
user	0m0.107s
sys	0m2.101s
# time ./cpup0 ; time ./cpup3; time ./cpup2 ; time ./cpup1

real	0m2.302s
user	0m0.200s
sys	0m2.102s

real	0m2.206s
user	0m0.110s
sys	0m2.097s

real	0m2.213s
user	0m0.108s
sys	0m2.106s

real	0m2.214s
user	0m0.123s
sys	0m2.092s
# time ./cpup3 ; time ./cpup2; time ./cpup1 ; time ./cpup0

real	0m2.209s
user	0m0.104s
sys	0m2.105s

real	0m2.221s
user	0m0.115s
sys	0m2.106s

real	0m2.227s
user	0m0.111s
sys	0m2.116s

real	0m2.296s
user	0m0.212s
sys	0m2.085s

May be more improvement in 'more register used' (i.e. V2 and cpup3)?

Joel

--------------090506050100010806040901
Content-Type: text/x-csrc;
 name="cpup0.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="cpup0.c"


#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <asm/page.h>

void __copy_user_page_asm(void *to, void *from)
{
	register unsigned long __to __asm__ ("r26") =3D  (unsigned long)to;
	register unsigned long __from __asm__ ("r25") =3D  (unsigned long)from;

#ifdef LP64

asm volatile ("ldi		32, %%r1\n"	/* PAGE_SIZE/128 =3D=3D 32 */
#if V2
"1:	ldd		0(%0), %%r19\n"
"	ldd		8(%0), %%r20\n"
"	ldd		16(%0), %%r21\n"
"	ldd		24(%0), %%r22\n"
"	std		%%r19, 0(%1)\n"
"	std		%%r20, 8(%1)\n"
"	ldd		32(%0), %%r23\n"
"	ldd		40(%0), %%r24\n"
"	std		%%r21, 16(%1)\n"
"	std		%%r22, 24(%1)\n"
"	ldd		48(%0), %%r19\n"
"	ldd		56(%0), %%r20\n"
"	std		%%r23, 32(%1)\n"
"	std		%%r24, 40(%1)\n"
"	ldd		64(%0), %%r21\n"
"	ldd		72(%0), %%r22\n"
"	std		%%r19, 48(%1)\n"
"	std		%%r20, 56(%1)\n"
"	ldd		80(%0), %%r23\n"
"	ldd		88(%0), %%r24\n"
"	std		%%r21, 64(%1)\n"
"	std		%%r22, 72(%1)\n"
"	ldd		96(%0), %%r19\n"
"	ldd		104(%0), %%r20\n"
"	std		%%r23, 80(%1)\n"
"	std		%%r24, 88(%1)\n"
"	ldd		112(%0), %%r21\n"
"	ldd		120(%0), %%r22\n"
"	std		%%r19, 96(%1)\n"
"	std		%%r20, 104(%1)\n"
"	ldo		128(%0), %0\n"
"	std		%%r21, 112(%1)\n"
"	std		%%r22, 120(%1)\n"
"	addib,>		-1, %%r1, 1b\n"
"	ldo		128(%1), %1"
#else	/* !V2 */=20
"1:	ldd		0(%0), %%r19\n"
"	ldd		8(%0), %%r20\n"
"	ldd		16(%0), %%r21\n"
"	ldd		24(%0), %%r22\n"
"	std		%%r19, 0(%1)\n"
"	std		%%r20, 8(%1)\n"
#ifndef V1
"	std		%%r21, 16(%1)\n"
"	std		%%r22, 24(%1)\n"
"	ldd		32(%0), %%r19\n"
"	ldd		40(%0), %%r20\n"
"	ldd		48(%0), %%r21\n"
"	ldd		56(%0), %%r22\n"
"	std		%%r19, 32(%1)\n"
"	std		%%r20, 40(%1)\n"
"	std		%%r21, 48(%1)\n"
"	std		%%r22, 56(%1)\n"
"	ldd		64(%0), %%r19\n"
"	ldd		72(%0), %%r20\n"
"	ldd		80(%0), %%r21\n"
"	ldd		88(%0), %%r22\n"
"	std		%%r19, 64(%1)\n"
"	std		%%r20, 72(%1)\n"
"	std		%%r21, 80(%1)\n"
"	std		%%r22, 88(%1)\n"
"	ldd		96(%0), %%r19\n"
"	ldd		104(%0), %%r20\n"
"	ldd		112(%0), %%r21\n"
"	ldd		120(%0), %%r22\n"
"	std		%%r19, 96(%1)\n"
"	std		%%r20, 104(%1)\n"
"	std		%%r21, 112(%1)\n"
"	std		%%r22, 120(%1)\n"
"	ldo		128(%1), %1\n"
"	addib,>		-1, %%r1, 1b\n"
"	ldo		128(%0), %0"
#else	/* V1 */
"	ldd		32(%0), %%r19\n"
"	ldd		40(%0), %%r20\n"
"	std		%%r21, 16(%1)\n"
"	std		%%r22, 24(%1)\n"
"	ldd		48(%0), %%r21\n"
"	ldd		56(%0), %%r22\n"
"	std		%%r19, 32(%1)\n"
"	std		%%r20, 40(%1)\n"
"	ldd		64(%0), %%r19\n"
"	ldd		72(%0), %%r20\n"
"	std		%%r21, 48(%1)\n"
"	std		%%r22, 56(%1)\n"
"	ldd		80(%0), %%r21\n"
"	ldd		88(%0), %%r22\n"
"	std		%%r19, 64(%1)\n"
"	std		%%r20, 72(%1)\n"
"	ldd		96(%0), %%r19\n"
"	ldd		104(%0), %%r20\n"
"	std		%%r21, 80(%1)\n"
"	std		%%r22, 88(%1)\n"
"	ldd		112(%0), %%r21\n"
"	ldd		120(%0), %%r22\n"
"	std		%%r19, 96(%1)\n"
"	std		%%r20, 104(%1)\n"
"	ldo		128(%0), %0\n"
"	std		%%r21, 112(%1)\n"
"	std		%%r22, 120(%1)\n"
"	addib,>		-1, %%r1, 1b\n"
"	ldo		128(%1), %1"
#endif	/* V1 */

#endif	/* 0 */

#else	/* !__LP64__ */

asm volatile ("ldi		64, %%r1\n"
"1:	ldw		0(%0), %%r19\n"
"	ldw		4(%0), %%r20\n"
"	ldw		8(%0), %%r21\n"
"	ldw		12(%0), %%r22\n"
"	stw		%%r19, 0(%1)\n"
"	stw		%%r20, 4(%1)\n"
"	stw		%%r21, 8(%1)\n"
"	stw		%%r22, 12(%1)\n"
"	ldw		16(%0), %%r19\n"
"	ldw		20(%0), %%r20\n"
"	ldw		24(%0), %%r21\n"
"	ldw		28(%0), %%r22\n"
"	stw		%%r19, 16(%1)\n"
"	stw		%%r20, 20(%1)\n"
"	stw		%%r21, 24(%1)\n"
"	stw		%%r22, 28(%1)\n"
"	ldw		32(%0), %%r19\n"
"	ldw		36(%0), %%r20\n"
"	ldw		40(%0), %%r21\n"
"	ldw		44(%0), %%r22\n"
"	stw		%%r19, 32(%1)\n"
"	stw		%%r20, 36(%1)\n"
"	stw		%%r21, 40(%1)\n"
"	stw		%%r22, 44(%1)\n"
"	ldw		48(%0), %%r19\n"
"	ldw		52(%0), %%r20\n"
"	ldw		56(%0), %%r21\n"
"	ldw		60(%0), %%r22\n"
"	stw		%%r19, 48(%1)\n"
"	stw		%%r20, 52(%1)\n"
"	stw		%%r21, 56(%1)\n"
"	stw		%%r22, 60(%1)\n"
"	ldo		64(%1), %1\n"
"	addib,>		-1, %%r1, 1b\n"
"	ldo		64(%0), %0"
#endif	/* __LP64__ */
	:	=09
	: "r"(__from), "r"(__to) );
}

/*=20
#define	INIT	1
#define	DEBUG	1
 */

#define BUFFSIZE	(1024*1024*256)
#define PPB		(BUFFSIZE/PAGE_SIZE)	/* Pages Per Buff */


int main(int argc, char * * argv, char * * env)
{
	char MemSrc[] =3D "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzA=
BCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUV=
WXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopq=
rstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKL=
MNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefg=
hijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzAB=
CDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVW=
XYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqr=
stuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLM=
NOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgh=
ijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABC=
DEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX=
YZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrs=
tuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN=
OPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghi=
jklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCD=
EFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY=
ZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrst=
uvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNO=
PQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghij=
klmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDE=
FGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ=
abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstu=
vwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOP=
QRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk=
lmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEF=
GHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZa=
bcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuv=
wxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQ=
RSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl=
mnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFG=
HIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZab=
cdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw=
xyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQR=
STUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklm=
nopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGH=
IJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabc=
defghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwx=
yzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRS=
TUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmn=
opqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHI=
JKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcd=
efghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxy=
zABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRST=
UVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmno=
pqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJ=
KLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcde=
fghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz=
ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTU=
VWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnop=
qrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJK=
LMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdef=
ghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzA=
BCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUV=
WXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopq=
rstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKL=
MNOPQRSTUVWXYZabcdefghijklmn" ;

	char *MemDst;
	int i, j, k;


	MemDst =3D malloc(BUFFSIZE);
	for (j =3D 0; j < PPB ; j++) {
		__copy_user_page_asm(MemDst+(j*PAGE_SIZE), MemSrc);
	}

	MemDst[BUFFSIZE] =3D '\0';

#if DEBUG
/*
	printf("MemDst =3D %s\n", MemDst);
 */
	for (i=3D0; i<BUFFSIZE; i++) {
		printf("MemDst[%d] =3D %c\n", i, MemDst[i]);
	}
#endif
	return 0;
}


--------------090506050100010806040901
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------090506050100010806040901--

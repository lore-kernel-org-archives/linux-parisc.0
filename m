From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Need more advise [Was: [parisc-linux] clear user page test]
Date: Thu, 9 Dec 2004 17:31:10 +0100
Message-ID: <418A80F70000E6FF@mail-5-bnl.tiscali.it>
References: <418A80F70000DECC@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A80F70000DECC@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

> > It should walk through at least 32MB of RAM to be certain it's
> > not touching the same cachelines over again. For PA8800 it would
> > need to be 128MB or something like that.
> >
Here is the new test code (purged of printf() debug) let me call clup5.c
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#ifndef __LP64__
#warning "Not supported on 32bit cpu"
#define L1_CACHE_BYTES		64
#define	N_L1_CACHE_BYTES	128	/* 2*L1_CACHE_BYTES */
#endif

inline void __clear_user_page_asm(unsigned long vaddr)
{

asm volatile ("ldi	64,%%r1\n"
"1:	std	%%r0,0(%0)\n"		
"	std	%%r0,8(%0)\n"		
"	std	%%r0,16(%0)\n"	
"	std	%%r0,24(%0)\n"
"	std	%%r0,32(%0)\n"
"	std	%%r0,40(%0)\n"
"	std	%%r0,48(%0)\n"	
"	std	%%r0,56(%0)\n"
"	std	%%r0,64(%0)\n"		
"	std	%%r0,72(%0)\n"		
"	std	%%r0,80(%0)\n"	
"	std	%%r0,88(%0)\n"
"	std	%%r0,96(%0)\n"
"	std	%%r0,104(%0)\n"
"	std	%%r0,112(%0)\n"	
"	std	%%r0,120(%0)\n"
"	addib,>  -2,%%r1,1b\n"
"	ldo	128(%0),%0"
	:		
	: "r"(vaddr) );
}

inline void prefetchw(const void *addr)
{
	__asm__("ldd 512(%0), %%r0" : : "r" (addr));
}

/* 
#define	INIT	1
#define	DEBUG	1
 */

#define PAGESIZ 4*1024
#define MEMSIZ  1*PAGESIZ*1024  /* i.e. 4Mb */

int main(int argc, char * * argv, char * * env)
{
	char APage[MEMSIZ];
	int i, j, k;

	for (k=3D0; k<8; k++) {

	for (i=3D0; i<MEMSIZ; i+=3DPAGESIZ) {
		prefetchw((void *)(APage+i));
		__clear_user_page_asm((unsigned long)(APage+i));
	}

	} /* end for k */
	return 0;
}

My 1st pb is the table size:
I can use the max size of 4Mb but as soon as I try 8Mb the prgm segfault;=

what did I missed again?

(temporaely I loop 8* the cleanup of a 4Mb char table ;-)

That said I also used the following clup4.c:
#ifndef __LP64__
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#endif

#define LP64	1 

inline void __clear_user_page_asm(unsigned long vaddr)
{

asm volatile ("ldi	64,%%r1\n"
#ifdef LP64
"1:	std	%%r0,0(%0)\n"		
"	std	%%r0,8(%0)\n"		
"	std	%%r0,16(%0)\n"	
"	std	%%r0,24(%0)\n"
"	std	%%r0,32(%0)\n"
"	std	%%r0,40(%0)\n"
"	std	%%r0,48(%0)\n"	
"	std	%%r0,56(%0)\n"
#else
"1:	stw	%%r0,0(%0)\n"
"	stw	%%r0,4(%0)\n"
"	stw	%%r0,8(%0)\n"
"	stw	%%r0,12(%0)\n"
"	stw	%%r0,16(%0)\n"
"	stw	%%r0,20(%0)\n"
"	stw	%%r0,24(%0)\n"
"	stw	%%r0,28(%0)\n"
"	stw	%%r0,32(%0)\n"
"	stw	%%r0,36(%0)\n"	
"	stw	%%r0,40(%0)\n"
"	stw	%%r0,44(%0)\n"
"	stw	%%r0,48(%0)\n"	
"	stw	%%r0,52(%0)\n"
"	stw	%%r0,56(%0)\n"
"	stw	%%r0,60(%0)\n"
#endif
"	addib,>  -1,%%r1,1b\n"
"	ldo	64(%0),%0"
	:		
	: "r"(vaddr) );
}

#define PAGESIZ 4*1024
#define MEMSIZ  1*PAGESIZ*1024  /* i.e. 4Mb */

int main(int argc, char * * argv, char * * env)
{
	char APage[MEMSIZ];
	unsigned int i, j, k;

	for (k=3D0; k<8; k++) {

	for (i=3D0; i<MEMSIZ; i+=3DPAGESIZ) {
		__clear_user_page_asm((unsigned long)(APage+i));
	}

	} /* end for k */
	return 0;
}

as ref (the old clup1 with page size changed) and got following results:
time ./clup4; time ./clup5 # pref =3D 128

real	0m0.108s
user	0m0.059s
sys	0m0.047s

real	0m0.108s
user	0m0.057s
sys	0m0.048s

time ./clup4; time ./clup5 # pref =3D 256

real	0m0.108s
user	0m0.058s
sys	0m0.048s

real	0m0.108s
user	0m0.060s
sys	0m0.045s

time ./clup4 ; time ./clup5 # pref =3D512

real	0m0.108s
user	0m0.059s
sys	0m0.047s

real	0m0.108s
user	0m0.056s
sys	0m0.050s

Prefectch doesn't seems to help but not sure I use it as I should?

Thx,
    Joel


-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

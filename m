From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re:[parisc-linux] [PATCH] flush our cache through tmpalias space
Date: Thu, 22 Jun 2006 14:26:58 +0200
Message-ID: <J19H8Y$5FC9EAB4B6B122ADCFD9845E4F88D512@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James.Bottomley" <James.Bottomley@SteelEye.com>
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

Hello James,

> One of the current disadvantages parisc has is that we have to walk the=

> inode mapping list to do a flush_dcache_page(), which means we get
> entangled in locking.  The reason we do this is because a VIPT cache
> can't be flushed without a mapping, so we have to find one to use
> 
> The intent of this patch is to instead flush through the tmpalias space=

> on the correct congruence boundary which would dispense with the need
> for finding a mapping at all.  However, in the current incarnation we
> still walk the mappings to check that all the usermappings are, indeed,=

> on the correct congruence boundary.  Unfortunately, as you'll see if yo=
u
> try it out, not all are ... which is a bit of a problem.
> 
I would so but:
make -f /usr/src/linux-2.6.17-pa3/scripts/Makefile.build obj=3Darch/paris=
c/kernel
  gcc -Wp,-MD,arch/parisc/kernel/.cache.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.0.4/include -D__KERNEL__ -Iinclude -Iinclud=
e2
-I/usr/src/linux-2.6.17-pa3/include -include include/linux/autoconf.h
-I/usr/src/linux-2.6.17-pa3/arch/parisc/kernel -Iarch/parisc/kernel -Wall=

-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-comm=
on
-O2 -fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=3D1.1 -mschedule=3D7200
-Wdeclaration-after-statement -Wno-pointer-sign  -D"KBUILD_STR(s)=3D#s"
-D"KBUILD_BASENAME=3DKBUILD_STR(cache)"  -D"KBUILD_MODNAME=3DKBUILD_STR(c=
ache)" -c
-o arch/parisc/kernel/cache.o /usr/src/linux-2.6.17-pa3/arch/parisc/kerne=
l/cache.c
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c: In function
'flush_dcache_page':
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:305: warning: implic=
it
declaration of function 'flush_dcache_tmpalias_page'
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:307: warning: implic=
it
declaration of function 'flush_icache_tmpalias_page'
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c: At top level:
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:373: warning: confli=
cting
types for 'flush_dcache_tmpalias_page'
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:305: warning: previo=
us
implicit declaration of 'flush_dcache_tmpalias_page' was here
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:387: warning: confli=
cting
types for 'flush_icache_tmpalias_page'
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:307: warning: previo=
us
implicit declaration of 'flush_icache_tmpalias_page' was here
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:400:29: error: macro=

"flush_icache_page" passed 3 arguments, but takes just 2
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:401: error: syntax e=
rror
before '{' token
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:404: error:
'flush_icache_page' undeclared here (not in a function)
/usr/src/linux-2.6.17-pa3/arch/parisc/kernel/cache.c:404: warning: type
defaults to 'int' in declaration of 'flush_icache_page'
make[2]: *** [arch/parisc/kernel/cache.o] Error 1

I suppose that warning could be easily avoid by puting those funxtion
declaration in some header like include/asm-parisc/cacheflush.h:
[snip]
extern void flush_dcache_tmpalias_page(unsigned long vaddr, unsigned long=
 paddr);
extern void flush_icache_tmpalias_page(unsigned long vaddr, unsigned long=
 paddr);

[snip]


> James
> 
> ? arch/parisc/kernel/test.c
> ? arch/parisc/kernel/test.o.nonvolatile
> Index: arch/parisc/kernel/cache.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
> retrieving revision 1.28
> diff -u -r1.28 cache.c
> --- arch/parisc/kernel/cache.c	17 Dec 2005 17:21:16 -0000	1.28
> +++ arch/parisc/kernel/cache.c	1 Jan 2006 17:26:25 -0000
[snip
> +
> +void flush_icache_page(struct vm_area_struct *vma, struct page *page,
> +		       unsigned long vaddr)
> +{
> +	flush_alias_i_page(page_to_pfn(page)<<PAGE_SHIFT, vaddr);
> +}
> +EXPORT_SYMBOL(flush_icache_page);
> +
[snip]

but the actual error came from the fact that this same
include/asm-parisc/cacheflush.h already define a macro of the same name:
[snip]
#define flush_icache_page(vma,page)     do { flush_kernel_dcache_page(pag=
e);
flush_kernel_icache_page(page_address(page)); } while (0)
[snip]

TIA,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

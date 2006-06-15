From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] debian Bug#373761 [Was: new debian libgmp
	(4.2-dfsg-1) break the gcc(-4.1) build]
Date: Thu, 15 Jun 2006 16:00:33 +0200
Message-ID: <J0WMWX$0CDD3FBAD6693243BEDF96FC23872DBE@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: dave <dave@hiauly1.hia.nrc.ca>,
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

This followup to just link this thread to debian br ;-/

Joel 
> > Hello Dave,
> > 
> > I am not any more on debian hppa list for the moment ;-( , so I put i=
nfo here
> > temporarely.
> > 
> > This morning I tried to rebuild my local gcc-4.1 but it failled with =
this
> > failure noticed in config.log:
> > [snip]
> > configure:2316: gnatgcc -o conftest -g -O2    conftest.c  -lmpfr -lgm=
p 1>&5
> > /usr/lib/gcc/hppa-linux-gnu/4.0.4/../../../libmpfr.so: undefined refe=
rence to
> > `__gmp_rand'
> > collect2: ld returned 1 exit status
> > configure: failed program was:
> > #line 2308 "configure"
> > #include "confdefs.h"
> > #include <gmp.h>
> > #include <mpfr.h>
> > int main() {
> > mpfr_t n; mpfr_init(n);
> > ; return 0; }
> > 
> > and also noticed that libgmp??? dpkg was upgraded since previous buil=
d.
> > 
> > Fortunately, I can still grab all src files from previous libgmp rele=
ase
> > (4.1.4-11) and reinstall a rebuild. Now the gcc-4.1 build continue ;-=
)
> > 
> > Any known issue with this new libgmp?
> > 
> mmm, seems to be well known mpfr pr #362837.
> 
> > Thanks,
> 
> Now the problem is that mpfr ftbs for hppa as read in
>
<http://buildd.debian.org/fetch.php?&pkg=3Dmpfr&ver=3D2.2.0.dfsg.1-6&arch=
=3Dhppa&stamp=3D1149775099&file=3Dlog&as=3Draw>
> because of many test failures ;-(
> 
> I tried '-k' make's option but doesn't help to complete the build?
> 
> Also tried to rebuild libs with -O0 (as for m68k), no help.
> 
> And finaly older gcc-4.0 as compiler didn't help more.
> 
> (btw I didn't yet understand why this lib is neceesary to build gcc: i =
just
> want to test it (as well as the 64bit x compiler) against kernel, and g=
libc
> for regression testing ;-?
> 
> Joel
> 
=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

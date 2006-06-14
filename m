From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re:[parisc-linux] new debian libgmp (4.2-dfsg-1) break the gcc(-4.1)
	build
Date: Wed, 14 Jun 2006 17:44:59 +0200
Message-ID: <J0UX2Z$08DAE5F983CF44ED0585264F7784FC15@scarlet.be>
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

> Hello Dave,
> 
> I am not any more on debian hppa list for the moment ;-( , so I put inf=
o here
> temporarely.
> 
> This morning I tried to rebuild my local gcc-4.1 but it failled with th=
is
> failure noticed in config.log:
> [snip]
> configure:2316: gnatgcc -o conftest -g -O2    conftest.c  -lmpfr -lgmp =
1>&5
> /usr/lib/gcc/hppa-linux-gnu/4.0.4/../../../libmpfr.so: undefined refere=
nce to
> `__gmp_rand'
> collect2: ld returned 1 exit status
> configure: failed program was:
> #line 2308 "configure"
> #include "confdefs.h"
> #include <gmp.h>
> #include <mpfr.h>
> int main() {
> mpfr_t n; mpfr_init(n);
> ; return 0; }
> 
> and also noticed that libgmp??? dpkg was upgraded since previous build.=

> 
> Fortunately, I can still grab all src files from previous libgmp releas=
e
> (4.1.4-11) and reinstall a rebuild. Now the gcc-4.1 build continue ;-)
> 
> Any known issue with this new libgmp?
> 
mmm, seems to be well known mpfr pr #362837.

> Thanks,

Now the problem is that mpfr ftbs for hppa as read in
<http://buildd.debian.org/fetch.php?&pkg=3Dmpfr&ver=3D2.2.0.dfsg.1-6&arch=
=3Dhppa&stamp=3D1149775099&file=3Dlog&as=3Draw>
because of many test failures ;-(

I tried '-k' make's option but doesn't help to complete the build?

Also tried to rebuild libs with -O0 (as for m68k), no help.

And finaly older gcc-4.0 as compiler didn't help more.

(btw I didn't yet understand why this lib is neceesary to build gcc: i ju=
st
want to test it (as well as the 64bit x compiler) against kernel, and gli=
bc
for regression testing ;-?

Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devene=
z aujourd'hui Scarlet One grace a un client existant de Scarlet, vous rec=
evez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur ht=
tp://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

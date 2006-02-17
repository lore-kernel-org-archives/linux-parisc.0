From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] glibc-2.3.6 + carlos tls patch?
Date: Fri, 17 Feb 2006 18:31:31 +0100
Message-ID: <IUUE0J$B69F9D49897C3679693F44B0E0CCFFA9@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

Hello pa*,

I am trying to apply latest cvs.p-l.org glibc tls (according to lsdiff
glibc-hppa-tls-2005-04-05.diff Carlos' patch).

In addition to previous mentioned patch (related to gcc-4 pb), I reach to=

rebuild this pkg with more or less success:
make -k check 
# grep Err ../../Logs/glibc-2.3.6-1.3.Check
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/locale=
data/sort-test.out]
Error 1
make[1]: *** [localedata/tests] Error 2
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/t=
est-float.out]
Error 1
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/t=
est-double.out]
Error 1
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/t=
est-idouble.out]
Error 1
make[1]: *** [math/tests] Error 2
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
tst-regex2.out]
Error 1
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
tst-rxspencer.out]
Error 139
make[2]:
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
annexc.out]
Error 1 (ignored)
make[1]: *** [posix/tests] Error 2
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxt=
hreads/tst-attr1.out]
Error 1
make[1]: *** [linuxthreads/tests] Error 2
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst=
-timer.out]
Error 137
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst=
-aio4.out]
Error 1
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst=
-timer4.out]
Error 1
make[1]: *** [rt/tests] Error 2
make[2]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/ts=
t-execstack.out]
Error 1
make[1]: *** [elf/tests] Error 2
make: *** [check] Error 2

(Just still have a tst-regex hanging in infinit loop?)

Unfortunately, it is without tls support, though:
dpkg-buildpackage
[...]
(exec 3>&1; exit `( ( (  cd build-tree/hppa-libc && CC=3D"gcc-4.0"
AUTOCONF=3Dfalse /CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6
/build-tree/glibc-2.3.6/configure --host=3Dhppa-linux-gnu
--build=3D$configure_build --prefix=3D/usr --without-cvs --enable-add-ons=
=3Dlibidn
,"linuxthreads " --without-selinux
--with-headers=3D/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/debian/incl=
ude
--enable-kernel=3D2.2.0
 ) 2>&1 3>&-; echo $? >&4) | tee  -a
/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/log-build-hppa-linux-gnu-lib=
c
>&3) 4>&1`)
[...]
checking size of long double... 8
running configure fragment for sysdeps/hppa/elf
checking for hppa TLS support... no
running configure fragment for libidn/sysdeps/unix
[...]

A look in config.log:
[...]
configure:7460: result: running configure fragment for sysdeps/hppa/elf
configure:7: checking for hppa TLS support
configure:44: gcc-4.0 -c -g -O2 conftest.s 1>&5
conftest.s: Assembler messages:
conftest.s:7: Error: can't resolve `foo' {.tdata section} - `$tls_gdidx$'=

{*UND* section}
conftest.s:8: Error: can't resolve `foo' {.tdata section} - `$tls_gdidx$'=

{*UND* section}
conftest.s:13: Error: can't resolve `foo' {.tdata section} - `$tls_ldidx$=
'
{*UND* section}
conftest.s:15: Error: can't resolve `foo' {.tdata section} - `$tls_ldidx$=
'
{*UND* section}
conftest.s:16: Error: can't resolve `foo' {.tdata section} - `$tls_dtpoff=
$'
{*UND* section}
conftest.s:21: Error: can't resolve `foo' {.tdata section} - `$tls_ieoff$=
'
{*UND* section}
conftest.s:22: Error: can't resolve `foo' {.tdata section} - `$tls_ieoff$=
'
{*UND* section}
conftest.s:27: Error: can't resolve `foo' {.tdata section} - `$tls_leoff$=
'
{*UND* section}
conftest.s:28: Error: can't resolve `foo' {.tdata section} - `$tls_leoff$=
'
{*UND* section}
configure:47: $? =3D 1
configure:55: result: no
configure:7460: result: running configure fragment for libidn/sysdeps/uni=
x

mmm, grab the test and try with gcc-4.1:
[...]
configure:7460: result: running configure fragment for sysdeps/hppa/elf
configure:7: checking for hppa TLS support
configure:44: gcc-4.0 -c -g -O2 conftest.s 1>&5
conftest.s: Assembler messages:
conftest.s:7: Error: can't resolve `foo' {.tdata section} - `$tls_gdidx$'=

{*UND* section}
conftest.s:8: Error: can't resolve `foo' {.tdata section} - `$tls_gdidx$'=

{*UND* section}
conftest.s:13: Error: can't resolve `foo' {.tdata section} - `$tls_ldidx$=
'
{*UND* section}
conftest.s:15: Error: can't resolve `foo' {.tdata section} - `$tls_ldidx$=
'
{*UND* section}
conftest.s:16: Error: can't resolve `foo' {.tdata section} - `$tls_dtpoff=
$'
{*UND* section}
conftest.s:21: Error: can't resolve `foo' {.tdata section} - `$tls_ieoff$=
'
{*UND* section}
conftest.s:22: Error: can't resolve `foo' {.tdata section} - `$tls_ieoff$=
'
{*UND* section}
conftest.s:27: Error: can't resolve `foo' {.tdata section} - `$tls_leoff$=
'
{*UND* section}
conftest.s:28: Error: can't resolve `foo' {.tdata section} - `$tls_leoff$=
'
{*UND* section}
configure:47: $? =3D 1
configure:55: result: no
configure:7460: result: running configure fragment for libidn/sysdeps/uni=
x

Too bad.

Even though, I trusted that gcc and binutil tls stuff was already uptream=
?
Or do I need to rebuild related pkg with some specific option or apply so=
me
patch from somewhere?

TIA for advise,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

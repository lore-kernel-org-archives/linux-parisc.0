From: Guy Martin <gmsoft@tuxicoman.be>
Subject: GCC 4.5 regression
Date: Thu, 17 Feb 2011 20:15:23 +0100
Message-ID: <20110217201523.2da3b41a@zombie>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/ljMs9lDAGTYgROg94kOBU4."
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/ljMs9lDAGTYgROg94kOBU4.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi all,


I've spotted this regression while testing gcc 4.5.2.
It hangs while doing one of the configure test of diffutils.

I've attached a reduced test case. The program is supposed to
segfault because of a stack overflow. However, with 4.5, it just hangs.
It seems that 4.5 simply over-optimize the function and replaces it
with a single jump.

Should I open a PR ?
Do you need other info ?

Here is how gcc is configured :

terminator test # gcc-4.4.5 -v
Using built-in specs.
Target: hppa2.0-unknown-linux-gnu
Configured
with: /var/tmp/portage/sys-devel/gcc-4.4.5/work/gcc-4.4.5/configure
--prefix=/usr --bindir=/usr/hppa2.0-unknown-linux-gnu/gcc-bin/4.4.5
--includedir=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.4.5/include
--datadir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/4.4.5
--mandir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/4.4.5/man
--infodir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/4.4.5/info
--with-gxx-include-dir=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.4.5/include/g++-v4
--host=hppa2.0-unknown-linux-gnu --build=hppa2.0-unknown-linux-gnu
--disable-altivec --disable-fixed-point --without-ppl --without-cloog
--enable-nls --without-included-gettext --with-system-zlib
--disable-werror --enable-secureplt --disable-multilib
--enable-libmudflap --disable-libssp --enable-libgomp --enable-cld
--with-python-dir=/share/gcc-data/hppa2.0-unknown-linux-gnu/4.4.5/python
--enable-checking=release --disable-libgcj
--enable-languages=c,c++,fortran --enable-shared --enable-threads=posix
--enable-__cxa_atexit --enable-clocale=gnu
--with-bugurl=http://bugs.gentoo.org/ --with-pkgversion='Gentoo 4.4.5
p1.2, pie-0.4.5' Thread model: posix gcc version 4.4.5 (Gentoo 4.4.5
p1.2, pie-0.4.5) 


terminator test # gcc-4.5.2 -v
Using built-in specs.
COLLECT_GCC=gcc-4.5.2
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/hppa2.0-unknown-linux-gnu/4.5.2/lto-wrapper
Target: hppa2.0-unknown-linux-gnu
Configured
with: /var/tmp/portage/sys-devel/gcc-4.5.2/work/gcc-4.5.2/configure
--prefix=/usr --bindir=/usr/hppa2.0-unknown-linux-gnu/gcc-bin/4.5.2
--includedir=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.2/include
--datadir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/4.5.2
--mandir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/4.5.2/man
--infodir=/usr/share/gcc-data/hppa2.0-unknown-linux-gnu/4.5.2/info
--with-gxx-include-dir=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.2/include/g++-v4
--host=hppa2.0-unknown-linux-gnu --build=hppa2.0-unknown-linux-gnu
--disable-altivec --disable-fixed-point --without-ppl --without-cloog
--disable-lto --enable-nls --without-included-gettext
--with-system-zlib --disable-werror --enable-secureplt
--disable-multilib --enable-libmudflap --disable-libssp
--enable-libgomp --enable-cld
--with-python-dir=/share/gcc-data/hppa2.0-unknown-linux-gnu/4.5.2/python
--enable-checking=release --disable-libgcj
--enable-languages=c,c++,fortran --enable-shared --enable-threads=posix
--enable-__cxa_atexit --enable-clocale=gnu
--with-bugurl=http://bugs.gentoo.org/ --with-pkgversion='Gentoo 4.5.2
p1.0, pie-0.4.5' Thread model: posix gcc version 4.5.2 (Gentoo 4.5.2
p1.0, pie-0.4.5) 




Cheers,
  Guy
--MP_/ljMs9lDAGTYgROg94kOBU4.
Content-Type: text/x-c++src
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=conftest.c

#include <unistd.h>

static int recurse (char *a)
 {
   char tmp[500];
   *tmp = *a + 1;
   return recurse(tmp);
 }

int main (void) {
   return recurse ("\1");
}


--MP_/ljMs9lDAGTYgROg94kOBU4.
Content-Type: application/octet-stream; name=conftest-4.5.s
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=conftest-4.5.s

CS5MRVZFTCAxLjEKCS50ZXh0CgkuYWxpZ24gNAoJLnR5cGUJcmVjdXJzZS5jbG9uZS4wLCBAZnVu
Y3Rpb24KcmVjdXJzZS5jbG9uZS4wOgoJLlBST0MKCS5DQUxMSU5GTyBGUkFNRT0wLE5PX0NBTExT
CgkuRU5UUlkKLkwyOgoJYixuIC5MMgoJLkVYSVQKCS5QUk9DRU5ECgkuc2l6ZQlyZWN1cnNlLmNs
b25lLjAsIC4tcmVjdXJzZS5jbG9uZS4wCgkuYWxpZ24gNAouZ2xvYmwgbWFpbgoJLnR5cGUJbWFp
biwgQGZ1bmN0aW9uCm1haW46CgkuUFJPQwoJLkNBTExJTkZPIEZSQU1FPTAsTk9fQ0FMTFMsU0FW
RV9SUAoJLkVOVFJZCglzdHcgJXIyLC0yMCglcjMwKQoJbGRpIDEsJXIyNgoJbGR3IC0yMCglcjMw
KSwlcjIKCWJsIHJlY3Vyc2UuY2xvbmUuMCwlcjAKCW5vcAoJbm9wCgkuRVhJVAoJLlBST0NFTkQK
CS5zaXplCW1haW4sIC4tbWFpbgoJLmlkZW50CSJHQ0M6IChHZW50b28gNC41LjIgcDEuMCwgcGll
LTAuNC41KSA0LjUuMiIK

--MP_/ljMs9lDAGTYgROg94kOBU4.
Content-Type: application/octet-stream; name=conftest-4.4.s
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=conftest-4.4.s

CS5MRVZFTCAxLjEKCS50ZXh0CgkuYWxpZ24gNAoJLnR5cGUJcmVjdXJzZSwgQGZ1bmN0aW9uCnJl
Y3Vyc2U6CgkuUFJPQwoJLkNBTExJTkZPIEZSQU1FPTU3NixDQUxMUyxTQVZFX1JQCgkuRU5UUlkK
CXN0dyAlcjIsLTIwKCVyMzApCglsZGIgMCglcjI2KSwlcjI4CglsZG8gMSglcjI4KSwlcjI4Cgls
ZG8gNTc2KCVyMzApLCVyMzAKCXN0YiAlcjI4LC01NjgoJXIzMCkKCWJsIHJlY3Vyc2UsJXIyCgls
ZG8gLTU2OCglcjMwKSwlcjI2CglsZHcgLTU5NiglcjMwKSwlcjIKCWJ2ICVyMCglcjIpCglsZG8g
LTU3NiglcjMwKSwlcjMwCgkuRVhJVAoJLlBST0NFTkQKCS5zaXplCXJlY3Vyc2UsIC4tcmVjdXJz
ZQoJLnNlY3Rpb24JLnJvZGF0YS5zdHIxLjQsImFNUyIsQHByb2diaXRzLDEKCS5hbGlnbiA0Ci5M
QzA6Cgkuc3RyaW5negkiXDAwMSIKCS50ZXh0CgkuYWxpZ24gNAouZ2xvYmwgbWFpbgoJLnR5cGUJ
bWFpbiwgQGZ1bmN0aW9uCm1haW46CgkuUFJPQwoJLkNBTExJTkZPIEZSQU1FPTAsTk9fQ0FMTFMs
U0FWRV9SUAoJLkVOVFJZCglzdHcgJXIyLC0yMCglcjMwKQoJbGRpbCBMUicuTEMwLCVyMjYKCWxk
dyAtMjAoJXIzMCksJXIyCglsZG8gUlInLkxDMCglcjI2KSwlcjI2CglibCByZWN1cnNlLCVyMAoJ
bm9wCglub3AKCS5FWElUCgkuUFJPQ0VORAoJLnNpemUJbWFpbiwgLi1tYWluCgkuaWRlbnQJIkdD
QzogKEdlbnRvbyA0LjQuNSBwMS4yLCBwaWUtMC40LjUpIDQuNC41Igo=

--MP_/ljMs9lDAGTYgROg94kOBU4.--

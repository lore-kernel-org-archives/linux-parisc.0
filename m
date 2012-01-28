From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: c3700 boot failure (protection ID trap)
Date: Sat, 28 Jan 2012 15:41:49 -0700
Message-ID: <CAErSpo6P6RMf69mJFkqWkVK4gJN9KqynrOh2bgdNRXzWiyY8ig@mail.gmail.com>
References: <CAErSpo7ko3Tdkf9Y4jiKCQTgCpcooWnHKJtqXDVpJje3nEXgdw@mail.gmail.com>
 <3542913.WWkx2jpWZr@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3542913.WWkx2jpWZr@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jan 28, 2012 at 9:56 AM, Rolf Eike Beer <eike-kernel@sf-tec.de>=
 wrote:
> Bjorn Helgaas wrote:
>> I'm trying to test some PCI changes on a c3700, but recent kernels
>> don't seem to work at all. =A074ea15d909b311 (current upstream) and =
v3.2
>> both fail as shown below. =A0I'm using c3000_defconfig (attached for
>> 74ea15d909b311). =A0Should I expect this to work?
>
> I don't know about 3.3x, but my C3600 runs using 3.2.1. Which binutil=
s did you
> use for building? IIRC there is a bunch of bugs in different versions=
=2E

This is a Debian 5.0 box:

c3700:~# gcc -v
Using built-in specs.
Target: hppa-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian
4.3.2-1.1' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.3/README.Bugs
--enable-languages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr
--enable-shared --with-system-zlib --libexecdir=3D/usr/lib
--without-included-gettext --enable-threads=3Dposix --enable-nls
--with-gxx-include-dir=3D/usr/include/c++/4.3 --program-suffix=3D-4.3
--enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-objc-gc
--enable-mpfr --disable-libssp --enable-checking=3Drelease
--build=3Dhppa-linux-gnu --host=3Dhppa-linux-gnu --target=3Dhppa-linux-=
gnu
Thread model: posix
gcc version 4.3.2 (Debian 4.3.2-1.1)
c3700:~# ld -v
GNU ld (GNU Binutils for Debian) 2.18.0.20080103
c3700:~# as -v
GNU assembler version 2.18.0 (hppa-linux-gnu) using BFD version (GNU
Binutils for Debian) 2.18.0.20080103
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

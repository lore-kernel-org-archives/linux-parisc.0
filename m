From: John David Anglin <dave.anglin@bell.net>
Subject: Re: c3700 boot failure (protection ID trap)
Date: Sun, 26 Feb 2012 20:55:11 -0500
Message-ID: <BLU0-SMTP872300A353072DFECC098997690@phx.gbl>
References: <CAErSpo7ko3Tdkf9Y4jiKCQTgCpcooWnHKJtqXDVpJje3nEXgdw@mail.gmail.com> <3542913.WWkx2jpWZr@donald.sf-tec.de> <CAErSpo6P6RMf69mJFkqWkVK4gJN9KqynrOh2bgdNRXzWiyY8ig@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAErSpo6P6RMf69mJFkqWkVK4gJN9KqynrOh2bgdNRXzWiyY8ig@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 28-Jan-12, at 5:41 PM, Bjorn Helgaas wrote:

> On Sat, Jan 28, 2012 at 9:56 AM, Rolf Eike Beer <eike-kernel@sf- 
> tec.de> wrote:
>> Bjorn Helgaas wrote:
>>> I'm trying to test some PCI changes on a c3700, but recent kernels
>>> don't seem to work at all.  74ea15d909b311 (current upstream) and  
>>> v3.2
>>> both fail as shown below.  I'm using c3000_defconfig (attached for
>>> 74ea15d909b311).  Should I expect this to work?
>>
>> I don't know about 3.3x, but my C3600 runs using 3.2.1. Which  
>> binutils did you
>> use for building? IIRC there is a bunch of bugs in different  
>> versions.
>
> This is a Debian 5.0 box:
>
> c3700:~# gcc -v
> Using built-in specs.
> Target: hppa-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion='Debian
> 4.3.2-1.1' --with-bugurl=file:///usr/share/doc/gcc-4.3/README.Bugs
> --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr
> --enable-shared --with-system-zlib --libexecdir=/usr/lib
> --without-included-gettext --enable-threads=posix --enable-nls
> --with-gxx-include-dir=/usr/include/c++/4.3 --program-suffix=-4.3
> --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc
> --enable-mpfr --disable-libssp --enable-checking=release
> --build=hppa-linux-gnu --host=hppa-linux-gnu --target=hppa-linux-gnu
> Thread model: posix
> gcc version 4.3.2 (Debian 4.3.2-1.1)
> c3700:~# ld -v
> GNU ld (GNU Binutils for Debian) 2.18.0.20080103
> c3700:~# as -v
> GNU assembler version 2.18.0 (hppa-linux-gnu) using BFD version (GNU
> Binutils for Debian) 2.18.0.20080103


I would say you should update both binutils and GCC.  The binutils  
fixes are
less critical but they do fix the unwind support.  There are many GCC  
fixes
since 4.3.2.  The delay slot handling in the 4.3 branch is somewhat  
broken.

You probably won't be able to build either binutils or GCC from Debian
unstable sources due to the dependency requirements.  I would suggest  
using
the current binutils and GCC sources directly.  GCC 4.6.2 is pretty  
solid as
far as I can tell.

Dave
--
John David Anglin	dave.anglin@bell.net




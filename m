From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Reproducible kernel panic using gdb
Date: Thu, 31 Oct 2013 15:35:26 +0100
Message-ID: <75c041887735b2ec9338d8ee6f340a1c@tuxicoman.be>
References: <b6f8076c32d0859e4ddb328bb7aca076@tuxicoman.be>
 <trinity-f177b623-5ca9-4417-a689-b0f8676e3fb5-1382711499524@3capp-gmx-bs08>
 <650fc503e24cdb24b5cc286aec329df6@tuxicoman.be>
 <1382970655.2161.2.camel@dabdike.int.hansenpartnership.com>
 <2125d8be63f7f5801abba4e67182d2e7@sf-mail.de>
 <1383023163.19537.3.camel@dabdike.int.hansenpartnership.com>
 <52701C9D.7080906@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52701C9D.7080906@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2013-10-29 21:37, Helge Deller wrote:
> On 10/29/2013 06:06 AM, James Bottomley wrote:
>> 
>> On Mon, 2013-10-28 at 16:08 +0100, Rolf Eike Beer wrote:
>>> James Bottomley: wrote
>>>> On Mon, 2013-10-28 at 10:00 +0100, Guy Martin wrote:
>>>>> Hi Helge,
>>>>> 
>>>>>> 
>>>>>> Works without crash for me on 3.12-rc6 ?
>>>>>> Linux ls3011 3.12.0-rc6-64bit+
>>>>>> 
>>>>>> Since you run 3.10.6, maybe updating the kernel might help.
>>>>>> Esp. this patch, which has been backported to kernel 3.10 (and is 
>>>>>> in
>>>>>> 3.10.17):
>>>>>> http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?h=linux-3.10.y&id=77587e89405f5d8225a0e750df254bcc2dcb73e1
>>>>> 
>>>>> Still the same problem with 3.12-rc6 here :
>>>> 
>>>> What system and CPU?
>>> 
>>> C8000
>> 
>> I tried this on a rp3440  (pa8800) and I can't reproduce.  I think it
>> might be something about the way the kernel is compiled.  The (null)
>> values for rp2 and IOAQ[0] look suspicious.
> 
> I tried it again, but this time on my c8000..
> Again, it does not crash for me.
> Kernel is 3.12.0-rc7-64bit.
> 
> I think James is right. Might be something with your compiler, but it 
> would
> be interesting what it is...


I've tried both
gcc-4.6.3 with ld 2.22
gcc-4.7.3 with ld 2.23.1

I've put a compiled kernel with modules here as well as the config :
http://www.tuxicoman.be/temp/linux-3.12-rc6-gdb-crash.tar.bz2

terminator linux-3.12-rc6 # hppa64-unknown-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=/usr/hppa2.0-unknown-linux-gnu/hppa64-unknown-linux-gnu/gcc-bin/4.7.3/hppa64-unknown-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/hppa64-unknown-linux-gnu/4.7.3/lto-wrapper
Target: hppa64-unknown-linux-gnu
Configured with: 
/var/tmp/portage/sys-devel/kgcc64-4.7.3/work/gcc-4.7.3/configure 
--prefix=/usr 
--bindir=/usr/hppa2.0-unknown-linux-gnu/hppa64-unknown-linux-gnu/gcc-bin/4.7.3 
--includedir=/usr/lib/gcc/hppa64-unknown-linux-gnu/4.7.3/include 
--datadir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/4.7.3 
--mandir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/4.7.3/man 
--infodir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/4.7.3/info 
--with-gxx-include-dir=/usr/lib/gcc/hppa64-unknown-linux-gnu/4.7.3/include/g++-v4 
--host=hppa2.0-unknown-linux-gnu --target=hppa64-unknown-linux-gnu 
--build=hppa2.0-unknown-linux-gnu --disable-altivec 
--disable-fixed-point --without-cloog --without-ppl --disable-lto 
--enable-nls --without-included-gettext --with-system-zlib 
--enable-obsolete --disable-werror --enable-secureplt --disable-multilib 
--disable-libmudflap --disable-libssp --disable-libgomp 
--with-python-dir=/share/gcc-data/hppa64-unknown-linux-gnu/4.7.3/python 
--enable-poison-system-directories --enable-checking=release 
--disable-libgcj --disable-build-with-cxx 
--disable-build-poststage1-with-cxx --disable-libquadmath 
--enable-languages=c --disable-shared --disable-threads 
--without-headers --disable-bootstrap --enable-__cxa_atexit 
--enable-clocale=gnu --with-bugurl=http://bugs.gentoo.org/ 
--with-pkgversion='Gentoo 4.7.3 p1.3'
Thread model: single
gcc version 4.7.3 (Gentoo 4.7.3 p1.3)

Regards,
   Guy


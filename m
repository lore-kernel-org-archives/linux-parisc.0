From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] parisc: kernel: about section mismatch warning.
Date: Tue, 30 Jul 2013 08:48:25 +0800
Message-ID: <51F70D59.7060309@asianux.com>
References: <51EF8C52.50403@asianux.com> <51EF8FED.9090903@asianux.com> <1374675095.4634.6.camel@dabdike> <51F06A31.9090408@gmail.com> <51F62C8E.6080003@asianux.com> <BLU0-SMTP611AEF17EB77D8F3C171E397550@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP611AEF17EB77D8F3C171E397550@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/29/2013 09:47 PM, John David Anglin wrote:
> On 29-Jul-13, at 4:49 AM, Chen Gang wrote:
> 
>> After use own built cross compiler (gcc-4.9.0, binutils-2.23.2 with
>> 'hppa64-gchen-linux'), no the related warnings any more.
>>
>> The original compiler which I used ('hppa64-linux-gnu') is incorrect.
> 
> I haven't seen the warning with any recent compiler and possibly your
> compiler
> selection versus CONFIG_64BIT was wrong.  What does 'hppa64-linux-gnu -v'
> show?
> 

The incorrect compiler's information.

[root@dhcp122 linux-next]# rpm -qf /usr/bin/hppa64-linux-gnu-gcc
gcc-hppa64-linux-gnu-4.7.1-0.1.20120606.fc17.x86_64
[root@dhcp122 linux-next]# hppa64-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=hppa64-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/hppa64-linux-gnu/4.7.1/lto-wrapper
Target: hppa64-linux-gnu
Configured with: ../gcc-4.7.1-RC-20120606/configure --disable-dependency-tracking --disable-silent-rules --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu --target=hppa64-linux-gnu --enable-targets=all --program-prefix=hppa64-linux-gnu- --enable-languages=c --without-headers --enable-sjlj-exceptions --with-system-libunwind --disable-nls --disable-threads --disable-shared --disable-libmudflap --disable-libssp --disable-libgomp --disable-libquadmath --disable-gold --disable-decimal-float --enable-checking= --enable-gnu-uniqu
 e-object --enable-linker-build-id --disable-plugin --enable-nls --with-system-zlib --with-bugurl=http://bugzilla.redhat.com/bugzilla/ --enable-obsolete
Thread model: single
gcc version 4.7.1 20120606 (Red Hat 4.7.1-0.1.20120606) (GCC) 


> gcc-4.9.0 is not released and any particular snapshot may be buggy. 
> Suggest using
> 4.8 branch.
> 

gcc-4.9.0 with binutil-2.23.2 for 'hppa64-linux' is correct for parisc
with 'CONFIG_64BIT' enabled.

I intend to use gcc-4.9.0, (I want to find more issues not only for
kernel, but also for gcc, so I can have more chances to provide my
contributions for both of them)

;-)

> Dave
> -- 
> John David Anglin    dave.anglin@bell.net
> 
> 
> 
> 
> 

Thanks.
-- 
Chen Gang

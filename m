From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Sun, 02 Mar 2014 22:22:54 +0100
Message-ID: <5313A12E.7010307@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl> <201312191619.05005.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201312191619.05005.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Mike,

On 12/19/2013 10:19 PM, Mike Frysinger wrote:
> On Thursday 19 December 2013 14:44:40 John David Anglin wrote:
>> On 12/19/2013 2:17 PM, Aaro Koskinen wrote:
>>> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
>>> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
>>>
>>> $ localedef -c -i en_US -f UTF-8 en_US.UTF-8
>>> cannot map archive header: Invalid argument
>>>
>>> strace looks like this:
>>>
>>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
>>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3,
>>> 0) = -1 EINVAL (Invalid argument)
>>>
>>> With the patch reverted, it works:
>>>
>>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42d74000
>>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3,
>>> 0) = 0x43000000
>>>
>>> BTW, note that for GLIBC 2.18 some changes were done regarding this:
>>> https://sourceware.org/bugzilla/show_bug.cgi?id=10283
>>
>> Are you sure the glibc changes are correct?  PARISC addresses are not
>> strictly aligned to SHMLBA.
>> There's also a page offset and "random" offset derived from the kernel
>> address of the mapping struct.
> 
> the glibc changes were to use SHMLBA as the min alignment where as before it 
> was using PAGE_SIZE.  the kernel shouldn't reject us because we manually 
> increased our alignment ... the mappings should still be overlapping, so it 
> shouldn't be an "out of mapping space" issue.
> 
> the first one gets a really large map (not fixed), and then the second does a 
> small mapping inside of that first one.

This doesn't work for parisc.
We currently face this issue again now with eglibc on debian since we updated it.

Regarding this commit:
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/generic/libc-mmap.h;h=0ddd20d42ab44282180c6d6f7c13f2875b25a614;hb=17db6e8d6b12f55e312fcab46faf5d332c806fb6

a trivial workaround would be to change libc-mmap.h like this:
#ifdef __hppa__
#define MAP_FIXED_ALIGNMENT 4096
#else
#define MAP_FIXED_ALIGNMENT SHMLBA
#endif

That works because then the new aligned address is then the same as the original
(the mmap call returns 4k aligned addresses, so it stays unchanged), but I'm not sure
if such a patch would be acceptable.
Do you have another idea/proposal?

Helge
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTE6EuAAoJEKGDlV8wpRJBn1sP/2rgG74cYxazzfljoAR6Ymdc
lwgbJqKthEMpNyaFKqxEJrcgwdhBLabVPOe9NDXyS7GpFp+0NPi+EbFCdVRNEO6c
3oWV4XkiZBm2ebOI90J5YiKZN0GwrsLE9lEJD/db7JYSFdV34SbAsKOMth8vgL9K
unVtsU1fGNFOrPuND7+tclxuClsD/0zZqYpW5V6l3/Iox3rrjceSemxw5ZnlN7Eq
CnLBAw0UBbZYVYPiy1hYzFndrAdOGt5SDatM7WTHZ0AiaqZfyKpGE7/qwImjCJt0
KL9BXYcEoT+neAAdxR0hlHaSokdinh3TdutfTnDFpvM2Qpxjdwbw0YnHVj7XtIfe
EjxnFchNFW/alpzNvCMyRF/ThTcSkZ41fysOkkAPCbYameyoVhTHJEnfKIUEXrQH
/WwrcZ7THas5eauJKhN+mqNpDjoTDbFUWhAGC/Y1TMtXxj3VjGg2NP/YMNJ6KLjc
OPoF6hbm+YmJt2TbtFsZEWs0cnKse0QHCwQYrtm9289jvhTLhcTI7PdTGeavR8Lu
dj4L3ne48zXlUPjMuuOzaZC/40ePNDUhXaN+K6bgk3cbcJZlvP/b/HuNFYBC5T3k
xOgpgyoB19RksHqhliXpGhW5Xc/zuDWHtkxBkGgKKKZZ7VKpOoCrp5mMg3d8JQKG
+PzVCBVCGlF/gUT1Tsvv
=9r8c
-----END PGP SIGNATURE-----

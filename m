From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Tue, 01 Apr 2014 20:49:59 +0200
Message-ID: <533B0A57.2060700@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl> <201312191619.05005.vapier@gentoo.org> <5313A12E.7010307@gmx.de> <20140401182627.GA3285@drone.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier@gentoo.org>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140401182627.GA3285@drone.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/01/2014 08:26 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Sun, Mar 02, 2014 at 10:22:54PM +0100, Helge Deller wrote:
>> On 12/19/2013 10:19 PM, Mike Frysinger wrote:
>>> On Thursday 19 December 2013 14:44:40 John David Anglin wrote:
>>>> On 12/19/2013 2:17 PM, Aaro Koskinen wrote:
>>>>> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
>>>>> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
>>>>>
>>>>> $ localedef -c -i en_US -f UTF-8 en_US.UTF-8
>>>>> cannot map archive header: Invalid argument
>>>>>
>>>>> strace looks like this:
>>>>>
>>>>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
>>>>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3,
>>>>> 0) = -1 EINVAL (Invalid argument)
>>>>>
>>>>> With the patch reverted, it works:
>>>>>
>>>>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42d74000
>>>>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3,
>>>>> 0) = 0x43000000
>>>>>
>>>>> BTW, note that for GLIBC 2.18 some changes were done regarding this:
>>>>> https://sourceware.org/bugzilla/show_bug.cgi?id=10283
>>>>
>>>> Are you sure the glibc changes are correct?  PARISC addresses are not
>>>> strictly aligned to SHMLBA.
>>>> There's also a page offset and "random" offset derived from the kernel
>>>> address of the mapping struct.
>>>
>>> the glibc changes were to use SHMLBA as the min alignment where as before it 
>>> was using PAGE_SIZE.  the kernel shouldn't reject us because we manually 
>>> increased our alignment ... the mappings should still be overlapping, so it 
>>> shouldn't be an "out of mapping space" issue.
>>>
>>> the first one gets a really large map (not fixed), and then the second does a 
>>> small mapping inside of that first one.
>>
>> This doesn't work for parisc.
>> We currently face this issue again now with eglibc on debian since we updated
>> it.
> 
> FWIW, this bug is still present with mainline Linux 3.14 + GLIBC 2.19.

Yes.
But it's not a kernel bug. Kernel 3.14 and previous stable releases are OK.

I did proposed a glibc change in my previous mail (http://www.spinics.net/lists/linux-parisc/msg05384.html).
Debian bug report with patch is here:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=741243

And this is what I proposed:

A trivial FIX/workaround would be to change libc-mmap.h like this:
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

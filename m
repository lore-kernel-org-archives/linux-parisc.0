From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 19 Dec 2013 17:38:37 -0500
Message-ID: <BLU0-SMTP458FC9FB0E8F5D98CB7B8897C50@phx.gbl>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl> <201312191619.05005.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201312191619.05005.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/19/2013 4:19 PM, Mike Frysinger wrote:
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
>> Are you sure the glibc changes are correct?  PARISC addresses are not
>> strictly aligned to SHMLBA.
>> There's also a page offset and "random" offset derived from the kernel
>> address of the mapping struct.
> the glibc changes were to use SHMLBA as the min alignment where as before it
> was using PAGE_SIZE.  the kernel shouldn't reject us because we manually
> increased our alignment ... the mappings should still be overlapping, so it
> shouldn't be an "out of mapping space" issue.
>
> the first one gets a really large map (not fixed), and then the second does a
> small mapping inside of that first one.
> -mike
The mmap check is here:

         if (flags & MAP_FIXED) {
                 if ((flags & MAP_SHARED) &&
                     (addr - shared_align_offset(filp, pgoff)) & (SHMLBA 
- 1))
                         return -EINVAL;
                 return addr;
         }

In the case at hand, the addr value passed is not equivalent to the value
returned on first mmap2 call.  So, the error is correct.  The 
application has to
preserve the "SHMLBA - 1" part of the address when selecting a new map 
address.

The error is EINVAL (i.e., bad address).

The old code wouldn't have returned an error but the second mapping 
would not
have been equivalent to the first.

My head spins regarding mappings inside mappings as it seems they may 
conflict.

Dave

-- 
John David Anglin    dave.anglin@bell.net


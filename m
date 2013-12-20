From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Fri, 20 Dec 2013 23:10:03 +0100
Message-ID: <52B4C03B.2000805@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <201312191619.05005.vapier@gentoo.org> <BLU0-SMTP458FC9FB0E8F5D98CB7B8897C50@phx.gbl> <201312191802.39169.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>,
	John David Anglin <dave.anglin@bell.net>, carlos@redhat.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201312191802.39169.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

On 12/20/2013 12:02 AM, Mike Frysinger wrote:
> On Thursday 19 December 2013 17:38:37 John David Anglin wrote:
>> On 12/19/2013 4:19 PM, Mike Frysinger wrote:
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
>>>>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL (Invalid argument)
>>>>>
>>>>> With the patch reverted, it works:
>>>>>
>>>>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42d74000
>>>>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = 0x43000000
>>>>>
>>>>> BTW, note that for GLIBC 2.18 some changes were done regarding this:
>>>>> https://sourceware.org/bugzilla/show_bug.cgi?id=10283
>>>>
>>>> Are you sure the glibc changes are correct?  PARISC addresses are not
>>>> strictly aligned to SHMLBA.
>>>> There's also a page offset and "random" offset derived from the kernel
>>>> address of the mapping struct.

Yes, that's the important part: The "random" offset stays constant for each file (mapping)!

>>> the glibc changes were to use SHMLBA as the min alignment where as before
>>> it was using PAGE_SIZE.  the kernel shouldn't reject us because we
>>> manually increased our alignment ... the mappings should still be
>>> overlapping, so it shouldn't be an "out of mapping space" issue.
>>>
>>> the first one gets a really large map (not fixed), and then the second
>>> does a small mapping inside of that first one.
>>
>> The mmap check is here:
>>
>>          if (flags & MAP_FIXED) {
>>                  if ((flags & MAP_SHARED) &&
>>                      (addr - shared_align_offset(filp, pgoff)) & (SHMLBA
>> - 1))
>>                          return -EINVAL;
>>                  return addr;
>>          }
>>
>> In the case at hand, the addr value passed is not equivalent to the value
>> returned on first mmap2 call.  So, the error is correct.  The
>> application has to
>> preserve the "SHMLBA - 1" part of the address when selecting a new map
>> address.
>>
>> The error is EINVAL (i.e., bad address).
>>
>> The old code wouldn't have returned an error but the second mapping
>> would not
>> have been equivalent to the first.
>>
>> My head spins regarding mappings inside mappings as it seems they may
>> conflict.
> 
> we designed the new locale code to work on all systems (including fixing the 
> behavior on older parisc64 kernels).  the assumption is that, if we want to do 
> overlapping mappings, 

What you understand with "overlapping mappings" ?
Overlapping mappings for parisc means, that the bytes inside the file needs to be mapped at
exactly the same addresses (modulo SHMLBA). 

With the example above, it means for parisc:
mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
- -> OK.

mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL
- -> This is strange.
Now you map the "beginning of the file" (offset=0) at *another* address (modulo SHMLBA) than what the
first mmap gave you. I agree that 0x43000000 is "inside" the memory range which you originally mapped
with the large mapping, but that's not relevant for parisc at all.

Instead this should work:
mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42f34000
some_address = x * SHMLBA; /* some multiple of SHMLBA, e.g. 0x43000000 */
file_offset = some_address - 0x42f34000;
mmap2(some_address, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, file_offset) = -1 EINVAL

Not sure if this is what you wanted.
Anyway, it looks like we need to change glibc for that...

> we need to use SHMLBA as the min alignment (since that's 
> what the define represents -- shared mapping alignments that the hardware is 
> restricted by).  and that is what the new locale code is doing.  glibc defines 
> SHMLBA to 0x00400000 for parisc which is why 0x42d74000 turned into 
> 0x43000000.

Sounds like logically correct behavior.

> so either SHMLBA on parisc is wrong, or the new kernel code is wrong

SHMLBA on parisc is correct.
The new kernel code is correct too, and the old one was definitively wrong.

You could try my current rewrite for the mmap functions which is in my "aio_mmap_fix" branch at
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
(http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=aio_mmap_fix)
Pulling this branch on top of Linux head should work.
But I think it will not solve this problem.

Helge

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJStMA7AAoJEKGDlV8wpRJBwugP/j7e6z+kS6bymrpuxYEBpE/n
c+yzgxjcaVwDL+KMln9cP2Zx6UAnTwYIXv8bmOmUA65FB9ttaqP73t/l8wIgjXai
BGC/951hPgyfI2Kxkvy1R32dsbBVNyIRNQfp/MADRS8xC059nlTIXib9NduaiKLg
Gp6YA2S6d24EdKooVfVRPh5c6sThePgvjQ6kmytxxOh8uOIdwLG2ZXGs4KC/e07B
1VFTH10ecijTUnqzl8awkw2OqO3VzllGJ2kCwZo2Zynpd58FUOu1UQSWWTsk4F08
owU8HfrEGVSSc7urrsIs2na8eXJ/jq44ksmfkDtGmKt4Ati7ShT6dMZuFgXRcluY
E6PaPrTMLW9nASBSv0FDfcR+BT1Ffghl0yEZ3rmYpnH+ExcotFWfyb/an/93AM2l
vPgHy0+SFMYxgsV0rNDU+qJajf/2Cpwz3At/iQDQRFjWaL7zyu8RNJ7BMc1Dml7Y
HodYc4bpP4ucM/RIGMTnJdw35mwQdhnfXOyCFJoUR5gPxCVKso+4cz32H+yK2rdp
2MpBke0j7AHbI/AWvrqsocqVuLKt6BSMos/yFTqbvFmoBqaAVIWP0dulxsl40Otu
y5LFh36mwcVcJftJ/2Dftlw+bSYEVeZbA2l+XU99Drgaod9ifHbt13FRdkRTR2um
q1m48iZVn0YPGEXcFO81
=ObSL
-----END PGP SIGNATURE-----

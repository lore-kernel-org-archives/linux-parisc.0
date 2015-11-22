From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 3/9] parisc: Fix asm/mman.h regarding MAP_HUGETLB and
 MADV_XX flags
Date: Sun, 22 Nov 2015 12:10:52 +0100
Message-ID: <5651A2BC.4040409@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
 <1448055522-11594-4-git-send-email-deller@gmx.de>
 <1448139427.17638.16.camel@decadent.org.uk> <5650EEBD.6000400@gmx.de>
 <1448158878.17638.20.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	stable@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448158878.17638.20.camel@decadent.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Ben,

On 22.11.2015 03:21, Ben Hutchings wrote:
> On Sat, 2015-11-21 at 23:22 +0100, Helge Deller wrote:
>> On 21.11.2015 21:57, Ben Hutchings wrote:
>>> On Fri, 2015-11-20 at 22:38 +0100, Helge Deller wrote:
>>>> On parisc we have up to now never supported Huge Pages, even glibc did
>>>> not defined MAP_HUGETLB for parisc. Since the Huge Page support is being
>>>> added now, clean up existing definitions for MAP_HUGETLB and friends.
>>>>
>>>> Drop lots of MADV_xxK_PAGES flags, which were never used and were
>>>> designed for a patch which was never integrated into the Linux
>>>> kernel. Instead move other MADV_ flags to make them more compatible to
>>>> other linux architectures.
>>>
>>> Changing the unimplemented values seems fine, but how can it be OK to
>>> renumber MAP_GROWSUP, MADV_DONTDUMP and MADV_DODUMP?
>>
>> MAP_GROWSUP is new.
>> MAP_STACK changed, but doesn't seeem to be used inside the kernel anyway.
> 
> It may not be implemented in the kernel, but it is certainly used by
> userland:
> https://sources.debian.net/src/glibc/2.19-20/nptl/allocatestack.c/#L513

I knew this one, but didn't faced any problems.

Anyway, I will rework my patch and just drop the unnecessary MADV_xxxK_PAGES
flags.

Thanks!

Helge
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWUaK8AAoJEKGDlV8wpRJBZRYP/2veyj1ZhqmF1uE8h/t96H3G
WWhmQyzce8VJZUbOQdicYIUbLWj4CZLQUE+l59afPTHQqnUTo6nHKhsOKl4SBp8t
2+77qWUsDnv68pt4IOGAiAVJSYVgtkK+cB4ROmDJAUzJY5aVQF9/kfsDGx1+RWeX
ozXmRoGY/ANCVDiO+y8hOraOb6XHWhHidHNfynadAGVvy9egqHi7H6shb1KbFVIi
puw5kZD9grcvBoE+Ot0hpsufsjfvdeNRXwXQKW7+bwpIKbowxFbi6OyCJn9uy7aW
7uFBiJbDl4ZFk9zsE3dkEWDi6fyFgpBZic/p9lDCr95e26q8peTBpkgz1oHpzDh+
Q2/8zMu0vHKSVNAeuU16dQXT7yKSXKjBnLPFHzrvGLTRXQ9SLJmFx6+UVRUANe0e
K5/Hd8FDs1X0+5wOSK0Kj2CwQwZoO3K9XAZ5TTPQhw/2FTh7Kq5ixMUPhoiYtN4X
zpZZPE5Dd6JgCWm9SR5XM3V26DDz1gSZLs9FjdcVDW4xSivKK6X9onPEoB5ju2o+
/C78qDopRkhmaklYortbZ3wK/UEYSWKVtGmzW6L+/evC9M+/i3nmqMmMab7TjZDV
+plleRrZzbNnPpLdqOXMNlaKg9k232GjcoilMdigb0GRXvDj0KXqPeu9HkFnI7dV
utuUBUrWRZIfjha65eZa
=fi31
-----END PGP SIGNATURE-----

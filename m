From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix re-mmap() of shared file to same fixed address
Date: Mon, 25 Nov 2013 21:43:37 +0100
Message-ID: <5293B679.1040405@gmx.de>
References: <20131120220742.GA23304@p100.box> <201311242341.23301.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	dave.anglin@bell.net
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201311242341.23301.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Mike,

On 11/25/2013 05:41 AM, Mike Frysinger wrote:
> On Wednesday 20 November 2013 17:07:42 Helge Deller wrote:
>> locale-gen from glibc showed a strange problem on parisc:
> 
> pedantic: locale-gen is from distros while glibc itself provides localedef.

Ok.

>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42a54000
>> mmap2(0x42a54000, 103860, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0)
>> = -1 EINVAL (Invalid argument)
>>
>> Basically it was just trying to re-mmap() a file at the same address
>> which it was given by a previous mmap() call. But this remapping failed
>> with EINVAL.
>>
>> The problem is, that when MAP_FIXED and MAP_SHARED flags were used, we
>> didn't included the mapping-based offset when we verified the alignment of
>> the given fixed address against the offset which we calculated it in the
>> previous call.
> 
> hmm, which version of glibc were you trying ?  we landed this change recently:
> https://sourceware.org/git/?p=glibc.git;a=commitdiff_plain;h=17db6e8d6b12f55e312fcab46faf5d332c806fb6
> 
> it's part of glibc-2.18.  we know earlier versions of localedef failed on 
> systems like parisc, although it seemed to really only creep up on 64bit 
> kernels reliably.

It's debian's glibc 2.17-96

> based on your description, it sounds like independent bugs, but it also seems 
> a little coincidental ...

It's at least related.
As long as in the second mmap(ptr,...) the ptr value given is the same as the ptr value
returned by a prior call to mmap(NULL,...) it works.
It's hard to read from the diff if this is the case with the new glibc patch...

Anyway, I think the main thing one should know is, that a mmap(NULL,..) call will in most
cases *not* return a value which is a multiple of SHMLBA. But the offset (ptr%SHMLBA) 
will stay constant as long as the same file handle is used.

Helge
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJSk7Z5AAoJEKGDlV8wpRJBPeQP/RndkCBrSEwNbH5HWFS332Lw
CJ/l5QkG2rhZh1EYKywoxqlYeTR3vDveacCQEuOozeVm7zI50leZACFI8XromoTb
3MQ0oPy3X+ApP+X/+KYSO/5ew+bRMcJJ3bmid9jdZ8kA3U4h6nsdE1dd3tJl1sf0
10Jm/0OPz+x0mJBZU8V4cuZPllHsyvfk7IN/vnfhy3HdW/Jq2IPPE+XZhri+3SQu
qBSnZOVts6MS3tlC757GgKhGGLjer4hVrJaC4BQucSoAk3fEJZqXQzcs9HDIWTNd
k4kkan6fnUdvxpvZOO//TYeAYDZQvgMiYju/CMw35B+Iyk9Anma3oXxtTQTbaFh5
zjPlsrCuU+V7oUag6WiLKKtlmUg07sdX+G4Htf64mT9avdQvuGwWlJieORg7Xnjw
/32tWjyw/j/v6+Omdq5tMf+Si7NeDi+AbE2IaRFrGL+/1ANXj2XoTRP2o34gMj90
7OL6/ntV/p+D/ByGmSlGbvSL7RzKnYxHNS1/reeEys+tS2j3+C0M+7GDm1/r3BUV
hXVh0eFizr1p2tDsabCEbil3lEffVPXJ12mVY+HDhe7KGav66suNvhaqfcou07Yr
j9arKCVZyjbXkOmTjRXrGpgs697yqail100U3VuNXgrdBJz98oHbSB4t1jG5K/CW
TePZPuUjmHyjWTwyFRPp
=IeWC
-----END PGP SIGNATURE-----

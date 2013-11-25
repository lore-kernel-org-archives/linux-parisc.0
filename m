From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix re-mmap() of shared file to same fixed address
Date: Mon, 25 Nov 2013 08:19:39 -0500
Message-ID: <BLU0-SMTP39364B117BB604785BBC7C97ED0@phx.gbl>
References: <20131120220742.GA23304@p100.box> <201311242341.23301.vapier@gentoo.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201311242341.23301.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 24-Nov-13, at 11:41 PM, Mike Frysinger wrote:

> On Wednesday 20 November 2013 17:07:42 Helge Deller wrote:
>> locale-gen from glibc showed a strange problem on parisc:
>
> pedantic: locale-gen is from distros while glibc itself provides  
> localedef.
>
>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0x42a54000
>> mmap2(0x42a54000, 103860, PROT_READ|PROT_WRITE, MAP_SHARED| 
>> MAP_FIXED, 3, 0)
>> = -1 EINVAL (Invalid argument)
>>
>> Basically it was just trying to re-mmap() a file at the same address
>> which it was given by a previous mmap() call. But this remapping  
>> failed
>> with EINVAL.
>>
>> The problem is, that when MAP_FIXED and MAP_SHARED flags were used,  
>> we
>> didn't included the mapping-based offset when we verified the  
>> alignment of
>> the given fixed address against the offset which we calculated it  
>> in the
>> previous call.
>
> hmm, which version of glibc were you trying ?  we landed this change  
> recently:
> https://sourceware.org/git/?p=glibc.git;a=commitdiff_plain;h=17db6e8d6b12f55e312fcab46faf5d332c806fb6
>
> it's part of glibc-2.18.  we know earlier versions of localedef  
> failed on
> systems like parisc, although it seemed to really only creep up on  
> 64bit
> kernels reliably.

Besides the above, our mmap allocater doesn't work well when we have a  
large number
of small allocations:
https://rt.perl.org:443/rt3/Ticket/Display.html?id=119567

Effectively, we allocate 4 MB per locale and soon run out of memory.

Problem is here:

/*
  * We need to know the offset to use.  Old scheme was to look for
  * existing mapping and use the same offset.  New scheme is to use the
  * address of the kernel data structure as the seed for the offset.
  * We'll see how that works...
  *
  * The mapping is cacheline aligned, so there's no information in the  
bottom
  * few bits of the address.  We're looking for 10 bits (4MB / 4k), so  
let's
  * drop the bottom 8 bits and use bits 8-17.
  */
static int get_offset(struct address_space *mapping)
{
         return (unsigned long) mapping >> 8;
}

We rarely suceed in allocating two or more maps in the same 4 MB block
of memory.

Dave
--
John David Anglin	dave.anglin@bell.net




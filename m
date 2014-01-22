From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] parisc: report inequivalent aliases only for writeable
 mappings
Date: Wed, 22 Jan 2014 17:27:28 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401221650320.3906@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1401221402190.12739@file01.intranet.prod.int.rdu2.redhat.com>  <1390418695.2372.86.camel@dabdike.int.hansenpartnership.com>  <alpine.LRH.2.02.1401221535290.25455@file01.intranet.prod.int.rdu2.redhat.com>
 <1390424223.2372.100.camel@dabdike.int.hansenpartnership.com> <alpine.LRH.2.02.1401221629520.1498@file01.intranet.prod.int.rdu2.redhat.com> <BLU0-SMTP653E849DC18BBE6054E93597A70@phx.gbl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP653E849DC18BBE6054E93597A70@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The majority messages occur because of a binutils bug that was fixed several
> years ago.
> There's a non equivalent mapping between the last code page and the start of
> writable
> data in almost every application and shared library in Debian 5. This is fixed
> in the current
> Debian unstable and Gentoo.  So, I recommend updating.

So far I haven't had any problems with Debian 5, so I prefer it to the 
constantly changing unstable.

Anyway, the kernel should work with Debian 5 - the only way how to install 
a new parisc system is to install Debian 5 and then switch to 
debian-ports.

> When the user aliases are re-enabled, we have the following situation when
> non equivalent
> aliases exist:
> 
> "All other uses of non-equivalent aliasing (including simultaneously enabling
> multiple non-equivalently
> aliased translations where one or more allow for write access) are prohibited,
> and can cause machine
> checks or silent data corruption, including data corruption of unrelated
> memory on unrelated pages."
> 
> I'm not sure that we handle correctly handle the case where there are only
> equivalent user aliases.
> Calling flush_dcache_page() was a step in this direction but unfortunately
> Helge and I have found
> a side effect (zombies run by expect in gcc/gdb testsuites).  I've also found
> another situation where
> non equivalent aliases are generated.
> 
> I tend to think message should be a debug message.
> 
> Dave
> 
> -- 
> John David Anglin    dave.anglin@bell.net


There is another problem - flushing the cache in kmap_atomic doesn't fix 
inequivalent aliasing because there may be other threads on other CPUs 
touching that page from userspace simultaneously.


I got an idea that it could be possible to implement kmap_atomic without 
flushing the cache - currently, 64-bit pagetables map 2^41 bytes of 
memory. You can hack the kernel tlb handler, so that the addresses above 
2^41 map to the same memory as base kernel space, just shifted by a few 
pages.

Suppose that the following ranges in the kernel address space map to the 
same memory:

0 ... 2^41-1	(the original kernel mapping)
2^41 + 4096 ... 2*2^41 + 4095 (an alias shifted by 4k)
2*2^41 + 8192 ... 3*2^41 + 8191 (an alias shifted by 8k)
3*2^41 + 12288 ... 4*2^41 + 12287 (an alias shifted by 12k)
... etc for all 1024 page aliasings.
1023*2^41 + 4190208 ... 1024*2^41 + 4190207 (an alias shifted by 4M-4k)

Then, kmap_atomic could select a kernel mapping that has the same 
cache-equivalence as the existing userspace mapping and simply return it 
to kernelspace without flushing the cache.

Mikulas

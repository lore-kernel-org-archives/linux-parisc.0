From: Helge Deller <deller@gmx.de>
Subject: Re: pointless code in probe_kernel_read
Date: Mon, 11 Nov 2013 22:33:45 +0100
Message-ID: <52814D39.8060305@gmx.de>
References: <alpine.LRH.2.02.1311111009060.377@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1311111009060.377@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Mikulas,

On 11/11/2013 04:13 PM, Mikulas Patocka wrote:
> Hi Helge
> 
> I noted that you created this function in commit 
> db080f9c530f78dad661257885a1893506077068
> 
> long probe_kernel_read(void *dst, const void *src, size_t size)
> {
>         unsigned long addr = (unsigned long)src;
> 
>         if (size < 0 || addr < PAGE_SIZE)
>                 return -EFAULT;
> 
>         /* check for I/O space F_EXTEND(0xfff00000) access as well? */
> 
>         return __probe_kernel_read(dst, src, size);
> }
> 
> size_t is unsigned, so comparison size < 0 doesn't make sense. What 
> exactly did you mean by this test?

Of course you are right. The "size < 0" check is superfluous.
I noticed that too when the code went upstream, but I was not yet motivated
too much to remove it again - at least the compiler should optimize it out.

The second part (addr < PAGE_SIZE) is relevant though.

Helge

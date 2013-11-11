From: Mikulas Patocka <mpatocka@redhat.com>
Subject: pointless code in probe_kernel_read
Date: Mon, 11 Nov 2013 10:13:19 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1311111009060.377@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge

I noted that you created this function in commit 
db080f9c530f78dad661257885a1893506077068

long probe_kernel_read(void *dst, const void *src, size_t size)
{
        unsigned long addr = (unsigned long)src;

        if (size < 0 || addr < PAGE_SIZE)
                return -EFAULT;

        /* check for I/O space F_EXTEND(0xfff00000) access as well? */

        return __probe_kernel_read(dst, src, size);
}

size_t is unsigned, so comparison size < 0 doesn't make sense. What 
exactly did you mean by this test?

Mikulas

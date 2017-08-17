From: Helge Deller <deller@gmx.de>
Subject: Re: hppa: rodata_test: start of .rodata is not page size aligned
Date: Thu, 17 Aug 2017 20:38:09 +0200
Message-ID: <769ea943-59da-80cb-ac74-726887656bf6@gmx.de>
References: <alpine.LRH.2.20.1708172113460.7500@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Jinbum Park <jinb.park7@gmail.com>
To: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1708172113460.7500@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17.08.2017 20:15, Meelis Roos wrote:
> Today I compiled 4.13-rc5+git on my farm on on one of my parisc boxes I 
> got the following warning in dmesg:
> 
> rodata_test: start of .rodata is not page size aligned

In arch/parisc/kernel/vmlinux.lds.S we have:
	RO_DATA_SECTION(8)
so it's 8-byte aligned, and directly behind the linkage tables (on 64bit)
and before the exception tables which all will be mapped read-only as well.

I see no reason why we should waste space by aligning it on PAGE_SIZE boundary.
I'd say this test result is in our case bogus...

Helge 

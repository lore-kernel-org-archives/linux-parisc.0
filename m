Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA07908
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Aug 2000 08:53:45 -0600
Received: from user32-46.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.32.46)
  by mailserv2.iuinc.com with SMTP; 22 Aug 2000 14:53:37 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 627C9B005; Tue, 22 Aug 2000 15:52:21 +0100 (BST)
Date: Tue, 22 Aug 2000 15:52:21 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000822155221.W4060@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000822153803.U4060@linuxcare.com>; from rhirst@linuxcare.com on Tue, Aug 22, 2000 at 03:38:03PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 22, 2000 at 03:38:03PM +0100, Richard Hirst wrote:
> I put some printk's in pgalloc.h:
> 
> __flush_dcache_range: addr 0xc7e23000, size 4096
> __flush_icache_range: addr 0xc7e23000, size 4096
> __flush_icache_range: addr 0xc7e23000, size 4096
> __flush_dcache_range: addr 0xc7da5000, size 4096
> __flush_icache_range: addr 0xc7da5000, size 4096
> __flush_dcache_range: addr 0x000bdc8c, size 4096
> __flush_icache_range: addr 0x000bdc8c, size 4096
> __flush_dcache_range: addr 0x40000000, size 4096
> __flush_icache_range: addr 0x40000000, size 4096
> __flush_dcache_range: addr 0xc7dc8000, size 4096
> __flush_icache_range: addr 0xc7dc8000, size 4096
> __flush_dcache_range: addr 0xc7dc8000, size 4096
> __flush_icache_range: addr 0xc7dc8000, size 4096
> __flush_icache_range: addr 0xc7dc8000, size 4096
> __flush_dcache_range: addr 0x00001000, size 770048
> __flush_icache_range: addr 0x00001000, size 770048
> __flush_dcache_range: addr 0x000bd000, size 24576
> __flush_icache_range: addr 0x000bd000, size 24576
> __flush_dcache_range: addr 0x000c3000, size 102400
> __flush_icache_range: addr 0x000c3000, size 102400
> __flush_dcache_range: addr 0x2001f000, size 268308480
> __flush_icache_range: addr 0x2001f000, size 268308480
> __flush_dcache_range: addr 0x40100000, size 32768
> __flush_icache_range: addr 0x40100000, size 32768
> __flush_dcache_range: addr 0x40108000, size 1015808
> __flush_icache_range: addr 0x40108000, size 1015808
> __flush_dcache_range: addr 0x20022fac, size 4096
> __flush_icache_range: addr 0x20022fac, size 4096
> __flush_dcache_range: addr 0x00003594, size 2
> __flush_dcache_range: addr 0xc7f986c8, size 2
> > __flush_dcache_range: addr 0x2002300c, size 4096
> __flush_icache_range: addr 0x2002300c, size 4096
> 
> 
> Those two flushes of 268 Meg each take a while to run.
> There also appears to be a mix of virtual and physical addresses being
> passed to __flush_[id]cache_range(), which must be wrong.  I believe they
> should be passed virtual addresses.
> 
> pgtable.h is interesting as well:
> 
> /*
>  * cache_push() semantics: Write back any dirty cache data in the given area,
>  * and invalidate the range in the instruction cache. It needs not (but may)
>  * invalidate those entries also in the data cache. The range is defined by a
>  * _physical_ address.
>  */
> #define cache_push(paddr, len) \
>                         flush_cache_range(&init_mm, virt_to_phys(paddr), len)
> #define cache_push_v(vaddr, len) \
>                         flush_cache_range(&init_mm, vaddr, len)
> 
> 
> I guess that virt_to_phys() should be a phys_to_virt()....

And also, flush_cache_range() is defined in pgalloc.h as taking start and
end, not start and length.

Richard

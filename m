From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] remap_file_pages needs to check for cache coherency
Date: Fri, 27 Dec 2013 14:13:16 -0500
Message-ID: <BLU0-SMTP17D26551261DF285A7E6F497CD0@phx.gbl>
References: <20131227180018.GC4945@linux.intel.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-mips@linux-mips.org
To: Matthew Wilcox <willy@linux.intel.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131227180018.GC4945@linux.intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27-Dec-13, at 1:00 PM, Matthew Wilcox wrote:

> +#ifdef __ARCH_FORCE_SHMLBA
> +	/* Is the mapping cache-coherent? */
> +	if ((pgoff ^ linear_page_index(vma, start)) &
> +	    ((SHMLBA-1) >> PAGE_SHIFT))
> +		goto out;
> +#endif


I think this will cause problems on PA-RISC.  The reason is we have an  
additional offset
for mappings.  See get_offset() in sys_parisc.c.

SHMLBA is 4 MB on PA-RISC.  If we limit ourselves to aligned mappings,  
we run out of
memory very quickly.  Even with our current implementation, we fail  
the perl locales test
with locales-all installed.

Dave
--
John David Anglin	dave.anglin@bell.net




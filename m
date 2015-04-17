From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH] parisc: Replace PT_NLEVELS with CONFIG_PGTABLE_LEVELS
Date: Fri, 17 Apr 2015 15:58:34 +0300
Message-ID: <20150417125834.GA3023@node.dhcp.inet.fi>
References: <1429130068-18096-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1429130068-18096-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 15, 2015 at 01:34:28PM -0700, Guenter Roeck wrote:
> The following warning is seen when compiling parisc images
> 
> ./arch/parisc/include/asm/pgalloc.h: In function 'pgd_alloc':
> ./arch/parisc/include/asm/pgalloc.h:29:5: warning: "PT_NLEVELS" is not defined
> 
> Some definitions of PT_NLEVELS were missed with the conversion to
> CONFIG_PGTABLE_LEVELS.
> 
> Fixes: f24ffde43237 ("parisc: expose number of page table levels
> 	on Kconfig level")
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov

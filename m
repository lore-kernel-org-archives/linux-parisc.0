From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Eliminate sg_virt_addr() and private scatterlist.h
Date: Sat, 21 Mar 2015 11:04:57 -0400
Message-ID: <BLU437-SMTP942FD29D20A2E21EC80670970F0@phx.gbl>
References: <1426873079-32288-1-git-send-email-matthew.r.wilcox@intel.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Matthew Wilcox <matthew.r.wilcox@intel.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1426873079-32288-1-git-send-email-matthew.r.wilcox@intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-03-20, at 1:37 PM, Matthew Wilcox wrote:

> From: Matthew Wilcox <willy@linux.intel.com>
> 
> The only reason to keep parisc's private asm/scatterlist.h was that it
> had the macro sg_virt_addr().  Convert all callers to use something else
> (sometimes just sg->offset was enough, others should use sg_virt()), and
> we can just use the asm-generic scatterlist.h instead.
> 
> Signed-off-by: Matthew Wilcox <willy@linux.intel.com>
> ---
> 
> I haven't even compile-tested these changes ... I do have some PA-RISC
> equipment, but it hasn't been turned on in seven years.

Tested-by: dave.anglin@bell.net

--
John David Anglin	dave.anglin@bell.net




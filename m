From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix longstanding build failures for !CONFIG_PCI
Date: Mon, 27 Feb 2012 09:20:57 -0600
Message-ID: <1330356057.2822.44.camel@dabdike.int.hansenpartnership.com>
References: <1330298677-17205-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: jejb@parisc-linux.org, kyle@mcmartin.ca, deller@gmx.de,
	linux-parisc@vger.kernel.org, mst@redhat.com,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Randy Dunlap <rdunlap@xenotime.net>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1330298677-17205-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2012-02-26 at 18:24 -0500, Paul Gortmaker wrote:
> Upstream commit fea80311a939a746533a6d7e7c3183729d6a3faf
> 
>     "iomap: make IOPORT/PCI mapping functions conditional"
> 
> introduced an arch independent stub for pci_iounmap() but the
> parisc had its own that was unconditionally built.  So builds
> since v3.0-3553-gfea8031 have been failing with:
> 
> arch/parisc/lib/iomap.c:439:6: error: redefinition of 'pci_iounmap'
> include/asm-generic/iomap.h:75:20: note: previous definition of 'pci_iounmap' was here
> 
> Making the parisc one specific to CONFIG_PCI fixes the problem.
> 
> CC: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
> 
> [This fixes the linux-next builds that have been consistently failing
>  since last July -- http://kisskb.ellerman.id.au/kisskb/target/2069/ ]
> 
> diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
> index fb8e10a..dc0a2c3 100644
> --- a/arch/parisc/lib/iomap.c
> +++ b/arch/parisc/lib/iomap.c

This should break more than just PARISC ... any non-PCI build for any
arch should be broken, so this is the proposed generic fix:

http://marc.info/?l=linux-parisc&m=132794183521355

James



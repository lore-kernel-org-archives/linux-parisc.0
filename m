From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH 5/6] block: permit I/O to vmalloc/vmap kernel pages
Date: Wed, 18 Nov 2009 19:10:53 +0900
Message-ID: <20091118191031Q.fujita.tomonori@lab.ntt.co.jp>
References: <1258477432-2513-4-git-send-email-James.Bottomley@suse.de>
	<1258477432-2513-5-git-send-email-James.Bottomley@suse.de>
	<1258477432-2513-6-git-send-email-James.Bottomley@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org
To: James.Bottomley@suse.de
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1258477432-2513-6-git-send-email-James.Bottomley@suse.de>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 17 Nov 2009 11:03:51 -0600
James Bottomley <James.Bottomley@suse.de> wrote:

> This updates bio_map_kern() to check for pages in the vmalloc address
> range and call the new kernel flushing APIs if the are.  This should
> allow any kernel user to pass a vmalloc/vmap area to block.
>
> Signed-off-by: James Bottomley <James.Bottomley@suse.de>
> ---
>  fs/bio.c |   20 ++++++++++++++++++--
>  1 files changed, 18 insertions(+), 2 deletions(-)

Do we need this?

Buffers that xfs_buf.c passes to block doesn't go to bio_map_kern()?

From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: agp: parisc-agp.c - use correct page_mask function
Date: Sun, 27 Sep 2009 23:24:16 -0400
Message-ID: <20090928032416.GL11961@bombadil.infradead.org>
References: <4ABFD560.9080302@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	David Airlie <airlied@linux.ie>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4ABFD560.9080302@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Sep 27, 2009 at 11:13:04PM +0200, Helge Deller wrote:
> This commit:
>
> Commit 2a4ceb6d3e6a566cb4a9dc8f974177f031d27cd7
> Author: David Woodhouse <David.Woodhouse@intel.com>
> Date:   Mon Jul 27 10:27:29 2009 +0100
>     agp: Switch mask_memory() method to take address argument again, not page
>
> broke the parisc AGP driver (again). This patch fixes it.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>

Acked-by: Kyle McMartin <kyle@mcmartin.ca>

airlied, please apply.

Thanks, Kyle

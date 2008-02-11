From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c] pcxl_dma_ops.alloc_noncoherent = pa11_dma_alloc_consistent?
Date: Mon, 11 Feb 2008 09:42:15 -0700
Message-ID: <20080211164215.GM5299@parisc-linux.org>
References: <47B07685.5000606@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@parisc-linux.org, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
To: Roel Kluin <12o3l@tiscali.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47B07685.5000606@tiscali.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 11, 2008 at 05:23:33PM +0100, Roel Kluin wrote:
> duplicate pa11_dma_alloc_consistent; more appropriate appears
> pa11_dma_alloc_noncoherent here. 
> 
> Not tested, please confirm that this fix is correct

I don't think it is.  The memories are fading, so I don't recall why it
is we do it this way, but I'm pretty sure it's correct the way it is.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

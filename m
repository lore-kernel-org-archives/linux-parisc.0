From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: fix bug in compat_arch_ptrace
Date: Tue, 25 Nov 2008 12:04:41 -0500
Message-ID: <20081125170441.GC30056@bombadil.infradead.org>
References: <200811201054.09930.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	torvalds@linux-foundation.org,
	Kyle Mc Martin <kyle@hera.kernel.org>,
	linux-parisc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200811201054.09930.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 20, 2008 at 10:54:09AM +0100, Helge Deller wrote:
> This commit in 2.6.28-rc:
> 	81e192d6ce303b6792aa38ff35f41a1a7357f23a
> 	parisc: convert to generic compat_sys_ptrace
> 
> introduced a bug which segfaults the parisc 64bit kernel 
> when stracing 32bit applications:
> 

Thanks, looks fine.


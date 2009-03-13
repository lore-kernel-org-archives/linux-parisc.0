From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: define SRCARCH=parisc for parisc64 builds
Date: Fri, 13 Mar 2009 00:55:37 -0400
Message-ID: <20090313045537.GC3907@bombadil.infradead.org>
References: <49862F11.5000808@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49862F11.5000808@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 02, 2009 at 12:24:01AM +0100, Helge Deller wrote:
> The parisc64 target (HP PARISC, 64bit kernel) is similar to the sparc64 or 
> m68knommu targets, as it shares all sources for 32- and 64-bit in one single
> source path which is arch/parisc/.
> This patch now allows one to use ARCH=parisc64 and just directly build the
> 64bit kernel without creating symlinks in arch/ and include/asm-* manually
> the same way as it's done for sparc64 and m68knommu.
> 

I'm going to drop this patch, powerpc and mips don't do it, and
'parisc64' hasn't been valid as $ARCH since v2.3 or something equally
ancient, so I can't see any point in it.

regards, Kyle

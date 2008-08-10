From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [2.6 patch] binfmt_som.c: add MODULE_LICENSE
Date: Sat, 9 Aug 2008 19:00:06 -0600
Message-ID: <20080810010005.GL8618@parisc-linux.org>
References: <20080806211155.GV1702@cs181140183.pp.htv.fi> <20080810005511.GB2617@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Adrian Bunk <bunk@kernel.org>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, bdale@hp.com
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080810005511.GB2617@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Aug 09, 2008 at 06:55:11PM -0600, Grant Grundler wrote:
> Someone from HP needs to ACK this patch since I believe HP funded the code
> changes made during the parisc-linux port. This should be a no-brainer
> and I expect Bdale Garbee can quickly take care of this.

I actually did the work here, it was derived heavily from binfmt_elf
and binfmt_aout; had it not been GPL-licensed, it would not have been
distributable.  Also, I believe I did this work before joining Linuxcare,
so I don't believe HP has any claim to it at all.  You'd have to check
CVS history to be sure.  Oh, and even if HP does have a claim to it
through Linuxcare, HP's contract required all changes made by Linuxcare
to be contributed upstream.  So three different reasons why this code
being GPL is required.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

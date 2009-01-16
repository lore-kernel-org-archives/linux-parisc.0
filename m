From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] Remove needless flush_dcache_page call
Date: Thu, 15 Jan 2009 23:01:24 -0700
Message-ID: <20090116060124.GG31013@parisc-linux.org>
References: <20090116052804.GA18737@barrios-desktop> <20090116053338.GC31013@parisc-linux.org> <20090116055119.GA6515@barrios-desktop> <20090116055927.GA22810@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: MinChan Kim <minchan.kim@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org, linux-parisc@vger.kernel.org
To: Nick Piggin <npiggin@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090116055927.GA22810@wotan.suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 16, 2009 at 06:59:27AM +0100, Nick Piggin wrote:
> But there are quite possibly holes around here because not as much testing
> is done on CPUs with these kinds of caches. Eg. brd probably should be
> doing a flush_dcache_page in the rw == WRITE direction AFAIKS, so it picks
> up user aliases here.

Nick, if you wanted me to schlep a parisc machine to LCA for you, you
needed to ask me *before* I got as far as Vancouver ;-)

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

From: Nick Piggin <npiggin@suse.de>
Subject: Re: [PATCH] Remove needless flush_dcache_page call
Date: Fri, 16 Jan 2009 08:34:13 +0100
Message-ID: <20090116073413.GC22810@wotan.suse.de>
References: <20090116052804.GA18737@barrios-desktop> <20090116053338.GC31013@parisc-linux.org> <20090116055119.GA6515@barrios-desktop> <20090116055927.GA22810@wotan.suse.de> <20090116060124.GG31013@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090116060124.GG31013@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jan 15, 2009 at 11:01:24PM -0700, Matthew Wilcox wrote:
> On Fri, Jan 16, 2009 at 06:59:27AM +0100, Nick Piggin wrote:
> > But there are quite possibly holes around here because not as much testing
> > is done on CPUs with these kinds of caches. Eg. brd probably should be
> > doing a flush_dcache_page in the rw == WRITE direction AFAIKS, so it picks
> > up user aliases here.
> 
> Nick, if you wanted me to schlep a parisc machine to LCA for you, you
> needed to ask me *before* I got as far as Vancouver ;-)

;)

That actually might not be a bad idea if I had access to one of your crazy
systems. Would it really fit on an aeroplane or would you need a shipping
container? :)


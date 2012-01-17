From: Greg Kroah-Hartman <greg@kroah.com>
Subject: Re: Fix compile breakage with kref.h
Date: Tue, 17 Jan 2012 13:26:39 -0800
Message-ID: <20120117212639.GA17297@kroah.com>
References: <1326834845.3020.36.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: James Bottomley <jbottomley@parallels.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1326834845.3020.36.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jan 17, 2012 at 09:14:05PM +0000, James Bottomley wrote:
> This set of build failures just started appearing on parisc:
> 
> In file included from drivers/input/serio/serio_raw.c:12:
> include/linux/kref.h: In function 'kref_get':
> include/linux/kref.h:40: error: 'TAINT_WARN' undeclared (first use in this function)
> include/linux/kref.h:40: error: (Each undeclared identifier is reported only once
> include/linux/kref.h:40: error: for each function it appears in.)
> include/linux/kref.h: In function 'kref_sub':
> include/linux/kref.h:65: error: 'TAINT_WARN' undeclared (first use in this function)
> 
> It happens because TAINT_WARN is defined in kernel.h and this particular
> compile doesn't seem to include it (no idea why it's just
> manifesting ... probably some #include file untangling exposed it).  Fix
> by adding #include <linux/kernel.h> to linux/kref.h

Does adding <linux/bug.h> fix it instead?  We are using WARN_ON() here.
Hm, but that needs kernel.h as well, ugh, what a mess.

> Signed-off-by: James Bottomley <JBottomley@Parallels.com>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>


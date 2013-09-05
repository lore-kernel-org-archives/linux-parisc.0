From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: Export flush_cache_page() (needed by lustre)
Date: Thu, 5 Sep 2013 13:13:38 -0400
Message-ID: <20130905171338.GB25882@merlin.infradead.org>
References: <1378373595-29471-1-git-send-email-geert@linux-m68k.org>
 <1378396919.2142.5.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378396919.2142.5.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 05, 2013 at 09:01:59AM -0700, James Bottomley wrote:
> > +EXPORT_SYMBOL_GPL(flush_cache_page);
> 
> This is an internal API: no architecture exports this.  Whoever is
> trying to use it needs to use the correct API, so this is the wrong
> patch.
> 

I suspect it's copy_{to,from}_user_page being called here:

drivers/staging/lustre/lustre/libcfs/linux/linux-curproc.c:
copy_to_user_page(vma, page, addr,

which we could probably take out of line.

--Kyle

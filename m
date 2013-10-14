From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: [GIT PULL] parisc updates for v3.12-rc5
Date: Mon, 14 Oct 2013 14:35:33 +0200 (CEST)
Message-ID: <trinity-4f52e27f-75d8-4137-83d6-d242e529c3c9-1381754133846@3capp-gmx-bs48>
References: <20131013161130.GA19534@p100.box>,
 <20131014112621.GA9705@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
	"Linux Kernel Development" <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	"James Bottomley" <James.Bottomley@HansenPartnership.com>
To: "Christoph Hellwig" <hch@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131014112621.GA9705@infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Geert Uytterhoeven (1):
> >       parisc: Export flush_cache_page() (needed by lustre)
> 
> This one shouldn't go in - Geert sent it a bit prematurely, as Lustre
> shouldn't use it just to reimplement core VM functionality (which it
> shouldn't use either, but that's a separate story).

Ok, it's my fault then.
I'll include a reverting patch in the next parisc pull request...

Thanks,
Helge

From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: 4.0-rc1/PARISC: BUG: non-zero nr_pmds on freeing mm
Date: Wed, 25 Feb 2015 13:31:40 -0800
Message-ID: <20150225133140.56cfb479cd2f4461ed4fa6d5@linux-foundation.org>
References: <20150224225454.GA14117@fuloong-minipc.musicnaut.iki.fi>
	<20150225202130.GA31491@node.dhcp.inet.fi>
	<20150225123048.a9c97ea726f747e029b4688a@linux-foundation.org>
	<20150225204743.GA31668@node.dhcp.inet.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-parisc@vger.kernel.org, linux-mm@kvack.org
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150225204743.GA31668@node.dhcp.inet.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 25 Feb 2015 22:47:43 +0200 "Kirill A. Shutemov" <kirill@shutemov.name> wrote:

> > > If not, I can prepare a patchset which only adds missing
> > > __PAGETABLE_PUD_FOLDED and __PAGETABLE_PMD_FOLDED.
> > 
> > Something simple would be preferred, but I don't know how much simpler
> > the above would be?
> 
> Not much simplier: __PAGETABLE_PMD_FOLDED is missing in frv, m32r, m68k,
> mn10300, parisc and s390.

I don't really know what's going on here.  Let's rewind a bit, please. 
What is the bug, what causes it, which commit caused it and why the
heck does it require a massive patchset to fix 4.0?


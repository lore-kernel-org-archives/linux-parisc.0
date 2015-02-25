From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: 4.0-rc1/PARISC: BUG: non-zero nr_pmds on freeing mm
Date: Wed, 25 Feb 2015 22:47:43 +0200
Message-ID: <20150225204743.GA31668@node.dhcp.inet.fi>
References: <20150224225454.GA14117@fuloong-minipc.musicnaut.iki.fi>
 <20150225202130.GA31491@node.dhcp.inet.fi>
 <20150225123048.a9c97ea726f747e029b4688a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-parisc@vger.kernel.org, linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20150225123048.a9c97ea726f747e029b4688a@linux-foundation.org>
List-ID: <linux-mm.kvack.org>

On Wed, Feb 25, 2015 at 12:30:48PM -0800, Andrew Morton wrote:
> On Wed, 25 Feb 2015 22:21:30 +0200 "Kirill A. Shutemov" <kirill@shutemov.name> wrote:
> 
> > On Wed, Feb 25, 2015 at 12:54:54AM +0200, Aaro Koskinen wrote:
> > > Hi,
> > > 
> > > Here's a kernel config to reproduce the issue (no special steps needed,
> > > just boot to userspace), and bootlog after that:
> > > 
> > > #
> > > # Automatically generated file; DO NOT EDIT.
> > > # Linux/parisc 4.0.0-rc1 Kernel Configuration
> > ...
> > > [   18.940000] BUG: non-zero nr_pmds on freeing mm: -6
> > 
> > It happens due missing __PAGETABLE_PMD_FOLDED in custom page table
> > folding. This has been fixed in CONFIG_PGTABLE_LEVELS patcheset.
> > 
> > Andrew, are you going to submit that patchset to Linus in this cycle?
> 
> I wasn't planning on doing so - the changelog didn't say anything about
> fixing any regressions.

My bad. Patch 18/19 of the patchset introduced assert which checks that
folded macros are not missed and fixed all cases which trigger it.

> > If not, I can prepare a patchset which only adds missing
> > __PAGETABLE_PUD_FOLDED and __PAGETABLE_PMD_FOLDED.
> 
> Something simple would be preferred, but I don't know how much simpler
> the above would be?

Not much simplier: __PAGETABLE_PMD_FOLDED is missing in frv, m32r, m68k,
mn10300, parisc and s390.

-- 
 Kirill A. Shutemov

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: 4.0-rc1/PARISC: BUG: non-zero nr_pmds on freeing mm
Date: Wed, 25 Feb 2015 12:30:48 -0800
Message-ID: <20150225123048.a9c97ea726f747e029b4688a@linux-foundation.org>
References: <20150224225454.GA14117@fuloong-minipc.musicnaut.iki.fi>
	<20150225202130.GA31491@node.dhcp.inet.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-parisc@vger.kernel.org, linux-mm@kvack.org
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150225202130.GA31491@node.dhcp.inet.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 25 Feb 2015 22:21:30 +0200 "Kirill A. Shutemov" <kirill@shutemov.name> wrote:

> On Wed, Feb 25, 2015 at 12:54:54AM +0200, Aaro Koskinen wrote:
> > Hi,
> > 
> > Here's a kernel config to reproduce the issue (no special steps needed,
> > just boot to userspace), and bootlog after that:
> > 
> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/parisc 4.0.0-rc1 Kernel Configuration
> ...
> > [   18.940000] BUG: non-zero nr_pmds on freeing mm: -6
> 
> It happens due missing __PAGETABLE_PMD_FOLDED in custom page table
> folding. This has been fixed in CONFIG_PGTABLE_LEVELS patcheset.
> 
> Andrew, are you going to submit that patchset to Linus in this cycle?

I wasn't planning on doing so - the changelog didn't say anything about
fixing any regressions.

> If not, I can prepare a patchset which only adds missing
> __PAGETABLE_PUD_FOLDED and __PAGETABLE_PMD_FOLDED.

Something simple would be preferred, but I don't know how much simpler
the above would be?


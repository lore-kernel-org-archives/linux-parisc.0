From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [id]cache meaning? [Was: [parisc-linux] 2.6.10-rc1-pa11 profile
	data]
Date: Sun, 28 Nov 2004 19:14:14 -0600
Message-ID: <200411281914.14917.mszick@wolfbutter.com>
References: <20041111075431.GB9768@colo.lackof.org>
	<41AA3CB6.5070407@tiscali.be>
	<20041128211303.GP29035@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041128211303.GP29035@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun November 28 2004 15:13, Matthew Wilcox wrote:
> On Sun, Nov 28, 2004 at 09:01:42PM +0000, Joel Soete wrote:
> > 
> > include/asm-parisc/cacheflush.h:
> > [...]
> > #define flush_icache_page(vma,page)   do { 
> > flush_kernel_dcache_page(page_address(page)); 
> > flush_kernel_icache_page(page_address(page)); } while (0)
> > [...]
> 
> I see why this confuses you.  PA-RISC has writeback data caches that
> are non-coherent with the instruction cache.  So it's not enough to
> just flush the icache; if the page has been modified, we need to force
> the data in the dcache back to ram, then remove any existing cache for
> instructions in that page.  Then instruction accesses to that page will
> fetch the correct data from memory and everything will work.
> 
Matt, Joel,
Here is a, perhaps dumb, question from a non-parisc source...

I note Matt's statement: "...then remove any existing cache for
instructions in that page."

Which sounds very reasonable.

Question:
Is the:
> > flush_kernel_icache_page(page_address(page)); 
(or the hardware that receives the command)

smart enough to just mark the page 'invalid' or is it
actually an 'absolute update external storage'?

I ask because both flush commands are written the
same, BUT...
The first should be an 'absolute update external
storage'.
The second should be either just a 'mark
invalid' or 'conditional update external storage'.

Mike

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

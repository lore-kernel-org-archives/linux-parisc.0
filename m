From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [id]cache meaning? [Was: [parisc-linux] 2.6.10-rc1-pa11 profile
	data]
Date: Sun, 28 Nov 2004 21:13:03 +0000
Message-ID: <20041128211303.GP29035@parcelfarce.linux.theplanet.co.uk>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org> <41AA3CB6.5070407@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41AA3CB6.5070407@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 28, 2004 at 09:01:42PM +0000, Joel Soete wrote:
> I have additional question about such functions:
> 
> 	* in parisc above ..._dcache_... refer well to data cache?
> 	* and respectively ..._icache_... refer to instruction cache?
> 
> Have they different meaning for generic linux?

No, your understanding is correct (see Documentation/cachetlb.txt)

> The confusion came for me from:
> 
> include/asm-parisc/cacheflush.h:
> [...]
> #define flush_icache_page(vma,page)   do { 
> flush_kernel_dcache_page(page_address(page)); 
> flush_kernel_icache_page(page_address(page)); } while (0)
> [...]

I see why this confuses you.  PA-RISC has writeback data caches that
are non-coherent with the instruction cache.  So it's not enough to
just flush the icache; if the page has been modified, we need to force
the data in the dcache back to ram, then remove any existing cache for
instructions in that page.  Then instruction accesses to that page will
fetch the correct data from memory and everything will work.

Many other architectures have writethrough data caches.  They don't need
to flush the dcache.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ext2 vs ext3 on hppa
Date: Fri, 11 Feb 2005 10:18:46 -0700
Message-ID: <20050211171846.GB8835@colo.lackof.org>
References: <20050211071629.GA32318@colo.lackof.org>
	<20050211165322.GA8835@colo.lackof.org>
	<20050211165415.GF17242@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050211165415.GF17242@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Feb 11, 2005 at 04:54:15PM +0000, Matthew Wilcox wrote:
> On Fri, Feb 11, 2005 at 09:53:22AM -0700, Grant Grundler wrote:
> > And I suspect -02 data is with willy's vma_prev patch applied
> > that he proposed here:
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/025210.html
> 
> Probably not -- it crashes the machine ;-)

Ok :^(

We called flush_kernel_icache_page half as many times (5541 vs 2217).
And flush_user_icache_range_asm 1/5th a often (1279 vs 270).
Both are SMP kernels.

I have no idea what else might result in such a major difference.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

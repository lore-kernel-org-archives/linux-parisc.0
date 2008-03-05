From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH -mm 0/3] fix iommu segment boundary problems (parisc)
Date: Wed, 05 Mar 2008 12:54:15 +0900
Message-ID: <20080305125415Y.fujita.tomonori@lab.ntt.co.jp>
References: <1204438228-4564-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
	<20080302171311.GB18883@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: fujita.tomonori@lab.ntt.co.jp, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, tomof@acm.org, kyle@parisc-linux.org,
	matthew@wil.cx, grundler@parisc-linux.org,
	akpm@linux-foundation.org
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080302171311.GB18883@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2 Mar 2008 12:13:11 -0500
Kyle McMartin <kyle@mcmartin.ca> wrote:

> On Sun, Mar 02, 2008 at 03:10:25PM +0900, FUJITA Tomonori wrote:
> > This patchset is another sequel to my patchset to fix iommu segment
> > boundary problems, IOMMUs allocate memory areas without considering a
> > low level driver's segment boundary limits:
> > 
> > http://www.mail-archive.com/linux-scsi@vger.kernel.org/msg11919.html
> > 
> 
> This looks fine. Are you able to test this? If not, we can set you up
> with an account on a machine with remote console and all that jazz, if
> you'd like to.

Thanks for the offer!

I don't have any parisc hardware. If -mm kernels are tested well with
parisc, I'd be happy to leave it in your guys' hands since I've never
used parisc and the patches seem to work (with the bug fix for 32bits
boxes).

I'd like to try if there are not people who try -mm kernels with
parisc or a bug that I can't fix easily will be found.

Thanks,

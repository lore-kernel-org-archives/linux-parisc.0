From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH -mm 0/3] fix iommu segment boundary problems (parisc)
Date: Sun, 2 Mar 2008 12:13:11 -0500
Message-ID: <20080302171311.GB18883@phobos.i.cabal.ca>
References: <1204438228-4564-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	tomof@acm.org, Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	Andrew Morton <akpm@linux-foundation.org>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1204438228-4564-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 02, 2008 at 03:10:25PM +0900, FUJITA Tomonori wrote:
> This patchset is another sequel to my patchset to fix iommu segment
> boundary problems, IOMMUs allocate memory areas without considering a
> low level driver's segment boundary limits:
> 
> http://www.mail-archive.com/linux-scsi@vger.kernel.org/msg11919.html
> 

This looks fine. Are you able to test this? If not, we can set you up
with an account on a machine with remote console and all that jazz, if
you'd like to.

cheers, Kyle

From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH -mm 0/3] fix iommu segment boundary problems (parisc)
Date: Wed, 05 Mar 2008 11:56:41 +0900
Message-ID: <20080305115641Q.fujita.tomonori@lab.ntt.co.jp>
References: <JX7RR7$3528E2939A349F65E12E3F27315EEC50@scarlet.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: fujita.tomonori@lab.ntt.co.jp, tomof@acm.org, kyle@mcmartin.ca,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org,
	akpm@linux-foundation.org
To: rubisher@scarlet.be
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758935AbYCEDD0@vger.kernel.org>
In-Reply-To: <JX7RR7$3528E2939A349F65E12E3F27315EEC50@scarlet.be>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue,  4 Mar 2008 17:13:55 +0100
"rubisher" <rubisher@scarlet.be> wrote:

> [snip]
> > > Can you try the following patch? It's on the top of the patchset.
> > > 
> > Good catch: now this first testing system (I mean the b2k) is up and running ;-)
> > 
> > I will now try the ccio_dma driver on a d380 ...
> > 
> Yes, it works too on a d380 boxe running a 32bit up kernel.

Great, thanks a lot for testing both IOMMUs!


> Btw (it was a long time ago), I also resurrect my 64 config for the b2k model
> and it also works fine.

Nice, and sorry about the bug on 32bits boxes.

Thanks again,

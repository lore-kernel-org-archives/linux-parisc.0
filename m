From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c]      pcxl_dma_ops.alloc_noncoherent
Date: Mon, 11 Feb 2008 12:08:51 -0500 (EST)
Message-ID: <200802111708.m1BH8q3p008073@hiauly1.hia.nrc.ca>
References: <47B07E76.9000100@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, kyle@parisc-linux.org,
	matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: 12o3l@tiscali.nl (Roel Kluin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47B07E76.9000100@tiscali.nl> from "Roel Kluin" at Feb 11, 2008 05:57:26 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> James Bottomley wrote:
> > On Mon, 2008-02-11 at 17:23 +0100, Roel Kluin wrote:
> >> duplicate pa11_dma_alloc_consistent; more appropriate appears
> >> pa11_dma_alloc_noncoherent here. 
> >>
> >> Not tested, please confirm that this fix is correct
> > 
> > No, it looks completely incorrect to me.  What makes you think a pcxl
> > box has a problem with coherency?
> 
> Ok, please ignore the patch then. It just appeared suspicious to me
> that the function did exist, but the names assigned were different.

How about a comment?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

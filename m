From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH -mm 0/3] fix iommu segment boundary problems (parisc)
Date: Wed, 5 Mar 2008 19:19:31 -0500 (EST)
Message-ID: <20080306001933.248744E43@hiauly1.hia.nrc.ca>
References: <20080305154502.GA32538@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: fujita.tomonori@lab.ntt.co.jp, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, tomof@acm.org, kyle@parisc-linux.org,
	matthew@wil.cx, grundler@parisc-linux.org,
	akpm@linux-foundation.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080305154502.GA32538@colo.lackof.org> from "Grant Grundler" at Mar 5, 2008 08:45:02 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> And thanks to Joel Soete (rubisher) for testing. I tried to test the
> sba_iommu code on my local box but had issues with the unpatched kernel
> (using kyle's parisc-2.6.git tree) that I have yet to resolve (could be
> HW problems).

I built two kernels today using kyle's parisc-2.6.git tree (UP 32 bit
and SMP 64 bit).  Aside from some section mismatch warnings, they both
seem to work fine.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

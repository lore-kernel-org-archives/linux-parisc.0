From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Tue, 30 Mar 2010 17:36:27 -0400
Message-ID: <20100330213627.GH20286@bombadil.infradead.org>
References: <4BB0B2C8.8000302@fsij.org> <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com> <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com> <20100329200705.GE20286@bombadil.infradead.org> <119aab441003301338o1d0582f3wdbf82681f88ed671@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, NIIBE Yutaka <gniibe@fsij.org>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003301338o1d0582f3wdbf82681f88ed671@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Mar 30, 2010 at 04:38:08PM -0400, Carlos O'Donell wrote:
> * Thread A enters LWS CAS (no lock on UP)
> * Thread A writes to CAS address causing COW
> * Thread A sleeps.
> * Thread A completes COW, but finishes time slice before the write is restarted.
> * Thread B enters LWS CAS (no lock on UP)
> * Thread B writes to CAS address, and finishes time slice.
> * Thread A writes to CAS address and clobbers B's value.
> 
> The solution is to add the locks to the UP case to avoid this problem.
> 

Yes, removing the CONFIG_SMP on that bit looks like it will solve the
problem.

regards, Kyle

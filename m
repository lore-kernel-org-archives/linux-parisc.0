From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [GIT PULL] parisc huge page support for v4.4
Date: Tue, 24 Nov 2015 11:39:51 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1511241136440.14442@file01.intranet.prod.int.rdu2.redhat.com>
References: <20151122115153.GA28471@p100.box> <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com> <5654892D.1030707@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5654892D.1030707@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Tue, 24 Nov 2015, Helge Deller wrote:

> > Hi
> > 
> > Since the kernel 4.4-rc2 I'm getting frequent boot failures on PA-RISC. 
> > When I revert this patchset, the crashes are gone.
> 
> > [    3.296666] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
> 
> Hi Mikulas,
> 
> Yes, I've seen this as well.
> It affects only the PA8900 CPUs, while all PA8500-PA8700 machines seem to work fine.
> I do have a temporary 3-line patch to avoid the crashes which I'll push to my tree shortly.
> I'm still investigating why it only affects the PA8900 CPUs, but I assume
> it's related to the cache aliasing of those CPUs.
> I'll keep you updated.
> 
> Helge

The PA-RISC specification doesn't allow aliasing on non-equaivalent 
addresses. Can the kernel map a piece of kernel data to other virtual 
address? If yes, we can't use big pages to map kernel data.

Mikulas

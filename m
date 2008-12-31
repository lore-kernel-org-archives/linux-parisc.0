From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel
 modules (take 4)
Date: Wed, 31 Dec 2008 10:54:25 -0800
Message-ID: <20081231105425.9ccac21d.akpm@linux-foundation.org>
References: <4959346E.7060600@gmx.de>
	<200812310915.41693.rusty@rustcorp.com.au>
	<495B5806.3080505@gmx.de>
	<alpine.LFD.2.00.0812310926450.5086@localhost.localdomain>
	<ada63l0qmba.fsf@cisco.com>
	<alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>,
	Ian Campbell <ian.campbell@citrix.com>,
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>,
	Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 31 Dec 2008 09:47:19 -0800 (PST) Linus Torvalds <torvalds@linux-foundation.org> wrote:

> 
> > (I just notice this because I saw the warning about swiotlb_alloc_boot()
> > not being __init but calling __alloc_bootmem_low and so I looked at the
> > code yesterday)
> 
> Lucky us. What's nasty about this is that most developers probably have 
> updated versions of gcc, and are then surprised when some odd user has 
> insane behavior that doesn't match the source code - because the compiler 
> did something unexpected.

Adrian claimed that it was gcc-4.1.0 and 4.1.1 only.  He proposed
banning them: http://lkml.org/lkml/2008/8/5/444

> I guess I could make a sparse rule for this, but nobody seems to run or 
> care about sparse anyway. Sad.

No, there are some people who regularly run sparse and fix stuff.  Pending
things here include:

y:/usr/src/25> grep sparse series 
input-ads7846c-sparse-lock-annotation.patch
hugetlb-fix-sparse-warnings.patch
lib-fix-sparse-shadowed-variable-warning.patch
lib-proportionsc-trivial-sparse-lock-annotation.patch
nvidia-fix-sparse-warnings.patch
viafb-fix-sparse-warnings.patch
pm3fb-fix-sparse-warning.patch
neofb-fix-sparse-warnings.patch
i810-fix-sparse-warnings.patch
intelfb-fix-sparse-warnings.patch

Which is a good way for it to be used.

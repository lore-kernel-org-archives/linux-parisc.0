From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel
	modules (take 4)
Date: Fri, 2 Jan 2009 12:31:15 +0100
Message-ID: <20090102113115.GA3027@elte.hu>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de> <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain> <ada63l0qmba.fsf@cisco.com> <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231181136.GA4382@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Roland Dreier <rdreier@cisco.com>,
	Ian Campbell <ian.campbell@citrix.com>,
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>,
	Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081231181136.GA4382@uranus.ravnborg.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Sam Ravnborg <sam@ravnborg.org> wrote:

> > I guess I could make a sparse rule for this, but nobody seems to run 
> > or care about sparse anyway. Sad.
> 
> There is some increased janitorial effort recently. Try to grep for 
> [Ss]+parse in the shortlog for the last couple of months.

in the x86 space there's a lot of Sparse activity as well: a number of 
developers do systematic runs of Sparse and keep the tree Sparse-clean.

The moment this spreads to a critical mass of subsystems we can start 
automating it. (as i was able to automate the checking of -Werr builds on 
x86, with arbitrary random .config's)

	Ingo

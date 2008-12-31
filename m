From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules (take 4)
Date: Wed, 31 Dec 2008 19:11:37 +0100
Message-ID: <20081231181136.GA4382@uranus.ravnborg.org>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de> <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain> <ada63l0qmba.fsf@cisco.com> <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>,
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757139AbYLaSKW@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> I guess I could make a sparse rule for this, but nobody seems to run or 
> care about sparse anyway. Sad.

There is some increased janitorial effort recently.
Try to grep for [Ss]+parse in the shortlog for the last couple
of months.

	Sam

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Fri, 4 Feb 2011 11:17:06 -0500 (EST)
Message-ID: <20110204161706.B544B4DF4@hiauly1.hia.nrc.ca>
References: <AANLkTim9oXFf7ksuj9o-g2J4aL4xi-JPH3PsayMayxMt@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, mroos@linux.ee,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTim9oXFf7ksuj9o-g2J4aL4xi-JPH3PsayMayxMt@mail.gmail.com> from "Carlos O'Donell" at Feb 4, 2011 10:20:05 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > This is possibly the infamous COW bug.
> 
> The COW bug that is triggered by a COW from an LWS-CAS? The solution
> to which is to use locks around the LWS-CAS even on UP? I'd forgotten
> about this issue actually, I should push that patch out to James.

I was actually thinking of the fork/clone race for which there are various
testcases on the wiki.  The aptitude segv is with a SMP kernel, so I don't
think this is the UP LWS_CAS issue.  However, I agree you should push
the change.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 4 Apr 2010 22:58:40 -0400 (EDT)
Message-ID: <20100405025840.B79A54EF4@hiauly1.hia.nrc.ca>
References: <20100405025154.DE1D55160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gniibe@fsij.org, James.Bottomley@HansenPartnership.com,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100405025154.DE1D55160@hiauly1.hia.nrc.ca> from "John David Anglin" at Apr 4, 2010 10:51:53 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > By design that shouldn't happen: the idea behind COW breaking is
> > > that before it breaks, the page is read only ... this means that
> > > processes can have clean cache copies of it, but never dirty cache
> > > copies (because writes are forbidden).
> > 
> > That must be design, I agree.
> > 
> > To keep this condition (no dirty cache for COW page), we need to flush
> > cache before ptep_set_wrprotect.  That's my point.

Is it possible that a sleep/reschedule could cause the cache to become
dirty again before it is write protected?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

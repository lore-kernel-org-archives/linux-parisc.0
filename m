From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 7 Aug 2008 17:14:31 -0400 (EDT)
Message-ID: <20080807211432.8B70C4E77@hiauly1.hia.nrc.ca>
References: <20080807210804.GB4259@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080807210804.GB4259@phobos.i.cabal.ca> from "Kyle McMartin" at Aug 7, 2008 05:08:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> ls.c should be checking for -EOPNOTSUP, which is the only thing any of
> the kernel codepaths return for failing xattr calls. You're correct in
> diagnosing that this is only problematic on parisc, because we're the
> only folks who use a different value for EOPNOTSUP and ENOTSUP.

It is my understanding that Jim Meyering is addressing the ls issue.
HP-UX is also theoretically affected but the code paths are different.

The manpages are still wrong.  This probably led to the confusion in
the first place.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

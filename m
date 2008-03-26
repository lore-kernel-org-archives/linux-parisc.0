From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: GCC 4.3 and PLABEL32 issues.
Date: Tue, 25 Mar 2008 23:20:00 -0400 (EDT)
Message-ID: <20080326032001.357B74E7F@hiauly1.hia.nrc.ca>
References: <119aab440803251959j8596a72wc399174db02ed71f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc.ca, linux-parisc@vger.kernel.org,
	aurel32@debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803251959j8596a72wc399174db02ed71f@mail.gmail.com> from "Carlos O'Donell" at Mar 25, 2008 10:59:05 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> If the if condition is reduced to "0" as early as 003t.original, does
> that mean it's the C frontend fault?

Yes.  If I remember correctly, casting a pointer to an integer type
is implementation defined.

> This issue is breaks glibc's detection of PLABEL's during startup
> relocation processing.

This definitely needs a PR.  It should be marked as a regression.
This probably also breaks the unwind code in libjava as it has a
similar check.  There's also __canonicalize_funcptr_for_compare.

It's something of a puzzle as to why this didn't appear in testing.
It suggests we aren't testing the build libraries but installed libraries.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Reproducible random python crash.
Date: Mon, 24 Aug 2009 10:01:17 -0400 (EDT)
Message-ID: <20090824140118.349324E09@hiauly1.hia.nrc.ca>
References: <119aab440908240347g6ac30876x7ef9106717c3360b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440908240347g6ac30876x7ef9106717c3360b@mail.gmail.com> from "Carlos O'Donell" at Aug 24, 2009 06:47:36 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Any idea what might be the cause?

No.  I looked at two core dumps briefly.  In the first, it looked
like the PIC register value was corrupt causing a transfer to page
0.  In the second, there wasn't any backtrace info (both pc and rp
were 0).   Unfortunately, this doesn't say much.

It would be fantastic if you could narrow this down.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Mon, 6 Jul 2009 21:47:09 -0400 (EDT)
Message-ID: <20090707014710.EF3975022@hiauly1.hia.nrc.ca>
References: <20090706214315.GA3826@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, randolph@tausq.org,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org,
	kyle@mcmartin.ca
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090706214315.GA3826@bombadil.infradead.org> from "Kyle McMartin" at Jul 6, 2009 05:43:15 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> If I remember correctly, there's still some issues with the L2 cache on
> pa8800 that we haven't quite bothered to work out yet, since it's "good
> enough" for now. James probably knows more. It would be interesting to
> see if you could reproduce it with a UP 64-bit kernel on your C3750 to
> discount the L2 problems.

Googling, I see Grant had trouble with RCU_TORTURE_TEST=y.  Probably,
I should test current kernel to see if the problem is still present.

I guess you are referring to this change:
http://fossplanet.com/linux.debian.devel.kernel.cvs/thread-4378354-r7141-patches/

I'm thinking we must be missing a flush...  Maybe in clear_user_page
as for copy_user_page?

Do the problematic debian buildd machines have pa8800/pa8900 processors?

My sense is that some change (probably to the core memory management
code) made the coherence issue worse post 2.6.22.x.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: GCC incorect branching bug
Date: Sun, 30 Dec 2007 20:04:09 -0500 (EST)
Message-ID: <200712310104.lBV149R3025579@hiauly1.hia.nrc.ca>
References: <20071230230820.637c0c3a@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071230230820.637c0c3a@bleh.bxl.tuxicoman.be> from "Guy Martin" at Dec 30, 2007 11:08:20 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It seems that current gcc suffers from a branching bug.
> Please see http://bugs.gentoo.org/show_bug.cgi?id=203543 for the full
> bug details.

Without looking, I would guess this another reorg bug due to
delay slot optimizations.  There was one fixed on head a couple
of weeks ago.

Would you please file a GCC PR and add me to CC list?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

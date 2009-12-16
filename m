From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: my usual problem with 64bit kernel
Date: Tue, 15 Dec 2009 23:21:51 -0500 (EST)
Message-ID: <20091216042152.93A0B4ED7@hiauly1.hia.nrc.ca>
References: <20091216033704.GI28962@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091216033704.GI28962@bombadil.infradead.org> from "Kyle McMartin" at Dec 15, 2009 10:37:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Dec 15, 2009 at 09:25:47PM +0100, Domenico Andreoli wrote:
> > (as did 2.6.22). after it, it hangs at "Releasing cpu 1 now,
> > hpa=fffffffffffa2000" but CONFIG_DEBUG_SPINLOCK is _not_ set, the
> > opposite i reported in this thread at 64bit and consistently with
> > current 2.6.32 at 32bit.
> > 
> > i'm pretty confused by the whole thing but i'm sure about this bisection,
> > i double-checked it. here is the diff.
> > 
> 
> thanks for bisecting it. i'll take a look unless you beat me to it.

The removal of this change caused similar problems on a couple of
other targets.  It's a bit strange since this change was only installed
for a brief time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

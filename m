From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: my usual problem with 64bit kernel
Date: Tue, 15 Dec 2009 22:37:04 -0500
Message-ID: <20091216033704.GI28962@bombadil.infradead.org>
References: <20091204172838.GA4551@raptus.dandreoli.com> <4B1959E2.1030700@gmx.de> <20091205083511.GA6559@raptus.dandreoli.com> <20091207234404.GA5083@raptus.dandreoli.com> <20091209235038.GA12806@raptus.dandreoli.com> <20091215202547.GA18193@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091215202547.GA18193@raptus.dandreoli.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 15, 2009 at 09:25:47PM +0100, Domenico Andreoli wrote:
> (as did 2.6.22). after it, it hangs at "Releasing cpu 1 now,
> hpa=fffffffffffa2000" but CONFIG_DEBUG_SPINLOCK is _not_ set, the
> opposite i reported in this thread at 64bit and consistently with
> current 2.6.32 at 32bit.
> 
> i'm pretty confused by the whole thing but i'm sure about this bisection,
> i double-checked it. here is the diff.
> 

thanks for bisecting it. i'll take a look unless you beat me to it.

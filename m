From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] gettimeofday() issue on D270
Date: Sun, 27 Aug 2006 23:12:05 +0200
Message-ID: <20060827231205.487025b1.gmsoft@tuxicoman.be>
References: <20060827222653.3f3ef48d.gmsoft@tuxicoman.be>
	<200608272107.k7RL7frm018389@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608272107.k7RL7frm018389@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



This is a 32 bit kernel.

On Sun, 27 Aug 2006 17:07:41 -0400 (EDT)
"John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:

> > So far I was able to workaround the problem by making gettimeoffset() return 0 instead of the actual result. This is in arch/parisc/kernel/time.c.
> > It looks like gettimeoffset() returns a very large value when there is load on the system.
> > This value seems to be adding 27 secs to the actual time one every 5 to 10 seconds. I poll every second.
> 
> Is this a 64 or 32 bit kernel?  The size of long changes.  There may
> be a subtle issue with cr16.  It's reads as a 64 bit register.  However,
> on writes, only the least significant matter.  I could see missing
> a timer interrupt if we get close too close to the compare value.
> The 27 seconds might be the time for the counter to wrap.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

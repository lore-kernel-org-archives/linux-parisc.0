From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 4 Sep 2006 19:52:51 -0400 (EDT)
Message-ID: <200609042352.k84NqpuE028835@hiauly1.hia.nrc.ca>
References: <1157410039.3513.26.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157410039.3513.26.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Sep 4, 2006 05:47:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> +	if (likely(now - next_tick < clocktick)) {
> +		nticks = 1;
>  		next_tick += clocktick;
> -		nticks++;
> +	} else {
> +		nticks = ((now - next_tick)/clocktick) + 1;
> +		next_tick += clocktick*nticks;
> +	}

I'd rather loop if now - next_tick isn't too many ticks.  Integer
division and multiplation are very expensive, particularly when
running in 64-bit mode.  We don't have optimized millicode to do it.
So, I don't much like falling into the unlikely case if we are just
delayed one tick.

I'm still concerned that we may take a TLB exception in this code
and substantially increase the calculation time.

It's somewhat unclear whether any of these tweaks will solve the
B160 issue.  The halftick margin may not be enough in the slow
path at 1000 Hz and decreasing the tick rate may be the only fix
on slow machines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

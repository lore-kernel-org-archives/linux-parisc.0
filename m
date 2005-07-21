From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Thu, 21 Jul 2005 06:30:45 -0600
Message-ID: <20050721123045.GA27330@colo.lackof.org>
References: <20050720122227.GK10156@parcelfarce.linux.theplanet.co.uk>
	<20050721043626.GY30182@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050721043626.GY30182@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 21, 2005 at 12:36:27AM -0400, Carlos O'Donell wrote:
> We need better tools for this... I wonder if we still have lkcd support
> for hppa.

I have the "most recent" (2.4.20) patch from Bruno Vidal 
and he had it working on most of the platforms (32 and 64-bit).
It didn't get included becuase of (my) lack of time to integrate
and the fact that it wasn't popular at the time. I'm really
happy to see that's changed.

Bruno, is that posted someplace publicly or can I post it?
(I'm hoping Bruno is still subscribed to p-l)

> If we had lkcd support would you be willing to run a modified kernel on
> parisc-linux?

I would.
In fact, I'd change all the default config files to include it.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

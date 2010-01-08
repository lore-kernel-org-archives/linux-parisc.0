From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 16:56:25 -0500
Message-ID: <20100108215625.GH19179@bombadil.infradead.org>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca> <4B47A130.8060603@gmx.de> <119aab441001081344j38000314p1931df34149eabd3@mail.gmail.com> <119aab441001081344i7eb3c3f3s9c22eeaecf4d0e1a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001081344i7eb3c3f3s9c22eeaecf4d0e1a@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 08, 2010 at 04:44:51PM -0500, Carlos O'Donell wrote:
> >
> > However, I think Dave is on to something with the
> 
> ...kernel issue.
> 
> We might have *several* outstanding bugs :-)
> 

Hrm. We discussed this on IRC a while ago, I can't remember what we
decided was the best approach... there's probably many many dragons
here.

I wonder what would break if we set any EAGAIN returns to EWOULDBLOCK in
the exit path.

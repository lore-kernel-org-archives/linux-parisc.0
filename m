From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Mon, 17 Dec 2007 18:53:48 -0500 (EST)
Message-ID: <200712172353.lBHNrnWf001417@hiauly1.hia.nrc.ca>
References: <20071216183215.GB8558@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@hera.kernel.org, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071216183215.GB8558@fattire.cabal.ca> from "Kyle McMartin" at Dec 16, 2007 01:32:15 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Dec 16, 2007 at 01:29:38PM -0500, John David Anglin wrote:
> > I built a SMP PA8800 configuration from this respository yesterday.
> > Aside from the timeout issue that I've mentioned before, I've experienced
> > erratic login behavior with this new kernel.  I see this in the debug log:
> > 
> 
> is this using debian sid? or testing? possibly during the update to
> glibc 2.7 a regression crept in?

Haven't seen any issues after deleting nscd.  However, I built a
kernel defaulted from the 2.6.22 .config on gsyprf11 yesterday.  This
one panics during boot.  It's in /boot/vmlinux-2.6.24-rc4.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

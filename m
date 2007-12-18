From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Tue, 18 Dec 2007 00:27:50 -0500
Message-ID: <20071218052750.GD16467@fattire.cabal.ca>
References: <20071216183215.GB8558@fattire.cabal.ca> <200712172353.lBHNrnWf001417@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@hera.kernel.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200712172353.lBHNrnWf001417@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 17, 2007 at 06:53:48PM -0500, John David Anglin wrote:
> > On Sun, Dec 16, 2007 at 01:29:38PM -0500, John David Anglin wrote:
> > > I built a SMP PA8800 configuration from this respository yesterday.
> > > Aside from the timeout issue that I've mentioned before, I've experienced
> > > erratic login behavior with this new kernel.  I see this in the debug log:
> > > 
> > 
> > is this using debian sid? or testing? possibly during the update to
> > glibc 2.7 a regression crept in?
> 
> Haven't seen any issues after deleting nscd.  However, I built a
> kernel defaulted from the 2.6.22 .config on gsyprf11 yesterday.  This
> one panics during boot.  It's in /boot/vmlinux-2.6.24-rc4.
>

sigh, i bet this is 84f4506cb788d85a50c97b399f2999f90e6272b0[1]

does gsyprf11 have a quad port ethernet card installed?

cheers, kyle

1.
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=84f4506cb788d85a50c97b399f2999f90e6272b0

From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [git patches] parisc bug fixes for 2.6.25
Date: Mon, 17 Mar 2008 10:52:36 -0400
Message-ID: <20080317145236.GC3904@phobos.i.cabal.ca>
References: <20080316192152.GB3904@phobos.i.cabal.ca> <20080317143859.589684E7B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080317143859.589684E7B@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 17, 2008 at 10:38:58AM -0400, John David Anglin wrote:
> > On Sun, Mar 16, 2008 at 02:22:20PM -0400, Carlos O'Donell wrote:
> > > On Sun, Mar 16, 2008 at 1:35 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > > > The following changes since commit cdeeeae056a429e729ae9e914fa8142ee45bee93:
> > > >   Linus Torvalds (1):
> > > >         Linux 2.6.25-rc5
> > > 
> > > Thanks!
> > > 
> > > What hardware is this known to boot on? I want to update my base
> > > kernel for userspace testing, currently 2.6.20.
> > > 
> > 
> > no idea. it booted on my rp3440 and c8k
> 
> It also boots on my c3750 (32-bit kernel).  However, sshd still is doing
> wierd stuff.  Here's another example.
> 
> Mar 17 10:28:11 xxxxxx sshd[22586]: fatal: Privilege separation user sshd does not exist
> 

I don't see this... what is the machine running? I'm concerned maybe one
of the new syscalls is being used in glibc or something.

> This security bug leaves the system wide open to being compromised, so
> I'm not going to use it.  I like 2.6.22.19 + Kyle's compat_sys_getdents
> and irq.c patches.
> 

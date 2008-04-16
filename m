From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: ls -l is broken
Date: Wed, 16 Apr 2008 13:21:24 -0400
Message-ID: <20080416172124.GA7475@phobos.i.cabal.ca>
References: <20080416142750.GD27875@phobos.i.cabal.ca> <20080416171553.39A0B4DF2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, lamont@debian.org,
	debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080416171553.39A0B4DF2@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 16, 2008 at 01:15:52PM -0400, John David Anglin wrote:
> > Nevermind, it's failing because you don't have XATTRs enabled on ext3.
> 
> That sounds right.  I remember now that there's also an issue with
> ls --full-time support on some file systems.
> 

The problem is, this seems to be causing failures on the buildds, which
probably need XATTRs enabled as well. I've added lamont to the CC list,
hopefully he can shed a bit of light on this.

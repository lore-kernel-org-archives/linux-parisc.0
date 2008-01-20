From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Terrible PA8800 SMP Performance
Date: Sun, 20 Jan 2008 15:10:42 -0500
Message-ID: <20080120201042.GA1781@phobos.i.cabal.ca>
References: <200801201955.m0KJtIer026663@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200801201955.m0KJtIer026663@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 20, 2008 at 02:55:18PM -0500, John David Anglin wrote:
> I've been doing GCC builds on a four processor PA8800 currently
> running 2.6.24-rc6.  With make -j 6 bootstrap, this machine is
> several hours slower than gsyprf11 doing the same GCC build and
> check.  gsyprf11 is a two processor PA8700 and I typically
> use make -j 4 on it.  The PA8800 is also slower than my c3750.
> 

flushing 32MB of cache on every fork and exec? :/

cheers,
	kyle

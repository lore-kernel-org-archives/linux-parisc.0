From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 14/22] parisc: %pF is only for function pointers
Date: Thu, 12 Mar 2015 21:48:20 +0200
Message-ID: <20150312194820.GF587@fuloong-minipc.musicnaut.iki.fi>
References: <1426130037-17956-1-git-send-email-scottwood@freescale.com>
 <1426130037-17956-14-git-send-email-scottwood@freescale.com>
 <1426162282.2146.77.camel@HansenPartnership.com>
 <1426176869.30327.113.camel@freescale.com>
 <1426183481.2146.80.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Scott Wood <scottwood@freescale.com>, trivial@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1426183481.2146.80.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Thu, Mar 12, 2015 at 02:04:41PM -0400, James Bottomley wrote:
> On Thu, 2015-03-12 at 11:14 -0500, Scott Wood wrote:
> > On Thu, 2015-03-12 at 08:11 -0400, James Bottomley wrote:
> > > On Wed, 2015-03-11 at 22:13 -0500, Scott Wood wrote:
> > > > Use %pS for actual addresses, otherwise you'll get bad output
> > > > on arches like ppc64 where %pF expects a function descriptor.  Even on
> > > > other architectures, refrain from setting a bad example that people
> > > > copy.
> > > 
> > > Are you sure about this?  Parisc64 is a function description
> > > architecture.  There may be a misunderstanding about what
> > > __builtin_return_address(0) is supposed to return, but I'm certain the
> > > person who added the code thought it returned a function pointer, which
> > > on parisc64 would be a descriptor.
> > 
> > I wasn't aware that parisc64 used descriptors, but I don't see how you'd
> > get one out of __builtin_return_address(0) since it's not usually a
> > function entry point (plus, GCC documents it as returning void *).
> 
> I was more thinking that this message is printed for every boot with a
> superio chip (which is a lot of our boxes).  How come no-one has
> complained on parisc64 if it's doing the wrong thing.

It's dead code behind #ifdef DEBUG_SUPERIO_INIT.

A.

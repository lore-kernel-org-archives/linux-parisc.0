Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 4 Dec 2002 10:12:47 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: LaMont Jones <lamont@b180.mmjgroup.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] airo.c patch for hppa
Message-ID: <20021204171247.GA11629@dsl2.external.hp.com>
References: <20021204050640.GA22117@b180.mmjgroup.com> <20021204144454.P27991@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021204144454.P27991@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Dec 04, 2002 at 02:44:54PM +0000, Matthew Wilcox wrote:
> Grant, I think this is a long-standing bug (Jan 2000!) in
> Dino's port IO macros.

It sounds like there is...

...
> That '& ~3' clears the bottom two bits of the address, so we always read
> from a 32-bit aligned address, even if we actually wanted to read the
> other 16-bit word or one of the other bytes.

The Dino ERS clearly says the AD[0:1] are used for IO Port space.

I gather IO_DATA behaves differently than MEM_DATA.
MEM_DATA definitely uses byte enables to manage subword bytes
and ignores the lower two bits of the address. The GSC byte enables
are forwarded to the PCI bus when doing subword MMIO reads.
Because MEM_DATA was added much later, it seems to have been implemented
with more insight into how GSC/PCI can interact.

> The PORT_OUT define doesn't mask that way:

Right.

...
> LaMont's doing a rebuild now to check it works, but this seems fairly
> obvious to me.  Thoughts?  (Can _anyone_ remember what they were thinking
> when they wrote code nearly three years ago?  ;-)

You are on the right track. And no, I don't remember.

thanks,
grant

From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Tue, 18 Aug 2009 19:09:24 -0500
Message-ID: <1250640565.15079.3.camel@mulgrave.site>
References: <4A89CC4D.5040801@gmx.de>
	 <1250549376.7858.96.camel@mulgrave.site>
	 <200908181248.52572.rusty@rustcorp.com.au>
	 <20090818050637.4C3E74730F@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Rusty Russell <rusty@rustcorp.com.au>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090818050637.4C3E74730F@magilla.sf.frob.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[resending, fluffed reply-all]

On Mon, 2009-08-17 at 22:06 -0700, Roland McGrath wrote:
> > I'd be happy to fail to load it.  There might be sysfs issues with it too.
> 
> That sounds reasonable to me.  And I'd be happy to at least look a little
> and maybe give some advice to anybody who finds themself building such a
> (free) module, doesn't know why or how it got that way, and wants to ask.

Actually, for parisc, its not reasonable.  It's expected that our
modules have multiple text sections (we have to use -ffunction-sections
to generate them in order that the PCREL17 jump stubs can be
interleaved).

The problem looks to be that some linker error gave the one of the named
function text sections a duplicate name.  Helge, can you post he objdump
info that shows which section had a duplicate name?

Even with the duplicate name, though, the module should be perfectly
loadable.

James



From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Tue, 18 Aug 2009 17:14:24 -0700 (PDT)
Message-ID: <20090819001424.4C1144730F@magilla.sf.frob.com>
References: <4A89CC4D.5040801@gmx.de>
	<1250549376.7858.96.camel@mulgrave.site>
	<200908181248.52572.rusty@rustcorp.com.au>
	<20090818050637.4C3E74730F@magilla.sf.frob.com>
	<1250640565.15079.3.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rusty Russell <rusty@rustcorp.com.au>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: James Bottomley's message of  Tuesday, 18 August 2009 19:09:24 -0500 <1250640565.15079.3.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Actually, for parisc, its not reasonable.  It's expected that our modules
> have multiple text sections (we have to use -ffunction-sections to
> generate them in order that the PCREL17 jump stubs can be interleaved).

I don't think you need what you think you need.  Having lots of sections in
your .o's when you compile is fine.  These should be combined by the linker
script that creates the .ko, however.  Unless I am missing something, there
is no purpose to this section distinction at insmod time--it's only
important for the relative layout of the parts of the .ko's text, which
winds up contiguous whether laid out that way at ld -r (.ko creation) time
or at insmod time.

> Even with the duplicate name, though, the module should be perfectly
> loadable.

But its /sys/module/foo/sections/ virtual directory becomes useless,
as a single name space can no longer describe what sections it has.
So perhaps it is then proper for add_sect_attrs() to punt on it.
But that reduces the functionality you get from CONFIG_KALLSYMS.


Thanks,
Roland

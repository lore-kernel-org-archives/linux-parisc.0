From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Mon, 17 Aug 2009 22:06:37 -0700 (PDT)
Message-ID: <20090818050637.4C3E74730F@magilla.sf.frob.com>
References: <4A89CC4D.5040801@gmx.de>
	<1250549376.7858.96.camel@mulgrave.site>
	<200908181248.52572.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: Rusty Russell's message of  Tuesday, 18 August 2009 12:48:52 +0930 <200908181248.52572.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I'd be happy to fail to load it.  There might be sysfs issues with it too.

That sounds reasonable to me.  And I'd be happy to at least look a little
and maybe give some advice to anybody who finds themself building such a
(free) module, doesn't know why or how it got that way, and wants to ask.

> No, the real problem is that it ignores failure.  I'd much rather fail
> the module load than various features mysteriously MIA.

In that regard, I just made add_notes_attrs() follow the model of
add_sect_attrs(), which (gracefully) ignores all its failures.  I don't
know what the thought behind that was.  My only guess was that since this
is all CONFIG_KALLSYMS-only features, that someone thought turning on
CONFIG_KALLSYMS should not add new ways to lose that weren't there before,
only new ways to lose the new features that weren't there before either.
Having these other alloc/sysfs failures cause the module load to fail would
certainly be fine with me.


Thanks,
Roland

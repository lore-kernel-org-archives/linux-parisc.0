From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Tue, 18 Aug 2009 12:48:52 +0930
Message-ID: <200908181248.52572.rusty@rustcorp.com.au>
References: <4A89CC4D.5040801@gmx.de> <1250549376.7858.96.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Cc: Helge Deller <deller@gmx.de>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	Roland McGrath <roland@redhat.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1250549376.7858.96.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 18 Aug 2009 08:19:36 am James Bottomley wrote:
> The root cause is a duplicate section name (.text); is this legal?

I'd be happy to fail to load it.  There might be sysfs issues with it
too.

> However, there's a problem with commit
> 6d76013381ed28979cd122eb4b249a88b5e384fa in that if you fail to allocate
> a mod->sect_attrs (in this case it's null because of the duplication),
> it still gets used without checking in add_notes_attrs()
> 
> This should fix it

No, the real problem is that it ignores failure.  I'd much rather fail
the module load than various features mysteriously MIA.

Which brings us to "patches which don't go thru the maintainer" (or
perhaps, non-responsive maintainers who get bypassed).

Thanks,
Rusty.

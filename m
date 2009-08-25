From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Tue, 25 Aug 2009 17:07:01 +0930
Message-ID: <200908251707.01610.rusty@rustcorp.com.au>
References: <4A89CC4D.5040801@gmx.de> <20090818050637.4C3E74730F@magilla.sf.frob.com> <1250640565.15079.3.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Cc: Roland McGrath <roland@redhat.com>, Helge Deller <deller@gmx.de>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1250640565.15079.3.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 19 Aug 2009 09:39:24 am James Bottomley wrote:
> Even with the duplicate name, though, the module should be perfectly
> loadable.

In a perfect world, yes, but there are places which assume they'll be
unique and I always thought that reasonable.

Front of my mind is /sys/module/<MODNAME/sections/ which has one file
per section.

Let's figure out how it happened tho; I'd rather fail cleanly than break
subtly and horribly later...

Thanks,
Rusty.

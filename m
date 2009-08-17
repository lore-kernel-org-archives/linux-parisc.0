From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Mon, 17 Aug 2009 16:54:38 -0700 (PDT)
Message-ID: <20090817235438.8846B4730F@magilla.sf.frob.com>
References: <4A89CC4D.5040801@gmx.de>
	<1250549376.7858.96.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: James Bottomley's message of  Monday, 17 August 2009 22:49:36 +0000 <1250549376.7858.96.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The root cause is a duplicate section name (.text); is this legal?

It's a complicated subject, but I don't think they should ever actually
exist in a .ko.  The linker script for making .ko's should take care of
that.  But if modules do some crazy things like using section groups
(e.g. for COMDAT, i.e. compile C++ code into modules) then I'm not sure how
easy it is to get ld to combine things ideally as we'd like.

Suffice it to say that any occurrence of this merits further investigation.
It is certainly a red flag at first blush (as it were).

> However, there's a problem with commit
> 6d76013381ed28979cd122eb4b249a88b5e384fa in that if you fail to allocate
> a mod->sect_attrs (in this case it's null because of the duplication),
> it still gets used without checking in add_notes_attrs()
> 
> This should fix it

Yes, good catch.  Sorry about that complete failure of defensive programming.

Acked-by: Roland McGrath <roland@redhat.com>


Thanks,
Roland

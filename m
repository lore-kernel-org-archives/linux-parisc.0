Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA13800
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 17:44:27 -0700
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] status page
References: <20001220001839.A915@parcelfarce.linux.theplanet.co.uk>
From: David Huggins-Daines <dhd@eradicator.org>
Date: 19 Dec 2000 19:41:05 -0500
In-Reply-To: Matthew Wilcox's message of "Wed, 20 Dec 2000 00:18:39 +0000"
Message-ID: <87u27zj55q.fsf@cepstral.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox <matthew@wil.cx> writes:

> is
> 
> <li> dynamic kernel stack and fix the handling of the initial stack frame.
>         (<a href="mailto:Volunteer">Volunteer?</a>)
> 
> the work that i've just done?  if not, what does it mean?

Yes, the work that you've just done (along with the work Richard did
some time ago to make it so we weren't just mapping 0x10000000 of
stack space on exec).

> if someone thinks it means dynamically growing the kernel stack, we can't do
> this.

I don't know where the 'kernel' bit got put in to that item
... perhaps you should check CVS blame? :-)

-- 
David Huggins-Daines		-		dhd@eradicator.org

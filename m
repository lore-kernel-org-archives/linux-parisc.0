Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA19028
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Aug 1999 12:52:08 -0600
Date: Wed, 18 Aug 1999 20:53:34 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 'architected'?
Message-ID: <19990818205334.G5823@suse.de>
References: <37B9CEDE.9F09087E@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <37B9CEDE.9F09087E@thepuffingroup.com>; from Alex deVries on Tue, Aug 17, 1999 at 05:06:38PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> So, I've been rereading some docs lately, and am wondering what
> 'architected' really is.  

Isn't the obvious meaning "defined by the architecture" as opposed to
implementation-specific ?

> "The architected operation of a module (including execution of a PDC)
> must not require the use of any non-architected PDC procedures.  It must
> also not require the use of any non-architected options in architected
> PDC produces."

"You don't have to do implementation-specific things unless you want to do
implementation-specific things", I guess.

	Philipp Rumpf

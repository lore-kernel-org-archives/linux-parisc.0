Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA06284
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Dec 1999 01:29:05 -0700
Sender: adevries@thepuffingroup.com
Message-ID: <3857507B.3248918E@thepuffingroup.com>
Date: Wed, 15 Dec 1999 03:25:31 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
CC: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP releasing docs...
References: <E11y4LG-0000tV-00@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> If
> its carrying on as an open public port and HP are willing to open all
> their document access and like to other folks I dont see a problem. 

Having HP opening up documents is probably more difficult than most of
you realize, and in the same way that other hardware vendors can't
release documents on portions of hardware for fear of releasing
competitive information, HP is limited as well.  Expecting HP to open up
*all* documentation is unrealistic.

Also, releasing the documentation isn't just pressing the magic button
labelled "Release Publicly" in red.  The docs have to be found,
screened, edited, reformatted etc. 

Ideally, though, developers will have access to all the hardware they're
porting to. 

What's second best is to be able to do development of certain portions
under NDA.  This can be used when the docs for the hardware *can't* be
released, or when they're not ready to be released.  Advanced viewing
helps out a lot.

The Puffin Group's set up to do this, although we haven't generated any
useable code in this situation yet.  Signing such NDAs has helped us
with quite a few other ways though, in terms of planning.  The open
source linker would never have happened, for instance.

NDA's aren't quite the evil they're made out to be, having them has
really given us a better insight into how to do parisc-linux.

- Alex
-- 
Alex deVries
Vice President of Engineering
The Puffin Group

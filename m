Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA15766
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Jun 1999 18:34:01 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3779683B.E5447116@thepuffingroup.com>
Date: Tue, 29 Jun 1999 20:43:39 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Stan Sieler <sieler@allegro.com>
CC: Davin Petersen <davinp@celltech.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] H60
References: <199906300013.RAA31617@bart.allegro.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Stan Sieler wrote:
> 
> Re:
> > related to the 9000/800 H60.  Am I wrong?  Would it be useful in
> > developing the HP9K kernel?
> 
> It's the same as a G60 (96 MHz, PA7100, HP-PB, 2048 KB cache)
> Also same as I60.
> 
> Of course, I don't know if either of those are in the docs :)

First, yes, the goal is to have it running on the G60/I60 and H60.

However, HP's only released documentation for a certain subset of the
machines available. 

The 7100 CPU shouldn't be too difficult, it's what's in a lot of 712s. 
What kind of peripheral devices are in the G/H/I60?

It'd be good if we could start a document that contained a list of the
internal chips we're finding in all these machines.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group

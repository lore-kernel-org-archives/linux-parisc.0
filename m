Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA07912
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Mar 2000 11:33:24 -0700
From: willy@thepuffingroup.com
Date: Wed, 29 Mar 2000 13:52:20 -0500
To: Corne Beerse <beerse@ats.nld.alcatel.nl>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Couple of questions
Message-ID: <20000329135220.B5424@thepuffingroup.com>
References: <852568B0.005CB5C5.00@tormta3.tor.cel.com> <38E1C69C.1BEB8F9C@ats.nld.alcatel.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38E1C69C.1BEB8F9C@ats.nld.alcatel.nl>; from Corne Beerse on Wed, Mar 29, 2000 at 11:02:20AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 29, 2000 at 11:02:20AM +0200, Corne Beerse wrote:
> btw, if I reply to messages received trouth parisc-linux@thepuffingroup.com,
> it replies only to the originator, not to the puffin list. Other maillists
> generate a Reply-to: header line with the maillist address. Can this be
> added to the puffin headers too? Or are there reasons not to do it?

The current behaviour is correct.  If you want to reply to the person
sending the message privately, you reply; if you want to reply to the
list, you reply to all (possibly trimming the cc list as appropriate).
With the reply-to header, there is no way to accomplish this.  I'm sure
I've seen more than one `Considered Harmful' document on this subject.

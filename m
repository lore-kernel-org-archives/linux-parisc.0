Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA07533
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Sep 1999 08:09:54 -0600
Date: Mon, 27 Sep 1999 16:12:13 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: phi@tcleur.france.hp.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] endianism
Message-ID: <19990927161213.V5481@suse.de>
References: <37EF3716.2785C0E6@tcleur.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <37EF3716.2785C0E6@tcleur.france.hp.com>; from phi@tcleur.france.hp.com on Mon, Sep 27, 1999 at 11:21:26AM +0200
List-ID: <linux-parisc.vger.kernel.org>

> What is the endianism expected for hppa linux, as the processor can do
> both?

Big-endian for now.  Little-endian userspace might be added later if someone
wants it, little-endian kernel sounds unlikely.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA26322
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 11:39:16 -0700
Date: Mon, 22 Nov 1999 19:42:18 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Stan Sieler <sieler@allegro.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991122194218.B1009@mathe.stud.uni-erlangen.de>
References: <199911221811.NAA27290@hiauly1.hia.nrc.ca> <199911221827.KAA13990@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911221827.KAA13990@opus.allegro.com>
List-ID: <linux-parisc.vger.kernel.org>

> Our K460 gets twice the MIPs you'd expect ... i.e., it executes a simple 
> timing loop at about 360 million instructions per second ... 
> on a single CPU machine with a 180 MHz clock!

Keep in mind the "subtract one and branch if register non-zero" is really
only a single instruction - and the following one you can always send to
another pipeline because of the two-entry IAOQ thing.

You can see the same effect on many x86 CPUs, some PPCs and probably other
animals as well.

	Philipp Rumpf

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA17772
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 08:57:16 -0700
Date: Mon, 22 Nov 1999 16:54:33 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        dave@hiauly1.hia.nrc.ca, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991122165433.A935@mathe.stud.uni-erlangen.de>
References: <19991122092412.C1310@mathe.stud.uni-erlangen.de> <E11pqGK-0003IA-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E11pqGK-0003IA-00@the-village.bc.nu>
List-ID: <linux-parisc.vger.kernel.org>

> On x86 things like this, and execution timing differences caused by cache
> line alignment and other phase-of-moon issues eventually lead us to not inline
> the function. Even then we had to land it on a 32 byte boundary

That's why I'm thinking about switching to a loop not based upon the time
it takes to execute instructions at all (see CR16 loop).  x86 doesn't have
the option (well, on Pentiums and above you have).

	Philipp Rumpf

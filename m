Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA02965
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 08:45:14 -0700
Date: Tue, 23 Nov 1999 12:47:18 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991123124718.D1009@mathe.stud.uni-erlangen.de>
References: <19991122193347.A1009@mathe.stud.uni-erlangen.de> <199911222055.PAA01550@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911222055.PAA01550@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> My timing tests on a 735 indicate that the loop with two addib instructions
> is only 25% faster than a loop with one addib and one nop.

Who cares about how fast the loop is, actually ?

> You are correct that there are only two actual instructions in the loop.
> However, the timing measurements indicate that the two addib loop stalls
> for one instruction time.  Thus, effectively there is an extra nop in your
> loop.

> As a result, my comments re the BogoMIPS calculation below are correct for
> a 735 PA7100.  I think the stall is on the second addib when the forward
> branch is not taken.

Forward branches should be predicted not taken.

	Philipp Rumpf

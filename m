Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA15196
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 12:52:58 -0700
Date: Wed, 24 Nov 1999 20:56:08 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Frank Rowand <frowand@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: itmr rollover in delay loop
Message-Id: <19991124205608.K1009@mathe.stud.uni-erlangen.de>
References: <199911241936.LAA19634@xsvr4.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911241936.LAA19634@xsvr4.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> >>       while(((cr16+loops)-mfctl(16))>0);

>         printf("0x%x  0x%x  0x%x  %s\n", a, b, (b-a), (0 < (int)(b-a)) ? "y" : "n");
>         b++;

Note that Frank is modifying b, and evaluating  0 < (int)(b-a), while in
the original example, the modified term was subtracted from the constant
(for one call) one, so it would have been (int)(a-b) > 0 using Frank's
variable names.  This explains why Frank is still seeing "n" for a == b
while I am already seeing false.

	Philipp Rumpf

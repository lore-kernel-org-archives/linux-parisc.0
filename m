Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA18596
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 15:49:24 -0700
Date: Wed, 17 Nov 1999 23:52:20 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        frowand@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991117235220.E10209@mathe.stud.uni-erlangen.de>
References: <19991117230531.D10209@mathe.stud.uni-erlangen.de> <199911172239.RAA02116@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911172239.RAA02116@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> Here is an example called from sys_pipe:
> 
> 0xc0015538 <pdc_console_init+88>:       ldil -3ff72800,r1
> 0xc001553c <pdc_console_init+92>:       be,n 3c0(sr7,r1)
> 
> I can't find where sr7 is initialized.

It isn't, we don't need to.   This branches to
-0x3ff72800 + 0x3c0 = 0xc008dbc0.

	Philipp Rumpf

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA29314
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 12:36:11 -0600
Message-Id: <199910191836.LAA27611@milano.cup.hp.com>
To: Mike Hibler <mike@fast.cs.utah.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] LASI and serial port initialization 
In-reply-to: Your message of "Tue, 19 Oct 1999 11:32:28 PDT."
             <199910191732.LAA14850@fast.cs.utah.edu>
Date: Tue, 19 Oct 1999 11:36:50 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Mike Hibler wrote:
...
> Personally I don't see spending a lot of time worrying about this.  Our
> simple console interface with pre-init buffering has been perfectly adequate
> for us. 

I agree the pre-init buffering is perfectly acceptable. No problem.

> But our PA world is pretty simple, older 700 series machines and
> one J-series.  So the console is either the builtin serial port or the
> graphics device.  Are there that many more options now?

No. But I expect at least two more options by next year.
But even with just two options I think my reasons are valid.

grant

ps. I'm still doing homework to reply to Kirk's response about clock drift.
Short answer is I belive him about N-class and thus don't care if this is
just a T- or possibly V-class problem.

Grant Grundler
Unix Developement Lab
+1.408.447.7253

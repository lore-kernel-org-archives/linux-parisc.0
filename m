Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA32147
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Aug 1999 16:10:05 -0600
Date: Tue, 10 Aug 1999 15:09:01 -0700 (PDT)
From: Kevin Vajk <kvajk@ricochet.net>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] utssys?
In-Reply-To: <Pine.LNX.4.10.9908101340240.979-100000@sophia.localdomain>
Message-ID: <Pine.LNX.4.10.9908101505340.979-100000@sophia.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Tue, 10 Aug 1999, Kevin Vajk wrote:

> I don't know what type=2 does.

Whoops!  Yes, I do...

It implements ustat().  First argument is the dev, like this:
ustat(dev, buf) ==> utssys(buf, dev, 2)

- Kevin Vajk
  <kvajk@cup.hp.com>

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA04791
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Sep 1999 06:26:37 -0600
Date: Wed, 29 Sep 1999 14:26:52 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HOSTCC vs CC and other nits
Message-ID: <19990929142652.C20734@mencheca.ch.genedata.com>
References: <199909290605.XAA06877@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909290605.XAA06877@milano.cup.hp.com>; from Grant Grundler on Tue, Sep 28, 1999 at 11:05:27PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 28, 1999 at 11:05:27PM -0700, Grant Grundler wrote:
> o I don't have obj_dump. And I haven't the faintest clue
>   where to find it. Could we use nm instead?

objdump is part of GNU binutils.  I'm not sure why we use it rather
than nm.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

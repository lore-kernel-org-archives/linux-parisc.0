Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA02341
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 02:50:22 -0600
Date: Mon, 21 Jun 1999 10:50:17 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Jeffrey A Law <law@cygnus.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility
Message-ID: <19990621105017.N30362@mencheca.ch.genedata.com>
References: <19990620194015.J30362@mencheca.ch.genedata.com> <20550.929910096@upchuck.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20550.929910096@upchuck.cygnus.com>; from Jeffrey A Law on Sun, Jun 20, 1999 at 02:21:36PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 20, 1999 at 02:21:36PM -0600, Jeffrey A Law wrote:
> 
>   In message <19990620194015.J30362@mencheca.ch.genedata.com>you write:
>   > 
>   > How far do we want to or are we able to go with making constants identical
>   > between HPUX and Linux?
> We never bothered at the UofU.  It didn't seem worth the headache to try and
> get either HP or Berkeley to change syscall, errno or other constants.

syscall and errno values are already different on different Linux
architectures anyway, so we have a free hand here.

> Just write translators on the hpux emulation side.

Yes, this is certainly what we'll do.  But if we can be clever and get a
bunch of compatibility for free, then we should.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

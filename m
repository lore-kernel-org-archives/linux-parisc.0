Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA26155
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Aug 1999 03:31:48 -0600
Date: Mon, 30 Aug 1999 11:33:25 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: "Bill Katz William\"" <billk@sr.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] keyboard driver (fwd)
Message-ID: <19990830113325.L493@mencheca.ch.genedata.com>
References: <199908300319.UAA13901@meow.sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199908300319.UAA13901@meow.sr.hp.com>; from Bill Katz William" on Sun, Aug 29, 1999 at 08:19:21PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 29, 1999 at 08:19:21PM -0700, Bill Katz William" wrote:
> A few notes.  LASI doesn't have HIL, it has PS2.  For workstations
> of that vintage (that might have a LASI), the HIL megafunction was
> dropped into the WAX ASIC, which also has teh EISA bus bridge.
> 
> I've found the docs on the I/O subsystem for the immediately preceding
> set of workstations (715/33 /50, 735, etc), and have had it on my
> agenda to get it ready.  If that's a critical need, I'll try to
> get to it this week.  

I wouldn't call it a critical need by any stretch of the imagination.
I just wanted to point out we have an HIL driver already before someone
runs off to write one :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

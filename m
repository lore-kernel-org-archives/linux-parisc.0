Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03143
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 09:09:52 -0600
Date: Wed, 20 Oct 1999 17:10:21 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] What's in a 715?
Message-ID: <19991020171021.D25252@mencheca.ch.genedata.com>
References: <19991020073501.11967.rocketmail@web507.yahoomail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991020073501.11967.rocketmail@web507.yahoomail.com>; from Ulrich Strelow on Wed, Oct 20, 1999 at 12:35:01AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 20, 1999 at 12:35:01AM -0700, Ulrich Strelow wrote:
> Hi Alex,
> 
> I asked nearly the same question some months ago,
> because I needed to understand which CONFIG options
> should be set for my 715/33. 
> 
> Bill Katz from HP answered:
> 
> The 715/33 does NOT have either LASI or DINO. It uses
> an older I/O chip known as ASP. ASP connects the
> processor bus to several external chips, including the
> NCR 53c710, Intel LAN and WD 16C552 (? I'm doing this
> from memory) 2-serial/parallel chip. It uses the
> PA7100 CPU which does not have GSC. 

If you open the 715/33 up, it has chips called OLIN and SHINKO on the
board, as well as some unnamed chips.  Do either or both of these chips
implement ASP?  I gave Alex the details on these chips a couple of months
ago and last I heard they were on the list of documents we want from HP,
marked `desirable, but no urgency'.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

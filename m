Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA07339
	for <parisc-linux@puffin.external.hp.com>; Fri, 13 Aug 1999 20:36:32 -0600
Message-Id: <3.0.3.32.19990813193048.0072b54c@hpuxmail.cup.hp.com>
Date: Fri, 13 Aug 1999 19:30:48 -0700
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
From: Larry Dwyer <larry_dwyer@hp.com>
Subject: Re: reserving constants
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19990806004827.U11586@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

Working...-Larry

At 12:48 AM 8/6/99 +0200, Matthew Wilcox wrote:
>
>I have some more constants which need reserving.  These are in the O_*
>numberspace:
>
>#define FASYNC          00020000 /* fcntl, for BSD compatibility */
>#define O_DIRECT        00040000 /* direct disk access hint - currently
ignored */
>#define O_DIRECTORY     00010000 /* must be a directory */
>#define O_NOFOLLOW      00000200 /* don't follow links */
>
>Linux doesn't distinguish between O_NONBLOCK and O_NDELAY so I also
>defined:
>
>#define O_NONBLOCK      00200004 /* HPUX has separate NDELAY & NONBLOCK */
>#define O_NDELAY        O_NONBLOCK
>
>-- 
>Matthew Wilcox <willy@bofh.ai>
>"Windows and MacOS are products, contrived by engineers in the service of
>specific companies. Unix, by contrast, is not so much a product as it is a
>painstakingly compiled oral history of the hacker subculture." - N Stephenson
>
>

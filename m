Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA15074
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Aug 1999 16:47:23 -0600
Date: Fri, 6 Aug 1999 00:48:27 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: larry_dwyer@hp.com
Cc: parisc-linux@thepuffingroup.com
Message-ID: <19990806004827.U11586@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] reserving constants
List-ID: <linux-parisc.vger.kernel.org>


I have some more constants which need reserving.  These are in the O_*
numberspace:

#define FASYNC          00020000 /* fcntl, for BSD compatibility */
#define O_DIRECT        00040000 /* direct disk access hint - currently ignored */
#define O_DIRECTORY     00010000 /* must be a directory */
#define O_NOFOLLOW      00000200 /* don't follow links */

Linux doesn't distinguish between O_NONBLOCK and O_NDELAY so I also
defined:

#define O_NONBLOCK      00200004 /* HPUX has separate NDELAY & NONBLOCK */
#define O_NDELAY        O_NONBLOCK

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

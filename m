Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA20769
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 18:37:45 -0700
Date: Thu, 4 Nov 1999 02:39:26 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Kevin Vajk <kvajk@ricochet.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] getdents
Message-ID: <19991104023926.H25252@mencheca.ch.genedata.com>
References: <19991103031152.F25252@mencheca.ch.genedata.com> <Pine.LNX.4.10.9911031645490.25873-100000@sophia.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911031645490.25873-100000@sophia.localdomain>; from Kevin Vajk on Wed, Nov 03, 1999 at 05:12:57PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 03, 1999 at 05:12:57PM -0800, Kevin Vajk wrote:
> 
> On Wed, 3 Nov 1999, Matthew Wilcox wrote:
> 
> > struct hpux_dirent {
> > 	ino_t	d_ino;
> > 	short	d_reclen;
> > 	short	d_namlen;
> > 	char	d_name[1];
> > };
> 
> Shouldn't that be d_name[256]?

It's OK, that's only used as an offset to tell the kernel where to put the
string.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

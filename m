Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27605
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Sep 2000 12:23:26 -0600
Date: Fri, 8 Sep 2000 14:23:28 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] gcc build failure
In-Reply-To: <39B92177.34B824C6@linuxcare.com>
Message-ID: <Pine.SOL.4.21.0009081420360.28273-100000@marvin.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 8 Sep 2000, Alex deVries wrote:

> Andrew Park wrote:
> > I get the following error message when trying to build gcc.
> > I've run the contrib/cvsupdate script to update the source as well.
> 
> You're trying to use the i386 assembler!  You can fix this by first
> building and installing the cross binutils, making sure that's in your
> path, before you build gcc.
> 
> - Alex

Hmmm... my path is correct.  When cross built binutils I DID specify
--target=hppa2.0-linux, so I do not know how it could have built i386
binary instead.  Anyhow, thanks for the hint.  I'll rebuild and see
if that helps.


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27820
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Sep 2000 12:32:23 -0600
Message-Id: <200009081832.OAA08108@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc build failure
To: apark@cdf.toronto.edu (Andrew Park)
Date: Fri, 8 Sep 2000 14:32:26 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@linuxcare.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.SOL.4.21.0009081420360.28273-100000@marvin.cdf> from "Andrew Park" at Sep 8, 2000 02:23:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Fri, 8 Sep 2000, Alex deVries wrote:
> 
> > Andrew Park wrote:
> > > I get the following error message when trying to build gcc.
> > > I've run the contrib/cvsupdate script to update the source as well.
> > 
> > You're trying to use the i386 assembler!  You can fix this by first
> > building and installing the cross binutils, making sure that's in your
> > path, before you build gcc.
> > 
> > - Alex
> 
> Hmmm... my path is correct.  When cross built binutils I DID specify
> --target=hppa2.0-linux, so I do not know how it could have built i386
> binary instead.  Anyhow, thanks for the hint.  I'll rebuild and see
> if that helps.

Try `gcc -print-prog-name=as'.  This will show the full path of the
assembler.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA15418
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 03:17:55 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 14 Dec 2000 10:20:44 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 146VV2-0004ql-00; Thu, 14 Dec 2000 10:20:32 +0000
Date: Thu, 14 Dec 2000 10:20:32 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Michael Ang <mang@subcarrier.org>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] phase 2 gcc build fails
Message-ID: <20001214102032.A17802@parcelfarce.linux.theplanet.co.uk>
References: <3A38683A.A2FCB51B@subcarrier.org> <Pine.LNX.4.21.0012141742060.2565-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012141742060.2565-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Dec 14, 2000 at 05:55:54PM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 14, 2000 at 05:55:54PM +1100, Alan Modra wrote:
> Is it possible to import a vendor branch that contains new files, without
> them magically appearing when checking out the HEAD version?  I've just
> done an import from sourceware, then had to rm all the new files, cvs rm,
> cvs commit.  Which is a pain.  Also, unless people use "checkout -P", they
> get empty directories.

this isn't an answer to your question, but...

cvs rm -f file both rm's it and removes it from the repository (obviously,
you need to cvs ci afterwards).
the cvsrc we distribute in the build-tools repository has -P for cvs up.

unfortunately, cvs doesn't seem to take the `-f' option from the .cvsrc
for the rm command.

-- 
Revolutions do not require corporate support.

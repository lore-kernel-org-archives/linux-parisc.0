Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA07661
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Sep 2000 11:25:57 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Sep 2000 17:26:38 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13ct44-0002VA-00; Sat, 23 Sep 2000 18:26:16 +0100
Date: Sat, 23 Sep 2000 18:26:16 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
Message-ID: <20000923182616.A9083@parcelfarce.linux.theplanet.co.uk>
References: <39CBF956.4833E405@subcarrier.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39CBF956.4833E405@subcarrier.org>; from mang@subcarrier.org on Fri, Sep 22, 2000 at 08:29:10PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 22, 2000 at 08:29:10PM -0400, Michael Ang wrote:
> Can someone please update the recipe and cvs info on
> www.thepuffingroup.com/parisc?  Until the docs are updated, you can
> mentally substitute "linux" for "linux-2.3" and "binutils" for
> "binutils-2.10".

cvs co website, then make your changes and commit them back.  Next time
someone with the password updates the website, your changes will
appear too.

(typing make will create the .html files from the .x files so you
can check your changes.  Since mid-July, you haven't needed anything
special installed; date, cat, echo, make, mkdir... no silly binary-only
software :-)

I have some ideas for how to improve the website, but I'm going to
wait and see what the Linuxcare web team come up with before I make
any structural changes.

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA15057
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 19:16:45 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 27 Sep 2000 01:17:27 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13e5qX-0004vu-00; Wed, 27 Sep 2000 02:17:17 +0100
Date: Wed, 27 Sep 2000 02:17:17 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@thepuffingroup.com, adevries@linuxcare.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
Message-ID: <20000927021717.A18365@parcelfarce.linux.theplanet.co.uk>
References: <39CBF956.4833E405@subcarrier.org> <20000925122211.F1363@data.upl.cs.wisc.edu> <39CF91F5.DEE1C632@subcarrier.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39CF91F5.DEE1C632@subcarrier.org>; from mang@subcarrier.org on Mon, Sep 25, 2000 at 01:57:09PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 25, 2000 at 01:57:09PM -0400, Michael Ang wrote:
> The cvs tarballs on the ftp site are owned by user "adevries".  From
> this I guess that Alex has a cron job that packages the tarballs.
> 
> Alex, can you please update your scripts?

Now that Matt's buildtools are in CVS, this script should probably also
be in CVS, and it should be run by user `al-76'.  (the significance of
this name may be noted by some of you :-)

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA03037
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 07:56:40 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 16 Jan 2001 15:00:16 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14IXak-0002HW-00; Tue, 16 Jan 2001 15:00:10 +0000
Date: Tue, 16 Jan 2001 15:00:10 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Greg Ingram <ingram@symsys.com>
Cc: Ryan Bradetich <rbradetich@uswest.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 Boots! (Mostly)
Message-ID: <20010116150010.C20275@parcelfarce.linux.theplanet.co.uk>
References: <3A637862.C312CD12@uswest.net> <Pine.LNX.4.21.0101160839390.25295-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101160839390.25295-100000@maestro.symsys.com>; from ingram@symsys.com on Tue, Jan 16, 2001 at 08:40:43AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 16, 2001 at 08:40:43AM -0600, Greg Ingram wrote:
> I grabbed the one labelled as latest from the CVS directory on the FTP
> site.  Is that the latest? 

dunno, does `grep ttyS0 palo/Makefile' reveal anything?  if yes, it's
the latest.  and you can always `cvs up' in the palo directory to get
the latest version.

-- 
Revolutions do not require corporate support.

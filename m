Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id HAA16284
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 07:00:05 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14GLdl-0001bJ-00; Wed, 10 Jan 2001 13:50:13 +0000
Date: Wed, 10 Jan 2001 13:50:13 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Gnu cpp bug or feature?
Message-ID: <20010110135013.B5884@parcelfarce.linux.theplanet.co.uk>
References: <200101100631.XAA16714@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101100631.XAA16714@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Tue, Jan 09, 2001 at 11:31:49PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 09, 2001 at 11:31:49PM -0700, John Marvin wrote:
> 
> I just discovered that the gnu cpp doesn't allow * and = to be concatenated.
> What I am trying to do is the following:

GNU cpp does do some slightly strange things to avoid accidentally creating
C tokens.  However, you should be able to work around this behaviour by using
the ## operator.  try...

>     ADDIB>      -1,%r1,1b
>     ADDIB=      -1,%arg3,fdoneloop

ADDIB##>
ADDIB##=

instead?

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51F55482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Jun 2001 13:20:58 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA05832
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Jun 2001 13:13:26 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 3 Jun 2001 19:20:46 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 156dQW-0000Vv-00; Sun, 03 Jun 2001 20:20:40 +0100
Date: Sun, 3 Jun 2001 20:20:40 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Jim Buttafuoco <jim@buttafuoco.org>,
	PARISC-LINUX Mailing List <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] .9 install problems on a 735
Message-ID: <20010603202040.L7349@parcelfarce.linux.theplanet.co.uk>
References: <200106021656.MAA18064@p2.buttafuoco.net> <20010602191635.D25745@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010602191635.D25745@linuxcare.com>; from rhirst@linuxcare.com on Sat, Jun 02, 2001 at 07:16:35PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 02, 2001 at 07:16:35PM +0100, Richard Hirst wrote:
> I had it hang on my 715/old, because of problems with the alignment
> of locks in glibc 2.2.1.  The installer is based on glibc 2.2.1 at
> the moment, although you would typically upgrade to glibc 2.2.3
> (which is also on the CD), after install.  That problem is processor
> specific, and I wouldn't have expected it to affect the 735.

715/scorpio is PCXT and so are the 735 and 755 workstations.  I'd expect
them to have similar problems.

-- 
Revolutions do not require corporate support.

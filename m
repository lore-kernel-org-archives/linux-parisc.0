Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29B6D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Jun 2001 13:32:10 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA05878
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Jun 2001 13:24:48 -0600
Received: from pc2-hems4-0-cust95.bre.cable.ntl.com (HELO rhirst.linuxcare.com) (213.107.176.95)
  by mailserv2.iuinc.com with SMTP; 3 Jun 2001 19:32:08 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 76862B007; Sun,  3 Jun 2001 20:28:25 +0100 (BST)
Date: Sun, 3 Jun 2001 20:28:25 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Jim Buttafuoco <jim@buttafuoco.org>,
	PARISC-LINUX Mailing List <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] .9 install problems on a 735
Message-ID: <20010603202825.M25745@linuxcare.com>
References: <200106021656.MAA18064@p2.buttafuoco.net> <20010602191635.D25745@linuxcare.com> <20010603202040.L7349@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010603202040.L7349@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sun, Jun 03, 2001 at 08:20:40PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 03, 2001 at 08:20:40PM +0100, Matthew Wilcox wrote:
> On Sat, Jun 02, 2001 at 07:16:35PM +0100, Richard Hirst wrote:
> > I had it hang on my 715/old, because of problems with the alignment
> > of locks in glibc 2.2.1.  The installer is based on glibc 2.2.1 at
> > the moment, although you would typically upgrade to glibc 2.2.3
> > (which is also on the CD), after install.  That problem is processor
> > specific, and I wouldn't have expected it to affect the 735.
> 
> 715/scorpio is PCXT and so are the 735 and 755 workstations.  I'd expect
> them to have similar problems.

You're right, I should have checked the hw database.  Maybe those 3 should be
in the same section on http://parisc-linux.org/release-0.9/systems.html

Richard

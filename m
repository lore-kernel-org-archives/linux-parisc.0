Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA18729
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 23:18:54 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13rDi4-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Nov 2000 23:18:48 -0700 (MST)
Message-Id: <m13rDi4-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
Subject: Re: linux bame
In-reply-to: Your message of "Thu, 02 Nov 2000 00:13:06 GMT."
             <20001102001306.A30325@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 01 Nov 2000 23:18:43 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= On Wed, Nov 01, 2000 at 01:53:24PM -0700, Paul Bame wrote:
= > CVSROOT:	/home/cvs/parisc
= > Module name:	linux
= > Changes by:	bame	00/11/01 13:53:24
= > 
= > Modified files:
= > 	include/asm-parisc64: posix_types.h 
= > 
= > Log message:
= > Don't need a separate copy of this one either
= 
= err.. are you sure?  we used to get a lot of prototype problems when they
= were the same file.  what's changed that they're now able to be the same?

I changed the parisc version so that the data types would compile to
the same size in both wide and narrow mode.  Unfortunately there is
at least one issue which will probably require this scheme to change :-(

	-P

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA20906
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Jan 2001 23:15:36 -0700
Message-Id: <200101040618.BAA05609@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] where to put 64 bit libmilli?
To: alan@linuxcare.com.au (Alan Modra)
Date: Thu, 4 Jan 2001 01:18:48 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@redhat.com, bame@fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0101041608490.15554-100000@front.linuxcare.com.au> from "Alan Modra" at Jan 4, 2001 04:20:37 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Wed, 3 Jan 2001, Jeffrey A Law wrote:
> 
> > The easiest (to me) solution is to put the routines into the system C
> > library.  You'd drop the special millcode conventions, but that's a
> 
> How about $$dyncall?  Wouldn't loading r19/r29 break this function?  I'm
> thinking of the case where $$dyncall is passed the address of a local
> function rather than a plabel.  We wouldn't want to load r19/r29 with the
> value for a shared libgcc.

Could this and maybe some of the other short milli routines be compiler
"builtins"?  This would allow inlining.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

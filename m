Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA20171
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 10:58:41 -0600
From: phi@tcleur.france.hp.com
Received: from iws1pb01.france.hp.com (iws1pb01.france.hp.com [15.124.72.10])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA10181
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Sep 1999 13:00:19 -0400 (EDT)
Received: from tcleur.france.hp.com (localhost [127.0.0.1]) by iws1pb01.france.hp.com with ESMTP (8.7.1/8.7.1) id TAA00878 for <parisc-linux@thepuffingroup.com>; Wed, 22 Sep 1999 19:02:11 +0200 (METDST)
Sender: phi@tcleur.france.hp.com
Message-ID: <37E90B93.69DE1184@tcleur.france.hp.com>
Date: Wed, 22 Sep 1999 19:02:11 +0200
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: [Fwd: [parisc-linux] 715/80 problems]
Content-Type: multipart/mixed;
 boundary="------------88E1F5BF9AAFEB57A313104C"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------88E1F5BF9AAFEB57A313104C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Sorry I sent this reply to Philipp while I meant to send it to the list.

Inthe mean time I saw Alex mail, so its sounds more like a regression
than a new desgin orientation.

Correct me if I'm wrong.
Phi

--
mailto:Philippe_Benard@hp.com
Technical Consulting Lab
--------------88E1F5BF9AAFEB57A313104C
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <37E90ABF.71B2FAD6@tcleur.france.hp.com>
Date: Wed, 22 Sep 1999 18:58:39 +0200
From: phi@tcleur.france.hp.com
X-Mailer: Mozilla 4.5 [en] (X11; I; HP-UX B.10.20 9000/712)
X-Accept-Language: en
MIME-Version: 1.0
To: Philipp Rumpf <prumpf@suse.de>
Subject: Re: [parisc-linux] 715/80 problems
References: <199909162158.OAA21289@milano.cup.hp.com> <Pine.HPX.4.05.9909221438440.2148-100000@gamgee.ntc.nokia.com> <19990922153509.B5481@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Philipp Rumpf wrote:
> 
> > With 715/80 I get following:
> > Boot
> > :disk(....)/stand/vmlinux
> 
> you might want to try to boot via tftp / bootp as this is what most of us do
> and it seems to work for us.
> 

I'm single node oriented for now, I use to setup my disc so I could have
all in 1, i.e a LIF area, an HFS with the development system on it, an
EXT2 area (for the future), a swap area for linux, I don't plan to boo
HP-UX on this one.

With the regression that occured after 14 september  1999, or so (20
septembre is wrong, 14 setp is good), I can't use it anymore.

I'm think about a newfs to regain the full HFS capacity unless one of
you can tell me this will be put back as it was before. For now I assume
the vmlinux is not supposed to boot from isl> hpux right?

Phi

--
mailto:Philippe_Benard@hp.com
Technical Consulting Lab

--------------88E1F5BF9AAFEB57A313104C--

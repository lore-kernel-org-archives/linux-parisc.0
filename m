Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA06258
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 13:15:02 -0700
Message-Id: <199911232015.PAA08284@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: bame@debian.fc.hp.com (Paul Bame)
Date: Tue, 23 Nov 1999 15:15:12 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199911231559.IAA23827@debian.fc.hp.com> from "Paul Bame" at Nov 23, 99 08:59:52 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> One could hard-code a command line in real/setup.c temporarily...

I think this is in fact reasonable.  The default command line
define needs to move from ipl_c.c to bootdata.h.  This header can then
be loaded by real/setup.c and the default command line set for the
hpux load.  Even, if we get the passing of args from hpux working,
it would still be good to have a default command line so I don't have
to type it all the time.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA17160
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Nov 1999 16:56:28 -0700
Message-Id: <199911092357.SAA12804@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] HIL status
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Tue, 9 Nov 1999 18:57:47 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991110004745.T25252@mencheca.ch.genedata.com> from "Matthew Wilcox" at Nov 10, 99 00:47:45 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I've taken the hp300 HIL driver written by Phil Blundell and it `works'
> on my 715/33.  It's producing the wrong keycodes, it's doing work that an
> ASP driver ought to be doing and it's producing a fair bit of extraneous
> crap on the screen.  But I'm getting interrupts and keycodes so I'm
> happy for tonight :-)

Maybe this is due to the difference between keycodes for HP (e.g., C1429A)
and PS/2 keyboards?

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

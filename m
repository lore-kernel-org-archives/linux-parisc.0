Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA30242
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 15:21:15 -0600
Message-Id: <199906102120.RAA02172@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com (Alex deVries)
Date: Thu, 10 Jun 1999 17:20:52 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <375F482D.E1E0B53D@thepuffingroup.com> from "Alex deVries" at Jun 10, 99 01:07:57 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> And now it passes the LIF magic and checksum, and dies.  Here's a
> hand-typed copy of the console:
> 
> "
> Main Menu: Enter command > boot p2
> Interact with IPL (Y, N, or Cancel)?> n
> 
> Booting...
> Network Station Address 001039-037944
> System IP Address 192.168.1.56
> Server IP Address 192.168.1.52
> 
> Boot IO Dependant Code (IODC) revision 2
> 
> 
> SOFT Booted.
> "
> 
> And then absolutely nothing.  The cute little heart on the front panel

It is my guess that ipl has been incorrectly linked (i.e., the relocation
information for text and data are wrong for the LIF image).  Take a
look at the ld script hppaelf.sc in binutils.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA04872
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 14:18:44 -0600
Message-Id: <199906252018.QAA11141@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Booting from CD...
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 25 Jun 1999 16:18:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3773E26E.164B31F5@thepuffingroup.com> from "Alex deVries" at Jun 25, 99 04:11:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> How do PA RISC machines manage booting from CD?  How does one create
> such a CD?

I am not sure exactly but you could try just writing the LIF image
to the CD.  Because HP's IPL can boot from a hpux file system, a PA
machine can probably also boot from a CD with a hpux file system
on it.  I doubt HP machines can boot from an ISO 9660 CD.

Most CD writing software has a mode that allows copying a binary
image file to a CD.  There are some issues regarding CD sector
size.  You want the image to be an integral number of CD sectors.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

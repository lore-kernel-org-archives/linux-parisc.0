Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA02851
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 08:59:28 -0700
Message-Id: <199911161555.KAA02100@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] depi?
To: phi@hpfrcu03.france.hp.com (Philippe Benard)
Date: Tue, 16 Nov 1999 10:55:20 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@lxorguk.ukuu.org.uk, frowand@cup.hp.com,
        Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com, adevries@thepuffingroup.com
In-Reply-To: <383145A5.C2AF5857@hpfrcu03.france.hp.com> from "Philippe Benard" at Nov 16, 99 12:53:09 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> For instance how big can be a process under linux on pa1.1?

Unless you change gcc, the address space is 4GB for pa 1.x.  This is the
short (32 bit) pointer mode.  Space register sr0 is used for loads and stores.
When sr0 is used, the pa hardware uses bits 0 and 1 of the memory offset 
to select one of the space registers sr4 to sr7.  The selected register
is then used with the offset to generate the full virtual address for the
operation.  Thus, only 1GB of the 4GB addressable using a given space
register is actually used in this mode.

The standard usage for sr4 to sr7 in a user process is:

sr4:	text
sr5:	data
sr6:	shared data (shared libs & mmap)
sr7:	shared data (upper 256 MB is reserved for system use).

This model was selected because it is large enough for most applications
and efficient.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA22034
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 10:12:17 -0600
Message-Id: <199910221609.MAA01955@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh?
To: grundler@cup.hp.com (Grant Grundler)
Date: Fri, 22 Oct 1999 12:09:10 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: magne@spacetec.no, parisc-linux@thepuffingroup.com
In-Reply-To: <199910221519.IAA00565@milano.cup.hp.com> from "Grant Grundler" at Oct 22, 99 08:19:19 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > (It isn't very fast.. :)  Can I link with HPUX 9.03? (probably not)
> > 10.30? (It doesn't run 11.x)
> 
> Use 10.20. It should run on your 710. Don't use 10.30 as it was never
> intended for distribution on workstations and certainly doesn't have
> the support which WSY has poured into 10.20.

I won't describe the woes I have had upgrading my 735 to 10.20
but I have had all kinds of problems with disk timeouts and unrecoverable
LPMCs with 10.20 on my 735.  These problems are only now getting
worked out of 10.20 (see recent patches to wsio driver, etc).
My 735 has about a dozen scsi devices on threee buses, so it
seriously stresses the IO architecture.

The machine ran for years under 9.01 with experiencing any problems
of this kind.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA25114
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 11:26:33 -0600
From: Barrie Spence <baz@calvin.demon.co.uk>
Message-Id: <200005301726.SAA07317@calvin.demon.co.uk>
Date: Tue, 30 May 2000 17:26:36 +0000 (GMT)
To: steve@silug.org
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] EISA 10/100 nic for 715 systems ?
In-Reply-To: <200005291335.IAA11105@osiris.silug.org>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

Steven Pritchard <steve@silug.org> wrote:
> Ed June said:
> > Were there ever any EISA 10/100 LAN cards for 715 systems?
> > I have found straight 10's and 100's, but not a switching one.

There was an EISA card for the S700's, I think that it was
actually OEM'd from Interphase.

> At my previous job, I had a spare EISA 10/100 card originally out of a
> B160 that I used in my 715/100.
> 
> Either the cards or HP-UX was kind of weird about switching between 10
> and 100.  I think I only got that card to talk 100 with a particular
> brand of switch, and that was only when I forced the switch to 100
> half duplex.  (The PCI cards did the same thing, but a kernel patch
> for 10.20 released late last year seemed to fix autonegotiation.)

The EISA card was definitely only half-duplex and generally not 
considered a good performer.

The PCI and GSC cards are totally different beasts...

Barrie


--
Barrie Spence			Sanity Clause? There is no Sanity Clause
Home: b.spence@ieee.org		Telephone +44 1506 442304
Play: barrie_spence@agilent.com

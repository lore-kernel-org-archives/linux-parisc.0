Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA10431
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 13:39:05 -0600
Date: Mon, 29 May 2000 21:39:28 +0200
From: Dominik Kubla <dominik.kubla@uni-mainz.de>
To: Steven Pritchard <steve@silug.org>
Cc: Ed June <buggz@america.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] EISA 10/100 nic for 715 systems ?
Message-ID: <20000529213928.A32260@uni-mainz.de>
References: <39322B14.309E348B@america.net> <200005291335.IAA11105@osiris.silug.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200005291335.IAA11105@osiris.silug.org>; from steve@silug.org on Mon, May 29, 2000 at 08:35:58AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 29, 2000 at 08:35:58AM -0500, Steven Pritchard wrote:

> Either the cards or HP-UX was kind of weird about switching between 10
> and 100.  I think I only got that card to talk 100 with a particular
> brand of switch, and that was only when I forced the switch to 100
> half duplex.  (The PCI cards did the same thing, but a kernel patch
> for 10.20 released late last year seemed to fix autonegotiation.)

Same experience here: the 735 happily negotiated full duplex without
actually doing it.  Problem solved by forcing switch port to halfduplex
and shifting all esential services over to the Linux servers...

Dominik
-- 
  Networking Group,  Hospital of Johannes Gutenberg-University                  
  Obere Zahlbacher Straﬂe 69, 55101 Mainz, Germany                              
  Tel: +49 (0)6131 17-2482   FAX: +49 (0)6131 17-5521                           

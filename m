Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4AD1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Jul 2001 11:35:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Pp2k-0007Lk-00; Thu, 26 Jul 2001 18:35:26 +0100
Date: Thu, 26 Jul 2001 18:35:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Cc: parisc-linux@lists.parisc-linux.org, sanaya@gr.hp.com
Subject: Re: [parisc-linux] Re: Help on install
Message-ID: <20010726183526.A27258@parcelfarce.linux.theplanet.co.uk>
References: <20010726124024.1EB23482B@dsl2.external.hp.com> <01072618484200.01103@octopus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01072618484200.01103@octopus>; from Reinhard.Gimbel@freenet.de on Thu, Jul 26, 2001 at 06:48:42PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 26, 2001 at 06:48:42PM +0200, Reinhard Gimbel wrote:
> My expirence is that the DINO I/O chip seems to be the key 
> element for that problem. Version 1.x of this chip crashes the 
> system like you describe it (crash during boot ... :-( )

Oooh.  That was the vital clue, see this note from the source:

** "HP has discovered a potential system defect that can affect
** the behavior of five models of HP VISUALIZE workstations when
** equipped with third-party or customer-installed PCI I/O expansion
** cards. The defect is limited to the HP C180, C160, C160L, B160L,
** and B132L VISUALIZE workstations, and will only be encountered
** when data is transmitted through PCI I/O expansion cards on the
** PCI bus. HP-supplied graphics cards that utilize the PCI bus are
** not affected."

Maybe we're triggering this bug... grant?


-- 
Revolutions do not require corporate support.

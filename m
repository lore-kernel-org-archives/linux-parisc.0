Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA10944
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Sep 1999 20:17:16 -0600
To: Grant Grundler <grundler@cup.hp.com>
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] Card-mode Dino 
In-reply-to: Your message of "Fri, 03 Sep 1999 15:47:06 PDT."
             <199909032247.PAA09181@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Fri, 03 Sep 1999 20:19:07 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990904021908.3A1F918708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > And does the dino-on-a-card have it's own IODC on the card?
> No. Dino implements the PA I/O architected registers but no IODC.
> I suspect the problem is it's really a bus converter and that
> needs PDC support - IODC entry points don't apply to this.
> Can anyone confirm this?

Can't confirm or deny, but it is possible (we've done it at least once)
to build a bus converter that does not require PDC help, just architecture
knowledge.

lamont

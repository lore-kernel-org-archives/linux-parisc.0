Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA10329
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Sep 1999 16:47:45 -0600
Message-Id: <199909032247.PAA09181@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Fri, 03 Sep 1999 12:22:58 PDT."
             <37CFF5E2.8F0E664F@thepuffingroup.com>
Date: Fri, 03 Sep 1999 15:47:06 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] Card-mode Dino
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:

> And does the dino-on-a-card have it's own IODC on the card?

No. Dino implements the PA I/O architected registers but no IODC.
I suspect the problem is it's really a bus converter and that
needs PDC support - IODC entry points don't apply to this.
Can anyone confirm this?

grant

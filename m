Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01903
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Mar 2000 16:33:26 -0700
Received: from libero.it (garfield.postai.it [192.168.1.2])
	by router.postai.it (8.8.7/8.8.7) with ESMTP id WAA00792
	for <parisc-linux@thepuffingroup.com>; Fri, 24 Mar 2000 22:10:12 +0100
Sender: paolo@router.postai.it
Message-ID: <38DBDC2F.61B809D9@libero.it>
Date: Fri, 24 Mar 2000 22:20:47 +0100
From: Paolo <postaip@libero.it>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] floppy disk drive for hp  712/100
References: <20000320150742.19786.qmail@mailserv2.iuinc.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

T.J.Yang wrote:
> 
> Another question for my 712/100 wks.
> I am thinking of putting a floppy disk drive into the
> empty seond bay. The ioscan output strongly indicate
> the floppy disk is a reqular PC floppy drive.
> 
> on the hp mother board, the floppy disk connetion cable
> looks alright with the pc one but the power cable is
> different. It only has two wires while the PC one has
> four. (That is why it is imporatent to locate the
> 712/100 owner's/technical manual).
> 
> I don't have the multimeter with me now to check on the
> voltage.
> 
> Perhaps someone done this before can help me out.
> 
> Thanks again
> 
> tj
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

Pc floppy-drive use only +5V, so it's enough two wires.
+12V is unused, but present for other peripherals.

-- 
Postai Paolo. Modena, Italy
<paolopos@lica.unimo.it>
Key fingerprint = E8 5A 33 C8 45 1B 76 6C  D2 95 51 E1 AD 27 D0 90
Pgp Key = <http://www.lica.unimo.it/~paolopos/public_key_PGP.asc>

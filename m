Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA05166
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 16:43:20 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id SAA09981
	for <parisc-linux@thepuffingroup.com>; Thu, 16 Sep 1999 18:44:01 -0400 (EDT)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output 
In-reply-to: Your message of "Thu, 16 Sep 1999 14:58:14 PDT."
             <199909162158.OAA21289@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 16 Sep 1999 16:44:38 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990916224438.6F3BB18711@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> IAOQ: c0067c4c c0067c50
> ISR: 00000000 IOR: c00167a8 IIR: 02a008b8
> ior 00000004
> o In this case the offending instruction and a stack trace.

Interestingly, IIR (the interupting instruction register) contains
mfctl   ior,arg2, which is not what we want...  Likewise IOR (as
opposed to ior) also looks suspect.  I would wager that someone is
not saving the I* registers correctly...

lamont

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09047
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 16:59:31 -0700
Message-Id: <200011160001.QAA05126@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] Help with posix_types.h
Date: Wed, 15 Nov 2000 16:00:49 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "Ulrich Drepper" <drepper@cygnus.com>, "Paul Bame" <bame@noam.fc.hp.com>
Cc: <parisc-linux@thepuffingroup.com>, <parisc-linux@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>You have certainly reserved a thread register in the ABI, right?  If
>not, do it ASAP.

On PA-RISC, the thread pointer is kept in the read-only control register 
CR 27.

For user-thread implementations, we provided a kernel API to change the 
contents of the register.

-cary

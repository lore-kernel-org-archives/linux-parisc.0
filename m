Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA30249
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 18:45:12 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 00:46:43 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA16423;
	Fri, 14 Jul 2000 10:44:27 +1000
Date: Fri, 14 Jul 2000 10:44:27 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
In-Reply-To: <871z0x1tns.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0007141038590.15538-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 13 Jul 2000, David Huggins-Daines wrote:

> Okay, this is my final word on this for today, I promise that if I
> send any more mail on it, it will include a patch :-)

Nice bit of debugging, David.  Have a look in
gcc/config/pa/pa.c:output_global_address

      /* How bogus.  The compiler is apparently responsible for
	 rounding the constant if it uses an LR field selector.

	 The linker and/or assembler seem a better place since
	 they have to do this kind of thing already.

	 If we fail to do this, HP's optimizing linker may eliminate
	 an addil, but not update the ldw/stw/ldo instruction that
	 uses the result of the addil.  */
      if (round_constant)
	offset = ((offset + 0x1000) & ~0x1fff);

Zap these two lines, and I think the problem will go away.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

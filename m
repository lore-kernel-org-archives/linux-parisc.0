Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA21547
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 10:18:09 -0600
To: Alan Modra <alan@linuxcare.com.au>
cc: David Huggins-Daines <dhd@linuxcare.com>, Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 14 Jul 2000 10:44:27 +1000.
             <Pine.LNX.4.21.0007141038590.15538-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jul 2000 10:02:05 -0600
Message-ID: <1747.963590525@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0007141038590.15538-100000@front.linuxcare.com.au>y
ou write:
  > On 13 Jul 2000, David Huggins-Daines wrote:
  > 
  > > Okay, this is my final word on this for today, I promise that if I
  > > send any more mail on it, it will include a patch :-)
  > 
  > Nice bit of debugging, David.  Have a look in
  > gcc/config/pa/pa.c:output_global_address
  > 
  >       /* How bogus.  The compiler is apparently responsible for
  > 	 rounding the constant if it uses an LR field selector.
  > 
  > 	 The linker and/or assembler seem a better place since
  > 	 they have to do this kind of thing already.
  > 
  > 	 If we fail to do this, HP's optimizing linker may eliminate
  > 	 an addil, but not update the ldw/stw/ldo instruction that
  > 	 uses the result of the addil.  */
  >       if (round_constant)
  > 	offset = ((offset + 0x1000) & ~0x1fff);
  > 
  > Zap these two lines, and I think the problem will go away.
But that's totally the wrong thing to do as it will break hpux.

The linker is the problem.

jeff

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA13641
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 00:23:24 -0700
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 15 Nov 1999 03:08:49 EST.
             <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Nov 1999 00:24:01 -0700
Message-ID: <3669.942650641@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com>
you write:
  > 
  > What does this actually do:
  > 
  >         ; Get ready for phys->virt transition
  >         ; First order of business is to adjust some pointers
  >         depi            3,1,2,%arg0     ; phys->virt(free mem ptr)
  >         depi            3,1,2, %sp      ; phys->virt SP
  >         depi            3,1,2, %dp      ; p2v DP
  > 
  > in head.S?
  > 
  > I don't have a 'depi' in the index of my PA 2.0 assembler book.  I have a
  > depwi and a depdi though.
HP changed a large amount of their assembly syntax for PA2.0.

depi == depwi

Basically they made the extract/deposit instructions explicitly mention
their size [word vs double word].
jeff

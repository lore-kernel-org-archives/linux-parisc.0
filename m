Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA12159
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 12:15:26 -0600
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Anyone got a few moments? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 28 Jun 1999 19:34:04 +0200.
             <19990628193404.I30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 Jun 1999 11:47:56 -0600
Message-ID: <17559.930592076@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <19990628193404.I30362@mencheca.ch.genedata.com>you write:
  > > What does xchg() do?
  > 
  > /*
  >  * Atomic [test&set] exchange
  >  *
  >  *      void *xchg_u32(void *ptr, unsigned long val)
  >  * Changes the memory location '*ptr' to be val and returns
  >  * the previous value stored there.
  >  */
  > 
tsk tsk, that is a highly non-portable API for atomic operations.

  > It's atomic with respect to interrupts and other CPUs.
  > 
  > PA-RISC 2.0 seems to have LDC{W,D}, but that's going to make implementation
  > a real pain.
Yes.  Major pain since the only useful atomic operations are load & clear
word/double as you noted.

Why does linux want an "exchange"-like API for atomic operations?  That
just seems totally weird and stupid.


jeff

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA06456
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 12:58:40 -0600
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: dave@hiauly1.hia.nrc.ca (John David Anglin), adevries@thepuffingroup.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sat, 12 Jun 1999 19:36:44 BST.
             <E10sse6-0004NC-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 12 Jun 1999 12:53:18 -0600
Message-ID: <23212.929213598@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <E10sse6-0004NC-00@the-village.bc.nu>you write:
  > Writing a linker, especialyl for something complex like SOM is not trivial
  > in the slightest.
  > 
One hell of an understatement.  Time is better spent _rewriting_ the ELF tools
to work in a reasoanble manner.

I'm not talking about tweaking the ELF tools, I'm talking about starting from
scratch.  The elf32-hppa code was the first elf backend that tried to deal
with linker generated code.

We've learned a lot since that code was written -- both about the generic
issues behind linker generated code and PA specific issues.  Enough to 
realize that what we tried to do in elf32-hppa.c was horribly bad and
needs to be scrapped and replaced.


jeff

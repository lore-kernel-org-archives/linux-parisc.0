Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA15570
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jul 2000 16:37:29 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,
 issues/questions
Reply-To: law@cygnus.com
In-reply-to: Your message of 05 Jul 2000 18:25:35 EDT.
             <87u2e4kye8.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Jul 2000 16:39:42 -0600
Message-ID: <7553.962836782@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <87u2e4kye8.fsf@linuxcare.com>you write:
  > 1) What is the proper GNU architecture string for 64-bit Linux on
  >    PA-RISC?  On #parisc we sort of decided on using
  >    'hppa1.1-*-linux-*' for 32-bit Linux and 'hppa2.0w-*-linux-*' for
  >    64-bit Linux.  However the existing configuration files use some
  >    other strange pattern like 'hppa*64*-*-*' to configure for 64-bit
  >    PA-RISC.  Seeing as hppa2.0w is 64-bit by definition I don't think
  >    this makes much sense.
64bit is hppa64-*-*.

We do _not_ want to ever default the tools to 64bit due to the significant
code generation penalties that involves.

Thus we can not key 64bit generation on the strings returned by config.guess.

This was discussed on the gcc, gdb, binutils, and autoconf development 
lists.


  > 2) A corollary to this problem is that the choice of a 32- or 64-bit
  >    target in gas is determined at configure time rather than at
  >    runtime.  Every other architecture allows you to specify the
  >    architecture revision, code model, and word size on the assembler
  >    command line (it's the compiler that gets configured differently),
  >    and it would be nice if we could too.  Can anyone think of a reason
  >    why we cannot do this?
I'm not aware of a technical reason why this will not work in the assembler;
there are *major* problems trying to make this work with the compiler.  Feel
free to try and merge them.

jeff

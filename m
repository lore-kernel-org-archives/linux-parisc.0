Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA22127
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 08:14:03 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 6 Jul 2000 14:15:26 -0000
To: law@cygnus.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,  issues/questions
References: <7553.962836782@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 06 Jul 2000 10:14:28 -0400
In-Reply-To: Jeffrey A Law's message of "Wed, 05 Jul 2000 16:39:42 -0600"
Message-ID: <87puorl517.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

> 64bit is hppa64-*-*.
> 
> We do _not_ want to ever default the tools to 64bit due to the significant
> code generation penalties that involves.
> 
> Thus we can not key 64bit generation on the strings returned by config.guess.

Yes, but I thought that 'hppa2.0w' means 64 bit by definition, so it
strikes me that the problem is with config.guess returning this.

> This was discussed on the gcc, gdb, binutils, and autoconf development 
> lists.

Can you provide a subject: line to search on or a URL?  I can't find
any definitive statements on the semantics of config.guess nor the
proper configuration for 64-bit PA-RISC in the archives.

> I'm not aware of a technical reason why this will not work in the assembler;
> there are *major* problems trying to make this work with the compiler.  Feel

Yes, I'm aware of that :) I was hoping to follow the Sparc model where
the compiler is configured to pass the appropriate flags to the
assembler.

> free to try and merge them.

It turns out this isn't a big priority at the moment since we'd prefer
not to break the existing HP/UX support, but if it turns out to be
easy I might.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

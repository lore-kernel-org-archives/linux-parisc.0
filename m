Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA29045
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 16:03:08 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 6 Jul 2000 22:04:31 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13AJkE-0007ue-00
	for <parisc-linux@thepuffingroup.com>; Thu, 06 Jul 2000 18:03:42 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 06 Jul 2000 18:03:40 -0400
Message-ID: <87em56or0j.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Ding dong, reserved %r8 is dead
List-ID: <linux-parisc.vger.kernel.org>

As of this afternoon, the GCC in puffin.external.hp.com CVS no longer
reserves %r8.  You will need to get binutils-2.10 or your builds will
be broken.  I've built a successful kernel+palo lifimage with this
GCC, but haven't tested glibc or userspace yet due to reasons
mentioned below, and the fact that I have been also working on merging
our GCC forward to the mainline CVS version (the *real* 2.96 :-)

One other thing - USE_CONST_SECTION is no longer defined to 0, so GCC
will put strings and such in a .rodata section.  I'm not sure why we
were avoiding this in the past - was it a SOM-ism?

I guess there's no good reason not to have read-only data in the text
section, aside from the fact that it makes reading objdump output a
bit confusing, so we can change it back if there is a pressing reason.

Oh, and for a few hours, glibc builds were slightly broken because GCC
was not building crt{begin,end}.o, for reasons that are beyond me.
I've manually added them in GCC's configure.in, and it should build
again.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

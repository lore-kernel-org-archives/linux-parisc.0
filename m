Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA29542
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 16:24:58 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Ding dong, reserved %r8 is dead 
Reply-To: law@cygnus.com
In-reply-to: Your message of 06 Jul 2000 18:03:40 EDT.
             <87em56or0j.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 16:27:05 -0600
Message-ID: <13062.962922425@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <87em56or0j.fsf@linuxcare.com>you write:
  > One other thing - USE_CONST_SECTION is no longer defined to 0, so GCC
  > will put strings and such in a .rodata section.  I'm not sure why we
  > were avoiding this in the past - was it a SOM-ism?
?!?  No idea why that was done in your tree, it's certainly not like that
in the official GCC sources.

  > I guess there's no good reason not to have read-only data in the text
  > section, aside from the fact that it makes reading objdump output a
  > bit confusing, so we can change it back if there is a pressing reason.
It can be problematical for PIC code sometimes.

jeff

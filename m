Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA28245
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 11:59:28 -0700
Message-Id: <200101041902.LAA22273@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Date: Thu, 4 Jan 2001 11:00:49 -0800
From: Cary Coutant <cary@cup.hp.com>
To: <law@redhat.com>, "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: "Alan Modra" <alan@linuxcare.com.au>, <bame@fc.hp.com>,
        <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>For PA64 the indirect calling sequence is significantly simpler and is
>emitted inline, hence we don't need/use $$dyncall for PA64.

Even for PA-32, $$dyncall should be simple enough to emit inline. There 
were two reasons why we didn't do it at first:

1. Our compilers emitted code that was compatible with both MPE and 
HP-UX. Since function pointers had different representations in these two 
runtimes, $$dyncall had to check a low-order bit.

2. After we implemented shared libraries on HP-UX, function pointers 
could be either "internal" or "external", and $$dyncall had to check.

Eventually, HP-UX has moved to a runtime where function pointers are 
either all internal (for a statically-bound program) or all external (for 
a dynamically-bound program). We now have compiler options to generate 
the appropriate inline sequence for either model.

Linux shouldn't need to be concerned with either of these cases. If 
you're using $$dyncall for the 32-bit runtime, I strongly suggest that 
you change the compiler.

-cary

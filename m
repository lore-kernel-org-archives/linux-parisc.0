Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA07861
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 20:37:44 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id TAA08467
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Jan 2001 19:41:02 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 03 Jan 2001 12:46:52 +1100.
             <Pine.LNX.4.21.0101031235310.24351-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Jan 2001 20:37:35 -0700
Message-ID: <1895.978493055@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>



  In message <Pine.LNX.4.21.0101031235310.24351-100000@front.linuxcare.com.au>y
ou write:
  > The real reason that we currently need separate millicode routines for
  > each shared lib is that linkage to millicode functions is different than
  > for normal functions.  In particular, you don't want to load r19 (32 bit
  > case) or r27 (64 bit case) when calling millicode.  Therefore, a shared
  > millicode lib would require special .plt entries.  Not too hard to do,
  > just a bit messy.
So what happens in this case.

Pretend shared library A references $$div from the millicode routines.  Also
assume that the main program does not reference $$div.  Also assume that
the shared library is _not_ referenced on the link line for the main
program, but instead is sucked in via dl_open calls.

The shared library will have an undefined reference for $$div which can't
be satisfied and will terminate the application if we execute a path in
the shared library which calls $$div.


jeff

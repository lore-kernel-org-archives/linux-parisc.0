Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA00538
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Apr 2000 09:50:58 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id 88A315F4
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Apr 2000 08:50:55 -0700 (PDT)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain 
In-reply-to: Your message of "09 Apr 2000 12:17:13 EDT."
             <87em8fjlkm.fsf@tarwebok.thepuffingroup.com>
Date: Tue, 11 Apr 2000 09:50:55 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12f2wJ-0002l4-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > So, crtbegin/crtend are related to constructors and destructors for C++.  I

I've been editing them out of the spec file by hand, but I suspect that
configure --disable-shared and setting the gcc configure languages list
to dis-include C++ might work too.  (If the lang list only had C in it,
the build might be faster too)

Another thing which is handy is to 'cd gcc; ln -s ../binutils .'
After this, the configure/make/make-install inside the gcc directory
properly handles binutils, so you don't have to do it separately and
it solves some of the installation problems I had before.

The linker problem is always where I end up stuck.  I tried mangling
the vmlinux.lds to link my hello world and that didn't work either,
but I'm NO linker expert.  FYI I added an assert() (it's in CVS) which
catches the linker segfault (binutils/bfd/elf32something) if anyone
wants to become a linker expert and figure it out :-)

	-P

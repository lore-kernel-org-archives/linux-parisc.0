Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA16379
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 06:02:41 -0600
Message-Id: <4.1.19990505064359.00c59a40@garfield.dis.com>
Date: Wed, 05 May 1999 06:46:20 -0700
To: Kumar <kumar@ix.netcom.com>, Alex deVries <adevries@redhat.com>
From: Mark Klein <mklein@dis.com>
Subject: Re: [parisc-linux] linker errors
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.3.96.990504232216.456A-100000@quark.ix.netcom.com
 >
References: <Pine.LNX.3.96.990505012802.22012I-100000@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

At 11:30 PM 5/4/99 -0700, Kumar wrote:
>On Wed, 5 May 1999, Alex deVries wrote:
>
>> 
>> > parisc-linux-ld -L. -R 0x100000 -N -S rom_interface.o setup.o utils.o
>> > strutils.o bcopy.o main.o io.o -l milli -o vmlinux
>> > rom_interface.o($CODE$+0xe4): undefined reference to `$$dyncall'
>> > main.o: In function `parisc_init':
>> > main.o($CODE$+0x208): undefined reference to `$$divU'
>> > make: *** [vmlinux] Error 1
>> 
>> Hm.  I don't get this at all... it certainly links for me.  I do get a lot
>> of errors with the linker itself, but nothing fatal.
>> 
>> Are you using the pre-built cross compilers? If so, which ones?

These millicode calls should probably resolve through libmilli.a. I see it
included in the link step, but is your libmilli correct?

--
Mark Klein                                 DIS International, Ltd.
http://www.dis.com                         415-892-8400
PGP Public Key Available			

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA14020
	for <parisc-linux@puffin.external.hp.com>; Fri, 9 Jun 2000 17:22:01 -0600
To: "Paulius Pazera" <paulius@glds.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Bootable CD image 
In-Reply-To: Message from "Paulius Pazera" <paulius@glds.com>
   of "Fri, 09 Jun 2000 09:30:14 PDT." <006f01bfd230$00383510$4808a8c0@glds.com>
References: <200006020604.XAA05048@milano.cup.hp.com>  
 <006f01bfd230$00383510$4808a8c0@glds.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 09 Jun 2000 17:01:43 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000609230143.8DB9537DF9@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


"Paulius Pazera" writes...

> Our company bought HP9000/800/H30 from auction. Hardware is ok, it boots
> HP-UX 9 fine, but there is not much to do without root password and CDs. The

You *could* boot it single user and change the root password.

> only chance I can see to make it functional is to install Linux.
> Unfortunately I could not find anything to start with. Could somebody tell
> me where from I can download bootable CD image and basic development
> utilities (gcc, glibc, etc) for pa-risc linux. Thanks a lot.

The port is still in progress, so there are no "bootable CD image"s yet. Right 
now the kernel builds and boots and there are drivers for some older devices. 
There is also a cross-toolchain(static) and some static userspace apps. There 
is a hardware database at,

http://216.208.98.4/

with entries for H20 and H50. Perhaps you could submit an entry for H30?

If you want to try the kernel on your H30 you can follow the recipe at,

http://www.thepuffingroup.com/parisc/recipe.html

-- 
Matt Taggart
taggart@fc.hp.com

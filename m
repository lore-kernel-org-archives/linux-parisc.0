Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA02336
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 15:49:51 -0700
Date: Fri, 25 Feb 2000 22:49:34 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: "HOLBROOK,SCOTT HP-FtCollins,ex1\"" <scott_holbrook@am.exch.hp.com>
Cc: "'willy@thepuffingroup.com'" <willy@thepuffingroup.com>,
        "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] code 28 trap
Message-ID: <20000225224934.D812@abacus.local>
References: <E97137CF9A25D311902E00A0C9F484E0027985F4@xfc03.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E97137CF9A25D311902E00A0C9F484E0027985F4@xfc03.fc.hp.com>; from scott_holbrook@am.exch.hp.com on Fri, Feb 25, 2000 at 01:23:51PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > Years ago I wrote an unaligned load/store emulator (trap handler) for
> > a port of an evil OS to PA-RISC.  I still have the code -- it would take
> > a little bit of work to massage it into a real low-level trap handler,
> > but that task should be very straight-forward.
> 
> The code I have is for PA-RISC running in little-endian mode.  There would
> be some additional work to make it bit-endian.
> 
> Do you just love endian issues?

Well, I've got an unaligned handler for another architecture here, the tricky
part is to parse the instructions, and not forget about side-effects of ,M
modifiers.

As for how the code would be run, the most likely way would be to call it
in virtual mode with interrupts disabled and pass in a pointer to a pt_regs
(defined in include/asm/ptrace.h) structure.

	Philipp Rumpf

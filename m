Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 855E94A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 05:05:33 -0700 (MST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3A7E96F4.F515929C@alcatel.at>
Date: Mon, 05 Feb 2001 13:05:08 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000/730 problems
References: <Pine.LNX.4.21.0102050015450.385-100000@sgate.charlysworld.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello,

	again and again, I hope this problem will be fixed !
The reason is an older generation of the PA-RISC CPUs using
interuption (TRAP) `18', on newer CPUs this trap is defined via
new different traps, as trap 18 can have up to three reasons.

A profi hacker on HPPA, it was 
       John Marvin <jsm@udlkern.fc.hp.com>
told me to add the `case 18:' to the block with `case 15:' and
`case 26:' in arch/parisc/kernel/trap.c (I hope this is right !)
in the routine handle_interruption().

After this change, the machine boots up well !!

I hope, this fix will done also in the mainstream !!

With friendly regards
	Christoph Plattner


"M. Grabert" wrote:
> 
> Hello there,
> 
> i'm still trying running linux on hppa :-/
> 
> well, i tried both booting from scsi hd AND nfsroot/bootp
> 
> everytime it says (endless loop):
> 
> VFS: Mounted root (nfs filesystem) readonly
> 
> handle_interruption() pid=1 command='init'
> 
> PSW: 0000000000 [snip stack output]
> 
> (the same for booting from scsi hd)
> 
> Mhhh.
> 
> BTW, ASP Parallel Port driver is still broken (can't boot with it,
> but can boot without it).
> 
> STI console is also broken (many characters are not printed or substitued
> by spaces). The problems occur of course AFTER "switching console" !
> 
> But serial console works fine :)
> 
> Configuration: latest CVS kernel from 20010204 (about 17:00 UTC);
> xc somewhere from november, the same for nfsroot.
> 
> I hope somebody can help!
> Thanks In Advance,
>   greetings (somewhat frustrated) max
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id B03ED482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 09:16:47 -0700 (MST)
Message-ID: <3C4AED62.F3914545@gmx.at>
Date: Sun, 20 Jan 2002 17:16:34 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: =?iso-8859-1?Q?Bj=F6rn?= Bylander <bjorn.bylander@telia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting to ISL with Linux installed
References: <DLEJJFGDAJICFFBHFNCDAEAPCEAA.bjorn.bylander@telia.com>
Content-Type: text/plain; charset=iso-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

The problem you have, is that you may have activated the `autoboot'
mode.
Try to interrupt the autoboot mode by pressing <ESC>. Then you can
disable
autoboot.

But this is not your major problem. The "ISL" prompt after booting a
LIF-IMAGE was a tool inside the LIF-IMAGE. The boot load PALO works
in a different way. PALO together with a recovery kernel is also in
a LIF-IMAGE but there are no tools, as you know from HP-UX to boot
a HP-UX kernel with the command "hpux" or "boot" and there are also
not tools like "IODC" or whatever they were called (I am no HP 
specialist, but I want to learn more and more ...).

So you need to have a LIF-IMAGE stored on a different place or
loaded from net including those HP-UX basic tools. Such a LIF
image canbe found on the HP-UX itself, called "uxbootlf" (AFAIK).

By the way: I am also interetsed in setting my 712/60 to serial 
console. But I heard, it is a problem to setup wrong values here,
as no device may fanctioning then. What have I to do, to restore
the machine to let's say "factory setups" ?

With friendly regards
Christoph


Björn Bylander wrote:
>
> Hello,
> 
> I recently acquired a HP 712/80 system. I've installed PA-RISC Linux 0.9.3 on it and it runs fine.
> I've got one problem though. I don't know how to get to ISL after I installed Linux.
> The reason I want to use ISL is that I want to (try) to make the machine use a serial console.
> Before I installed Linux the machine booted into ISL automatically as the HD was wiped (or at least not bootable) but if I try to boot to ISL now with 'boot pri isl' (from BOOT_ADMIN) I only get to the 'configuration mode' of PALO where you can enter the kernel and other boot stuff.
> 
> All in all, how can I get to the ISL> prompt so that I can use 'conspath 2/0/4.0x283'?
> 
> Thanks in advance,
> Björn Bylander
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

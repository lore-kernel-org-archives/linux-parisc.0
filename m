Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rachael.franken.de (rachael.franken.de [193.175.24.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F7B0482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 05:30:26 -0600 (MDT)
Received: by rachael.franken.de
	for parisc-linux@lists.parisc-linux.org
	id m15NC0b-0029GaC; Thu, 19 Jul 2001 13:30:21 +0200 (MET DST)
Received: by chico.franken.de
	for parisc-linux@lists.parisc-linux.org
	id m15NBzr-0032sGC; Thu, 19 Jul 2001 13:29:35 +0200 (MET DST)
Date: Thu, 19 Jul 2001 13:29:35 +0200
From: Thomas Bogendoerfer <tsbogend@chico.franken.de>
To: jakob@chico.franken.de, parisc-linux@lists.parisc-linux.org,
	Anders Nystrom <andesr@chico.franken.de>
Subject: Re: [parisc-linux] Installation success on C200
Message-ID: <20010719132935.A12203@chico.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <20010719120911.C6908@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010719120911.C6908@southpole.se>; from jakob@southpole.se on Thu, Jul 19, 2001 at 12:09:11PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 19, 2001 at 12:09:11PM +0200, Jakob Sandgren wrote:
> * cat /proc/interupts gives an oops and hangs the system

that's a bug I already found and I have a not quite correct fix for it.
All systems with dinos are affected. I'll check in the fix later.

Thomas.

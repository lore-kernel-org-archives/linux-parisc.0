Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B68C4830
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 23:52:44 -0600 (MDT)
Message-Id: <200110060549.XAA06336@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] The continuing SMP problems 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 06 Oct 2001 01:43:13 BST." <20011006014313.E3745@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 05 Oct 2001 23:49:07 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> What it's doing here is trying to run the keyboard_tasklet, which seems
> to be disabled, so it reschedules it... ad infinitum.  More investigation
> required, but I'm on the track, I think.

I was browsing commits made between -pa19 (I think worked) and -pa30 
(know it didn't work...could have been -pa32).  That got me looking
at -pa21 commit, changing the order of device detect and other init
calls.  Comments in include/asm-parisc/keyboard.h suggest the
initialization sequence is holy for kbd-ops usage. Still poking
around there.

BTW, rbrad doesn't think that commit got tested with CONFIG_SMP enabled
and noted that smp_init() is now *before* device detection.
Another lead to followup.

grant 

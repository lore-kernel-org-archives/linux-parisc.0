Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CC0E4A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 09:20:45 -0700 (MST)
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14WKv4-001VpXC@bame.riverrock.org> (Debian Smail3.2.0.102)
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 09:18:10 -0700 (MST)
Message-Id: <m14WKv4-001VpXC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] parisc64 vs kernel64
In-reply-to: Your message of "Fri, 23 Feb 2001 08:58:15 GMT."
             <20010223085815.B16261@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 23 Feb 2001 09:18:10 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

I can imagine about a half-dozen new files to handle hpux32 and hpux64
syscalls and signals and stuff.

= So how about moving the rest to parisc/kernel64?

On first thought I'm not opposed to this but I'd like to let the
suggestion ripen for a while.

= We'd select between
= them with something like:
= 
= make config
= [...]
= *
= * Processor type and features
= *
= Processor family (PA1.1, PA2.0, PA2.0Wide) [PA1.1] 

FYI we'll probably want/have another CONFIG parameter to select 64-bit
kernel on 32-bit firmware translation layer.

= i think it might make maintenance easier, and possibly alan/linus would
= be more willing to take this than the current do_links based situation.

I would appreciate specifics of their "unwillingness" -- all I've heard
so far is assertions that they would hate it.

	-P

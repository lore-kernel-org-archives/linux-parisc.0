Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F27F4837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 04:04:01 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id GAA02353
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 06:03:57 -0400
Message-Id: <200109271003.GAA02353@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 27 Sep 2001 06:03:56 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

And another (very weird) thing... I've manually decoded the instruction
(036008A4), which produces the trap 11 (hopefully, correctly :-). 
It turns out to be an MFCTL instruction to load contents of control 
register 27 into a general register 4. According to the docs for this
command ("PA-RISC 1.1 Architecture and Instruction Set Reference Manual",
Third edition, page 5-151):

"CR11, CR26 and CR 27 may be read at ANY privilege level."

So, unless I am missing something, this instruction SHOULD NOT produce
trap 11. Is it some hardware feature of 720 or my manual disassembling
skills must be improved? ;-).

Best regards,

Jurij

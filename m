Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from merulo.debian.org (merulo.external.hp.com [192.25.206.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 791DD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 12:31:36 -0600 (MDT)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id 5074C241ED
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 12:31:32 -0600 (MDT)
Sender: bdale@rover.gag.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Telnetd ?
References: <EF3C37D1121CD511894800A0C9E3AE7DA99C7B@xatl04.atl.hp.com>
From: Bdale Garbee <bdale@gag.com>
Date: 14 Aug 2001 12:31:28 -0600
In-Reply-To: <EF3C37D1121CD511894800A0C9E3AE7DA99C7B@xatl04.atl.hp.com>
Message-ID: <87hevabiin.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

christopher_toland@hp.com (TOLAND,CHRISTOPHER HP-USA,ex1) writes:

> installed 0.9.2 from cd ,, can ping and telnet out ,, unable to telnet in ,,
> looked in inetd.conf -- no ref to telnetd ,, looked for telnetd none found
> ,, thanks for the help in advance

The telnetd package is available for installation on hppa from any Debian
mirror.  I can't comment on why it was or was not included in the CD image,
but I can tell you that I don't allow telnetd's on machines I personally
administer because of the various security issues.  I strongly prefer ssh...

Bdale

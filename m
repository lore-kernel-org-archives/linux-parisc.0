Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4338482A
	for <parisc-linux@parisc-linux.org>; Sun, 21 Oct 2001 19:35:26 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ticfiaaa for parisc-linux@parisc-linux.org; Sun, 21 Oct 2001 18:30:31 -0700
Date: Sun, 21 Oct 2001 18:35:04 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] small patch for cpu_idle?
Message-ID: <20011021183504.I537@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20011021105227.H537@tausq.org> <20011021212118.G31505@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011021212118.G31505@parcelfarce.linux.theplanet.co.uk>
Sender: Randolph Chung <randolph@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>

> I don't see any difference between
> 
> while (foo) { }
> 
> and
> 
> while (foo) continue;

i was obviously smoking something funny :-(

ok, i'll look into more why i get a hang in cpu_idle when fsck requires
manual intervention on startup.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/

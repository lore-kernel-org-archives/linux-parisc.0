Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postal.sea.checkpoint.com (postal.sea.checkpoint.com [208.252.84.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92A05482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 16:16:19 -0600 (MDT)
Received: from cartman.sea.checkpoint.com (localhost [127.0.0.1])
	by postal.sea.checkpoint.com (8.9.3/8.9.3.RJ666.9) with ESMTP id PAA21369
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 15:14:01 -0700
From: marka@sea.checkpoint.com
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 19 Sep 2001 15:16:09 -0700 (Pacific Daylight Time)
In-Reply-To: <B5C5D2CDB8BCD2118E4800A0C9D8E4C70177592A@cartman.sea.checkpoint.com>
Message-ID: <Pine.WNT.4.33.0109191515260.5872-100000@nemo.dev.metainfo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: interesting problem in tty? telnetd? ls?
List-ID: <linux-parisc.vger.kernel.org>

This is with the telnetd obtained from 'apt-get telnetd' btw.

On Wed, 19 Sep 2001, Mark Atkinson wrote:
> you'll lose your ptty and telnet session after a short while (seconds), but
> never at the the same place during the listing.  This does not occur over the
> serial console, but since that's only running at 9600 it may not be fast
> enough for the drop to occur.

--
Mark

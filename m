Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4FB0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Sep 2001 19:01:45 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.4d3e3a24) with ESMTP id saomhaaa for parisc-linux@lists.parisc-linux.org; Tue, 4 Sep 2001 17:57:34 -0700
Date: Tue, 4 Sep 2001 18:01:28 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on parisc architecture
Message-ID: <20010904180128.D4408@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010902105538.A15344@middle.of.nowhere> <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk> <20010902.160441.92583890.davem@redhat.com> <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > Is it impossible to handle unaligned access traps properly on
> > parisc?  If so, well you have some problems...
> 
> No, we just haven't bothered to implement it yet.  Not many people
> use IPX these days.

It should be easy to handle kernel unalignment traps in
parisc/kernel/unaligned.c like we currently do for userspace (in fact
there already is some code to do this). I thought we didn't want to do
this though?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

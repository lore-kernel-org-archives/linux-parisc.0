Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0774F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jan 2002 10:22:30 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id lhhfkaaa for parisc-linux@lists.parisc-linux.org; Wed, 9 Jan 2002 10:16:51 -0700
Date: Wed, 9 Jan 2002 09:22:17 -0800
From: Randolph Chung <randolph@tausq.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] loading the dump modules: will taint the kernel.
Message-ID: <20020109172217.GH3247@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3C3C79B1.2D4AF279@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3C79B1.2D4AF279@admin.france.hp.com>
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

In reference to a message from Bruno Vidal, dated Jan 09:
> 	Hi
> I've created a modules for the dump driver. When loading the
> modules I receive the following message:
> #insmod dump
> Using /lib/modules/2.4.17-pa3/kernel/drivers/dump/dump.o
> Warning: loading /lib/modules/2.4.17-pa3/kernel/drivers/dump/dump.o will taint the kernel: no license
> 
> But everything seems okay, the modules is here, everything is here ???
> What means this message ?

Add this, or something similar, to your driver:
MODULE_LICENSE("GPL");

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

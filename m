Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93F484848
	for <parisc-linux@parisc-linux.org>; Tue,  5 Mar 2002 15:52:46 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id lfuvlaaa for parisc-linux@parisc-linux.org; Tue, 5 Mar 2002 15:52:20 -0700
Date: Tue, 5 Mar 2002 14:52:34 -0800
From: Randolph Chung <randolph@tausq.org>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] SMP support
Message-ID: <20020305225234.GE26587@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.33L2.0203051434270.6941-100000@eiger.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33L2.0203051434270.6941-100000@eiger.apptechsys.com>
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

> depmod: Unhandled relocation of type 74 for printk_Rsmp_dd132261
> depmod: Unhandled relocation of type 74 for usb_deregister_Rsmp_c6f994d5
> 
> This is using the make-kpkg kernel_image command.

yeah, this is a known problem. someone needs to look at updating
modutils..... any volunteers? :-)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

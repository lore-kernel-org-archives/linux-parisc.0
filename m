Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49CDB484B
	for <parisc-linux@parisc-linux.org>; Sun, 24 Mar 2002 17:33:39 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id gbdemaaa for parisc-linux@parisc-linux.org; Sun, 24 Mar 2002 17:32:43 -0700
Date: Sun, 24 Mar 2002 16:33:12 -0800
From: Randolph Chung <tausq@debian.org>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.17-32-smp problem
Message-ID: <20020325003312.GA26353@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <Pine.LNX.4.33L2.0203231953470.13376-100000@eiger.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33L2.0203231953470.13376-100000@eiger.apptechsys.com>
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

> I would also like to ask you hardware gurus out there if I were to buy and
> add a PCI USB controller to the J5000, if the firmware would detect the
> keyboard and boot properly.

looks like j5000 also has suckyio... so you should have a builtin usb 
controller on your machine. why not just use that?

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/

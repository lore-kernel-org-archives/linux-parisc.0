Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41743482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 11:12:24 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id cxtikaaa for parisc-linux@lists.parisc-linux.org; Tue, 15 Jan 2002 11:12:29 -0700
Date: Tue, 15 Jan 2002 10:11:58 -0800
From: Randolph Chung <randolph@tausq.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
Message-ID: <20020115181158.GT3247@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.43.0201142041450.7418-200000@alpha.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.43.0201142041450.7418-200000@alpha.bocc.de>
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

> this patch fixes some endianess issues of the current ibmtr driver. 
> Although the current uses of htons() etc look correct, they are not: the 
> writew/readw API already do the byte swap on big endian machines.

the write/read macros are defined for pci accesses, and as such take a
LE point of view with respect to memory accesses. I take it that you are
not accessing a PCI device, so that's why you are having problems with
endianess.  I suspect your patch will break the driver on PCI devices...
(assuming there are both PCI and [E]ISA versions of the device that
share the same driver).

> Additionally, i added a switch to turn off IPv4 summing. This might be 
> needed for IPv6 and is absolutely necessary on HP PARISC platform with the 
> current broken ioremap implementation. The IPv4 summing is the only place 
> in the driver that accesses memory directly without the readX or 
> memcpy_fromio macros.

How is ioremap broken? (Just curious). From what I understand ioremap is
currently a nop in the parisc-linux vm/io design.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id E94EE482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 12:43:03 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ybxwiaaa for parisc-linux@parisc-linux.org; Tue, 13 Nov 2001 12:38:05 -0700
Date: Tue, 13 Nov 2001 11:42:48 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] to swap or not to swap
Message-ID: <20011113114247.G3053@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011113003057.H391@tausq.org> <20011113142545.E11817@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011113142545.E11817@parcelfarce.linux.theplanet.co.uk>
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

> depends on the PCI bridge and MMU whether you need to do bytesexswapping
> in software or not.  see section 9 in the Dino ERS, page 61 for how PA
> does this.

Empirically I've found this not to be the case. For example, if i need
to write 0x01 to byte 0 of a 16-bit PCI register, I've found I need to
do:

writew(0x0100, addr) on parisc
vs
writew(0x0001, addr) on x86

Grant also seems to be of the opinion that cpu data needs to be swapped
before written to PCI devices... so does that mean that if i wrote
something like:

writew(cpu_to_le16(foo), addr)

then on things like parisc it gets swapped once, and on things like
sparc it gets swapped twice?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 421BC485F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 13:39:04 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16eMT8-0008H3-00; Fri, 22 Feb 2002 20:39:02 +0000
Date: Fri, 22 Feb 2002 20:39:02 +0000
From: Matthew Wilcox <willy@debian.org>
To: Peter Mottram <peter@petescaff.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Strange serial behaviour on C160
Message-ID: <20020222203902.A30545@parcelfarce.linux.theplanet.co.uk>
References: <20020220204800.A27212@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.42.0202221752390.14794-100000@r6.petescaff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.42.0202221752390.14794-100000@r6.petescaff.com>; from peter@petescaff.com on Fri, Feb 22, 2002 at 05:58:04PM +0100
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

On Fri, Feb 22, 2002 at 05:58:04PM +0100, Peter Mottram wrote:
> I now have 2.4.17-pa28 running on my C160 & things have improved but are
> not yet perfect as I still have three serial ports......
> 
> /dev/ttyS0, UART: 16550A, Port: 0x0000, IRQ: 90
> /dev/ttyS1, UART: 16550A, Port: 0x0000, IRQ: 121
> /dev/ttyS2, UART: 16550A, Port: 0x0000, IRQ: 121

Umm.. where are you getting this output from?  The serial devices don't
show up in port space but in io memory.  Can you provide me with a dmesg
(by private mail, no need to clog the list archive; I'll reply with the
relevant bits)?

> Of these devices the functional ports are 0 & 2. The weird speed problems
> have gone away so I can use my second serial port without problems - it is
> just a little odd that the rogue ttyS1 still shows up.

Yes, it is.  Glad to hear the speed problems are gone though.

-- 
Revolutions do not require corporate support.

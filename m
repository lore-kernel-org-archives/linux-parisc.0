Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1DA84829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 19:01:46 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id SAA21845
	for <parisc-linux@lists.parisc-linux.org>; Sat, 9 Nov 2002 18:01:37 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gAA21Uv04824;
	Sat, 9 Nov 2002 21:01:30 -0500
Message-Id: <200211100201.gAA21Uv04824@localhost.localdomain>
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: James.Bottomley@SteelEye.com, andmike@us.ibm.com, greg@kroah.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org, willy@debian.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device
 interface
In-Reply-To: Message from "Adam J. Richter" <adam@yggdrasil.com>
   of "Sat, 09 Nov 2002 16:23:59 PST." <200211100023.QAA27139@baldur.yggdrasil.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 09 Nov 2002 21:01:29 -0500
From: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
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

adam@yggdrasil.com said:
> 
> 	I'd like to know more about what these machines look like in the real
> world.  Specifically, I am interested in the trade-off of having a
> parameter to wback_fake_consistent so that it could be enabled or
> disabled on an individual basis.

Actually, so would I.  I can suspect why there might exist machines like this 
(say the consistent attribute is settable at the pgd level)

> 	I suspect that the parameter is not worth the clutter because these
> "partially consistent" machines either have a large amount of
> consistent memory, so the case of the allocation failing in the is not
> worth supporting, or it is easy to check for consistent memory on them
> with something like "if ((unsigned long) vaddr < 0xwhatever)", but I'm
> just guessing. 

Well, if it has to be done, it can be done by making alloc_consistent return a 
handle rather than an address and making wback/invalidate take the handle (but 
it's certainly not ideal).

James

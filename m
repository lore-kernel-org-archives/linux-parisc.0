Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EE234829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Sep 2002 15:37:23 -0600 (MDT)
Message-ID: <3D864F0D.32223AC9@gmx.at>
Date: Mon, 16 Sep 2002 23:37:17 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] SPIFI hardware access
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

Hello Ryan
,

I think we have a much more basic problem, I thought
up to now. I think all bus accesses to the device 
are unsuccessfull.

Independent of the word position, I read back a 
0x0000ff00. You see this as a counter value, and
even the regs->spstat deliveres 0x0000ff00 and via
the bit operations the ID=7 results, and I thought
at the beginning, this wa correctly read out .... !

What are doing we wrong in the bus access or device
access. The MUX port can be accessed, what's the
difference here ?

Christoph


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

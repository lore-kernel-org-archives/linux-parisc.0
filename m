Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B7584829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 16:24:50 -0600 (MDT)
Message-ID: <3D8265C6.16ECEBB@gmx.at>
Date: Sat, 14 Sep 2002 00:25:10 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] MUX driver for multiple ports (lines)
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

Hallo Ryan,

have you already got docu on the serial MUX board ?
Or where do you have the information about `#define's
from. Is the MUX_LINE_OFFSET (= 0x80) the key point.

I have tried to access the board at
	membase + MUX_OFFSET + line * MUX_LINE_OFFSET,
but the first write access to /dev/ttyB1 results in
a hang up (completely, even no network interrupts
were processed !).

Operates the MUX driver in polling mode ? Not in IRQ mode ?

Christoph

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

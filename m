Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DE8F482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 11:31:25 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GP664A02.0E0 for
          <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 09:31:22 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GP664F01.50I for <parisc-linux@parisc-linux.org>; Sun, 30 Dec
          2001 09:31:27 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA11466
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 09:28:21 -0900
Date: Sun, 30 Dec 2001 09:28:21 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112300925420.11391-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Serial console settings?
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

Maybe I'm missing somethign here... I set up a serial console on the C180,
which works great at 9600. Want to speed it up, so I changed the settings
to rs232_1.38400.n.8 (or whatever the exact syntax is - the PDC is happy
with it). Power-cycle, reset terminal to 38400 and nothing. Reset terminal
to 9600 and there's the screen... Doesn't seem to matter what I set the
console speed to in the PDC - it always runs at 9600. Is there some way I
have to "push" this, or otherwise save it?

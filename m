Return-Path: <ukd@xenon.pc.Uni-Koeln.DE>
Received: from xenon.pc.Uni-Koeln.DE (xenon.pc.Uni-Koeln.DE [134.95.49.170])
	by dsl2.external.hp.com (Postfix) with ESMTP id DEF83483A
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 03:43:45 -0600 (MDT)
Received: (from ukd@localhost)
	by xenon.pc.Uni-Koeln.DE (8.9.3 (PHNE_28760_binary)/8.9.3) id LAA01567
	for parisc-linux@lists.parisc-linux.org;
	Wed, 14 Apr 2004 11:44:44 +0200 (METDST)
Date: Wed, 14 Apr 2004 11:44:44 +0200 (METDST)
From: Ulrich Deiters <ukd@xenon.pc.Uni-Koeln.DE>
Message-Id: <200404140944.LAA01567@xenon.pc.Uni-Koeln.DE>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] B1000/C3000
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I just wanted to install parisc-linux 3.0r2 on a HP C3000, 
using an external serial terminal. The installation went more 
or less smoothly, but the X server does not come up.

The kdm log says "no screens found".

I note that there is no X*screens file in /etc/kde2/kdm, but I do 
not know whether this is normal or not - this is my first Debian 
installation.

What must I do to get my X server running? Or is it hopeless, 
because the HP graphics card (FX2) is not supported?

Regards,

Ulrich Deiters

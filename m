Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gustlik.softwired.wfc (unknown [217.153.17.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED6D0483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Oct 2003 12:15:40 -0600 (MDT)
Date: Tue, 14 Oct 2003 20:20:14 +0200 (CEST)
From: "Hin.Zen" <hinzen@blah.pl>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0310141949150.17639@gustlik.softwired.wfc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] ATI rage xl and C360 (it works!)
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

Hello List,

last night I accidentally found this:
http://ftp.fi.muni.cz/pub/linux/sgi/people/ppopov/aty_nobiosinit.patch

and patched 2.4.22-pa12 on my C360.
After that the rage xl seems to work just fine [minor problems with
colors and XFree (fbdev mode) running 1280x1024].

Could anybody who owns such a card (or can easily get one) test it please?
(maybe Joel?)

thanks,

-- 
hinzen

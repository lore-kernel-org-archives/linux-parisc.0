Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94C90482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 12:55:35 -0700 (MST)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA08850
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 12:55:34 -0700
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m16Km3S-000OuPC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 12:55:34 -0700 (MST)
Message-Id: <m16Km3S-000OuPC@bame.riverrock.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Date: Sun, 30 Dec 2001 12:55:34 -0700
From: Paul Bame <bame@riverrock.org>
Subject: [parisc-linux] puffin cracked, Action Required
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

On Dec 18 puffin.external.hp.com was removed from service because
it had been compromised.  We knew this was possible (RH 5.2) which
is why we moved all services off of puffin.

Baddies definitely have the password file, so if you used the
same password on puffin as elsewhere you should probably change it,
and especially if 'crack' can guess it.

Baddies also trojaned ssh, so if you used ssh *from* pehc *to* another
machine, whatever credentials you used may have been stolen -- whether
that's the password to the remote machine or the pass phrase to your
secret key stored on pehc.  So if you ssh-ed *from* pehc you should
change the credentials you used.  Those of you whose ssh credentials
were recorded in the trojan's "jackpot" file have long since been
contacted and you've taken action -- you have haven't you?!

It would be a good idea to check for evidence of intrusion on
any machines where stolen credentials could be used.

If you need to recover some of your files from pehc please contact
me with the specifics, or taggart@fc.hp.com from Jan 4-18.

	-P

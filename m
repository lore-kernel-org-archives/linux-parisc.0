Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.kwaak.net (fia171-26.dsl.hccnet.nl [62.251.26.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id F23D34844
	for <parisc-linux@parisc-linux.org>; Sun,  3 Aug 2003 23:48:35 -0600 (MDT)
Received: from ard by mail.kwaak.net with local (Exim 3.35 #1 (Debian))
	id 19jYCK-00041x-00
	for <parisc-linux@parisc-linux.org>; Mon, 04 Aug 2003 07:47:56 +0200
Date: Mon, 4 Aug 2003 07:47:56 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <20030804054756.GO27784@kwaak.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Ard van Breemen <ard@kwaak.net>
Subject: [parisc-linux] A4308A nic
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

Hi,
I just installed debian on my D250.
Those guys making the network install realy did a good job...
It almost worked out of the box. The only cullprit was that it
crashed on a bluefish FWD scsi controller not having any
terminators on the bus...

Allright,
But now I see this A4308A, a real surprising card, and what I
find more surprising is that I did not find it on the
mailinglist.
The card is an EISA card, which contains a PLX EISA9032, probably
an EISA to PCI bridge (and not v.v.!), an intel 82556, and an LSI
L5A4242. I can understand the plx and the intel, but the LSI?
If I search for these items, I find some 3com EISA cards with the
LSI L5A4242 for sale, not mentioning the intel etc. ...
So I reckon the LSI should be some kind of processor?
I've got some pictures of it (in a few hours actually, my
upstream is not that big):
http://nerdcentral.nerdnet.nl/~avb/2003-08-04.00/

Things I want:
- Any confirmation that it is not supported yet. (Eh, and of
  course that I am not making a fool of myself because I could
  have RTFMd :-) ).
- Anyone with docs on the 3com card.
- If possible on the A4308A card.
- PLX EISA9032, I cannot find it on www.plxtech.com...

And thanks for giving me the pleasure for having an hp9000 :-)
-- 
mail          up  260+18:54,     8 users,  load 0.00, 0.19, 0.93
mistar1     down   29+18:54
Let your government know you value your freedom: sign the petition:
http://petition.eurolinux.org

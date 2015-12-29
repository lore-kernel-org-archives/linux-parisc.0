From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: self-assignment in dino_card_setup
Date: Tue, 29 Dec 2015 21:03:32 +0100
Message-ID: <87k2nx3tuz.fsf@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Line 474 of drivers/parisc/dino.c reads

        res->name = dino_dev->hba.lmmio_space.name;

but res is &dino_dev->hba.lmmio_space, so this seems to just assign NULL
again to res->name. Presumably the allocation of <= 128 bytes never
fails, but I wonder what the purpose was, and if the confusing else
branch couldn't just be deleted (and then one should just do res->name =
kmemdup(name, size+1, GFP_KERNEL); and delete the if as well).

Rasmus

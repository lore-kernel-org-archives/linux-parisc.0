Received: from chalet ([199.254.238.240])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id VAA22896
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 21:14:49 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13y4do-001Vp4C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 21:02:44 -0700 (MST)
Message-Id: <m13y4do-001Vp4C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] 712 ISL and palo
In-reply-to: Your message of "Mon, 20 Nov 2000 17:19:03 PST."
             <200011210119.RAA19517@milano.cup.hp.com>
Date: Mon, 20 Nov 2000 21:02:40 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= palo wouldn't accept any ps/2 keyboard input.
= Don't know if this is a palo or PDC bug.
= Any ideas?

PALO bug.  I didn't test the PS/2 case but I think I fixed it.

	-P

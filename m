Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA15671
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 00:23:22 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200011200724.XAA07561@opus.allegro.com>
Subject: Re: Single-stepping
To: alan@linuxcare.com.au (Alan Modra)
Date: Sun, 19 Nov 2000 23:24:00 -0800 (PST)
Cc: jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0011201703290.15391-100000@front.linuxcare.com.au> from "Alan Modra" at Nov 20, 2000 05:53:18 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> handlers you mention below.  Maybe using the recovery counter isn't such a

quite true.

> bad idea after all, especially since the added syscall and task switch
> overhead can be quite small if the kernel only supports single-step by
> one instruction.

why the limit?  We've used multi-instruction "single step" (oxymoron :)
for about 15 years on PA-RISC...no problems, efficient, and *very*
useful!
 
-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        

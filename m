Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA20964
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 17:17:50 -0600
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by cosrel2.hp.com (Postfix) with ESMTP id ED6F8494
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Aug 2000 17:17:35 -0600 (MDT)
Cc: parisc-linux@thepuffingroup.com
To: Alan Modra <amodra@puffin.external.hp.com>
Subject: Re: [parisc-linux] 64-bit cross compiler broken 
In-Reply-To: Your message of "Fri, 25 Aug 2000 15:47:17 MDT."
             <E13SRJl-0001kq-00@noam.fc.hp.com>
References: <E13SRJl-0001kq-00@noam.fc.hp.com> 
Date: Fri, 25 Aug 2000 17:17:53 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13SSjR-00050l-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= The current 64-bit cross compiler dies on drivers/block/rd.c
= 

Another 64-bit gotcha: in arch/parisc64/kernel/entry.S:start_parisc_asm
the 'b start_parisc' is branching through a stub and failing miserably.
Linker problem?

	-P

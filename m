Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23150
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 09:15:20 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel2.hp.com (Postfix) with ESMTP id CF5E6CAD
	for <parisc-linux@thepuffingroup.com>; Tue, 30 May 2000 11:15:45 -0400 (EDT)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CONFIG_SYSCTL is not set 
In-reply-to: Your message of "Mon, 29 May 2000 19:01:07 PDT."
             <200005300201.TAA11206@milano.cup.hp.com>
Date: Tue, 30 May 2000 09:15:44 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12wnk8-0007jZ-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


As a temporary hack, I changed arch/parisc/defconfig to enable
CONFIG_SYSCTL and defined sysrq_enabled in arch/parisc/kernel/setup.c.
The kernel will link this way at least, but it's not the "right answer".

	-P

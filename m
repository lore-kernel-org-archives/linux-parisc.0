Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA31639
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 09:18:04 -0700
Received: from relay.core.genedata.com (nila-e0.core.genedata.com [157.161.173.44])
	by mail.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dA6GJM711612
	for <parisc-linux@thepuffingroup.com>; Sat, 6 Nov 1999 17:19:22 +0100
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by relay.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dA6GJMX23464
	for <parisc-linux@thepuffingroup.com>; Sat, 6 Nov 1999 17:19:22 +0100
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id RAA738677
	for <parisc-linux@thepuffingroup.com>; Sat, 6 Nov 1999 17:19:21 +0100 (CET)
Received: by genedata.com
	via sendmail from stdin
	id <m11k8Zj-00028LC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sat, 6 Nov 1999 17:20:23 +0100 (CET)
Date: Sat, 6 Nov 1999 17:20:23 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991106172023.L25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] pgtable.h:acc_rights()
List-ID: <linux-parisc.vger.kernel.org>


Why is acc_rights written like this?

#define acc_rights(pte)       \
        (((pte) & _PAGE_EXEC) ? \
                (((pte) & _PAGE_RW) ? \
                        acc_r(3,acc_pl(pte),acc_pl(pte)) : \
                        acc_r(3,acc_pl(pte),acc_pl(pte))) : \
                (((pte) & _PAGE_RW) ? \
                        acc_r(1,acc_pl(pte),acc_pl(pte)) : \
                        acc_r(1,acc_pl(pte),acc_pl(pte))))

According to the PA-1.1 Architecture manual I have here, if the page isn't
writable, the MSB should be clear, like so:

#define acc_rights(pte)       \
        (((pte) & _PAGE_EXEC) ? \
                (((pte) & _PAGE_RW) ? \
                        acc_r(3,acc_pl(pte),acc_pl(pte)) : \
                        acc_r(2,acc_pl(pte),acc_pl(pte))) : \
                (((pte) & _PAGE_RW) ? \
                        acc_r(1,acc_pl(pte),acc_pl(pte)) : \
                        acc_r(0,acc_pl(pte),acc_pl(pte))))

of course, it should be rewritten to look much cleaner.  In fact,
by renumbering the bits, we could get that for free (as long as we put
a big fat warning above the #defines of _PAGE_* to warn that the
constants are in that order for hardware efficiency).
              
Anyway, I'm after a spare bit in the pte for _PAGE_GATEWAY.  As I
understand it (from the mk_pte() macro), there are 12 bits available,
only 8 of which are used, so I can nobble one of them to mark a page
as being a gateway, right?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA04655
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 11:18:32 -0700
Received: from relay.core.genedata.com (nila-e0.core.genedata.com [157.161.173.44])
	by mail.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dADIJtS13972
	for <parisc-linux@thepuffingroup.com>; Sat, 13 Nov 1999 19:19:56 +0100
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by relay.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dADIJtP10281
	for <parisc-linux@thepuffingroup.com>; Sat, 13 Nov 1999 19:19:55 +0100
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id TAA1126952
	for <parisc-linux@thepuffingroup.com>; Sat, 13 Nov 1999 19:19:54 +0100 (CET)
Received: by genedata.com
	via sendmail from stdin
	id <m11mho7-00026uC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sat, 13 Nov 1999 19:21:51 +0100 (CET)
Date: Sat, 13 Nov 1999 19:21:50 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991113192150.X25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715 useful
List-ID: <linux-parisc.vger.kernel.org>


I've got keyboard input working on the 715/33 (should also work on 715/50
and 715/75).  There's still some bits which I don't want to commit, so you
can ftp those from
puffin.external.hp.com/pub/parisc/src/patch-715-19991113
if you want to type amazing sash commands on your 715.  try `help' as your
first one.

For the machines which have ASP, am I right in saying they have no other
sources of interrupts?  ie what I want to do is:

if we detect an ASP, set the interrupt routine to load the IRR from ASP
and then only make one pass through do_irq_mask instead of two.

This lets me not bother which irq line ASP is interrupting on, at the
expense of not being able to take interrupts from any other source.
And it'll reduce interrupt latency on those older machines with ASP,
so it seems like a win, unless I'm wrong and it's possible to add other
sources of interrupt to them.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA29911
	for <parisc-linux@puffin.external.hp.com>; Sat, 31 Jul 1999 11:43:09 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id TAA29991
	for <parisc-linux@thepuffingroup.com>; Sat, 31 Jul 1999 19:44:07 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id TAA572889
	for <parisc-linux@thepuffingroup.com>; Sat, 31 Jul 1999 19:44:06 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m11AdAz-00025qC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sat, 31 Jul 1999 19:44:05 +0200 (CEST)
Date: Sat, 31 Jul 1999 19:44:05 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990731194405.U25925@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] looking for something to do?
List-ID: <linux-parisc.vger.kernel.org>


I know there are some people sitting around who'd like to help with this
project, but feel they are insufficiently able.  I have a task here which
requires almost no prior knowledge, just some time.  As an added bonus,
you'll gain some experience and knowledge.  What I need is a table which
has the entry points for HPUX syscalls.

Take a look at arch/parisc/kernel/entry.S which has the linux syscalls in
it, copy it to hpux_entry.S and modify it to have HPUX syscalls instead
(the numbers are in include/asm-parisc/unistd.h).  Use the relevant linux
syscalls where they are _identical_.  That means parameters and behaviour.
Where they are not, some glue code must be written to mangle the hpux
parameters into those that Linux is expecting.  If you're interested,
drop me a mail to let me know you're doing it, and I'll give you a hand
if you get stuck.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from laas.laas.fr (laas.laas.fr [140.93.0.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B1B9482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 12:09:01 -0600 (MDT)
Received: from laas.fr (raptor [140.93.21.82])
	by laas.laas.fr (8.12.3/8.12.3) with ESMTP id g4PI8wiW000176
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 20:08:59 +0200 (CEST)
Message-ID: <3CEFD33A.9010007@laas.fr>
Date: Sat, 25 May 2002 20:08:58 +0200
From: Thomas Marteau <tmarteau@laas.fr>
MIME-Version: 1.0
To: parisc linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] PA-RISC/Linux boot HOWTO
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

Hi all,

	I just released my sgml source of the HOWTO on my CVS. So, if you want to 
see the latest version of the HOWTO go there:
http://cvsweb.tuxfamily.org/cvs/?cvsroot=hppa#dirlist

You'll see the english and the french version of the howto. I plan to 
release next step with Debian 3.0.

You can retrieve the files:
export CVSROOT=:pserver:marteaut@cvs.tuxfamily.org:/cvsroot/hppa
cvs co howto[fr]
cd howto[fr]
make [ps|pdf|one|html|version|clean]

ps: for ps output
pdf: for pdf output
one: for one-html-file output
html: for multi-html-file output in html directory
version: gives you the version of docbook and sgmltools
clean: guess :)

Here, it works with:
ii  docbook        4.1.99
ii  docbook-book   2.0.2-1
ii  docbook-doc    30d10-7
hi  docbook-dsssl  1.76-1
ii  docbook-dsssl- 1.75-1
ii  docbook-to-man 2.0.0-10
ii  docbook-utils  0.6.10-1
ii  docbook-xml    4.1.99
ii  psgml          1.2.4-9
ii  sgml-base      1.14
ii  sgml-data      1.5.5
ii  sgmltools-lite 3.0.3.0.cvs.20

Thanks for your feedback, Thomas.

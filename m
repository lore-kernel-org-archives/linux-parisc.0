Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AFB44866
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 13:21:15 -0600 (MDT)
Received: from smtp2.fc.hp.com (smtp2b.fc.hp.com [15.15.136.253])
	by atlrel8.hp.com (Postfix) with ESMTP id C8283A00A6B
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 15:21:14 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by smtp2.fc.hp.com (Postfix) with ESMTP id 8A9AD380D1
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 13:21:14 -0600 (MDT)
Received: from paul.bame (lart.fc.hp.com [15.1.54.48])
	by ldl.fc.hp.com (Postfix) with ESMTP id 7256B435E
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 13:21:14 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by paul.bame with esmtp (Exim 3.35 #1 (Debian))
	id 17XRhC-0006Sh-00
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 13:21:14 -0600
To: parisc-linux@parisc-linux.org
Date: Wed, 24 Jul 2002 13:21:14 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E17XRhC-0006Sh-00@paul.bame>
Subject: [parisc-linux] Attention - 'make palo' change
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

Especially when cross compiling kernels, many of us have used 'make
palo'.  Unfortunately that required having and building the palo source.
Since palo is installable (at least on x86 and parisc), the time was
right to change this.  There have also been some complications with
'make palo' and the 2.5 development kernel.

So with 2.4.18-pa58, 'make palo' no longer builds palo, but instead
requires you have it installed and in your $PATH.  An error message
will tell you this information if necessary.  Palo's command-line
parameters are taken from 'palo.conf' in your top-level kernel
directory.  If you don't have a palo.conf, a lightly-commented
generic one will be created and you'll be informed about that.  Simply
edit it and run 'make palo' again.  That generic palo.conf file
leaves the lifimage in your top-level kernel directory rather
than ../palo/lifimage where it used to go.  You can change that
in the config file if you want.

If you want the old behavior, use 'make oldpalo', but that may
disappear soon together with the 'make lifimage' logic in palo's
makefile.

Source purists can still grab palo sources and build/install palo
either with 'make install' or by building/installing the debian package.
Take note of the DESTDIR makefile variable if you use 'make install'.

	-P

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id C482D4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 08:01:30 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA03121
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 02:01:28 +1100
Date: Tue, 20 Feb 2001 02:01:28 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102200141050.23583-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I've just merged our devel branch gcc down to the trunk.  For anyone who
wants to build it, the procedure is more or less as before, _except_
that to build just the C compiler you do

	configure blah blah --enable-languages=c
	make

instead of

	configure blah blah
	rm some_dirs
	make LANGUAGES=c

Believe it or not, I have actually updated the recipe to reflect these
changes, but will hold off committing until snapshots appear.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

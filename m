Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97B0F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Mar 2001 01:42:16 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA32401
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Mar 2001 01:36:41 -0700
Sender: markus@lufmech.rwth-aachen.de
Message-ID: <3AC1A3C9.F94899D6@lufmech.rwth-aachen.de>
Date: Wed, 28 Mar 2001 10:41:45 +0200
From: Markus Werle <markus@lufmech.rwth-aachen.de>
MIME-Version: 1.0
To: Jane Vinet <jvinet@linuxcare.com>,
	parisc-linux@thepuffingroup.com
References: <3A75766A.CF9A3C23@lufmech.rwth-aachen.de> <3A757FB9.6DCD3A91@linuxcare.com> <3A757F68.1833548@lufmech.rwth-aachen.de>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] a new (and free) C++ compiler for hppa!
List-ID: <linux-parisc.vger.kernel.org>

Of course I am talking about gcc-3.0, but I am not sure if
it will come on that platform. My experience with
gcc on hpux is: better buld it with gcc as a starting point
(hen and egg problem) This is why I really want an access to
the cvs server of the puffin group, in the hope that puffin-gcc
bootstraps on a vanilla system.

Back to the nitty gritty:

I reported a failure of anonymous cvs access on this ML
some weeks ago (Mon, 29 Jan 2001).
It is still impossible for me to log in.

It may be that I am too stupid to do it right, but then please help me:
I did the cvs login as described, but anonymous login failed for some
unknown reason.

any idea?

> cvs --version

Concurrent Versions System (CVS) 1.11 (client/server)

> cvs -d :pserver:anonymous@puffin.external.hp.com:/home/cvs/parisccv login
anonymous
(Logging in to anonymous@puffin.external.hp.com)
CVS password:
cvs login: authorization failed: server puffin.external.hp.com rejected
access to /home/cvs/parisccv for user anonymous


Markus

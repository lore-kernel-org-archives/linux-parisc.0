Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E047483E
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 11:59:00 -0700 (MST)
Message-Id: <200302261858.h1QIwvSJ019646@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: jsoe0708@tiscali.be (Joel Soete)
Date: Wed, 26 Feb 2003 13:58:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <3E5BA2910000087F@ocpmta3.freegates.net> from "Joel Soete" at Feb 26, 2003 07:31:05 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Would I have to open a bug report near gcc with this one?

You mean for the errors:

joel.c:19: error: initializer element is not constant
joel.c:19: error: (near initialization for `MyRWLock')
joel.c:19: error: initializer element is not constant

No, fix the code.  I don't believe you will win this one.  This
feature (extension) was deliberately removed from GCC.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

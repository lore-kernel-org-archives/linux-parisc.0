Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id A36E2482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Feb 2002 11:00:57 -0700 (MST)
Received: from kenny ([68.58.113.28])
 by mtaout4.icomcast.net (iPlanet Messaging Server 5.1 (built May  7 2001))
 with SMTP id <0GS900C8H8PEAZ@mtaout4.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Thu, 28 Feb 2002 13:00:50 -0500 (EST)
Date: Thu, 28 Feb 2002 13:00:50 -0500
From: James S <smithjames@comcast.net>
To: parisc-linux@lists.parisc-linux.org
Reply-To: James S <smithjames@comcast.net>
Message-id: <000d01c1c081$db6db9c0$02c1a8c0@james.co.uk>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Compiling source packages
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

i've downloaded a few source packages & have hit the same problem with most
of them

bear with me, i'm not that up to speed on compilers etc.....

i follow the instructions to the letter & when i do the 'make' part, i get
the following....



checking host system type... Invalid configuration
'parisc-unknown-linux-gnu': machine 'parisc-unknown' not recognized

checking build system type... Invalid configuration
'parisc-unknown-linux-gnu': machine 'parisc-unknown' not recognized


and then further on...


loading cache ./config.cache within ltconfig
ltconfig: you must specify a host type if you use --no-verify'
Try 'ltconfig --help' for more information.
configure: error: libtool configure failed


from what i can see, it seems that the compile is failing because it doesnt
know about the machine type - is there any way i can fix this by making the
system type 'linux'  or something similar ?



Thanks

James S

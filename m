Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from unixworks.net (65-85-15-21.client.dsl.net [65.85.15.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id E68F7482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Feb 2002 11:39:34 -0700 (MST)
Received: from cirrus.unixworks.net (srvr2005.unixworks.net [65.85.28.101])
	by unixworks.net (1.0.11sp/unixworks.net) with ESMTP id NAA11291
	for <parisc-linux@lists.parisc-linux.org>; Tue, 5 Feb 2002 13:36:38 -0600
Message-Id: <5.1.0.14.2.20020205123859.028e7410@pop.unixworks.net>
Date: Tue, 05 Feb 2002 12:39:52 -0600
To: parisc-linux@lists.parisc-linux.org
From: Bob Radvanovsky <rsradvan@unixworks.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Problems compoling OPENSSL-0.9.6c under PA/Linux 0.9.3 bundle
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

I've tried to compile OPENSSL for the package provided from the folks at 
http://www.openssl.org -- latest version: 0.9.6c.  Compiler blew up with 
the "-m486" option.  Took it out, and about 1/2 way into the compilation, 
the application compilation foobared.

Anyone got any ideas?  Thanks.

Bob Radvanovsky
kempyuter kensulting services, inc.
rsradvan@k2si.com

P.S.  Great O/S port-over!!!

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DE0F484B
	for <parisc-linux@parisc-linux.org>; Wed, 20 Feb 2002 10:37:18 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel8.hp.com (Postfix) with ESMTP id 8CCB8A00172
	for <parisc-linux@parisc-linux.org>; Wed, 20 Feb 2002 12:37:14 -0500 (EST)
Received: from noam.fc.hp.com (noam.fc.hp.com [15.1.52.69])
	by ldl.fc.hp.com (Postfix) with ESMTP id EB7EB403C
	for <parisc-linux@parisc-linux.org>; Wed, 20 Feb 2002 10:37:13 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.34 #1 (Debian))
	id 16dag5-00051i-00
	for <parisc-linux@parisc-linux.org>; Wed, 20 Feb 2002 10:37:13 -0700
To: parisc-linux@parisc-linux.org
Date: Wed, 20 Feb 2002 10:37:13 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16dag5-00051i-00@noam.fc.hp.com>
Subject: [parisc-linux] Fix for anon CVS problem
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

Use
    $ cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs login
not
    $ cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs/ login

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0BC04829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 14:05:29 -0700 (MST)
Received: from beavis.ybsoft.com (ns1.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 9C8122B10C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 14:05:28 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1049058328.29715.12.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 30 Mar 2003 14:05:28 -0700
Subject: [parisc-linux] "Unresolved inheritance operation" with gv, xdvi and xkeycaps
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

Hello,

I worked on tracking down the cause of this error message over the last
couple of days, and found it was the function descriptor bug in gcc that
jda already fixed in gcc-3.3.  So if you are experience this
error message, the libXt.so needs to be recompiled with a newer compiler
and the error should go away. (Note: I only had to recompile the
libXt.so, recompiling xkeycaps was not required).

Thanks,

- Ryan

P.S. thanks to tausq again for all the help in debugging these problems.


-- 
Ryan Bradetich <rbradetich@uswest.net>

Return-Path: <bame@hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88D504840
	for <parisc-linux@parisc-linux.org>;
	Wed,  4 Feb 2004 11:20:37 -0700 (MST)
Received: from smtp1.fc.hp.com (smtp.fc.hp.com [15.11.136.119])
	by atlrel8.hp.com (Postfix) with ESMTP id 52C811C0232E
	for <parisc-linux@parisc-linux.org>;
	Wed,  4 Feb 2004 13:20:37 -0500 (EST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.11.146.30])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 01D0C38637
	for <parisc-linux@parisc-linux.org>;
	Wed,  4 Feb 2004 11:20:37 -0700 (MST)
Received: from fc.hp.com (paul.bame [10.66.2.7])
	by ldl.fc.hp.com (Postfix) with ESMTP id D4FBE1340A0
	for <parisc-linux@parisc-linux.org>;
	Wed,  4 Feb 2004 11:20:36 -0700 (MST)
Received: from paul.bame (localhost [127.0.0.1])
	by fc.hp.com (Postfix) with ESMTP id B5F2B62ADD
	for <parisc-linux@parisc-linux.org>;
	Wed,  4 Feb 2004 11:20:36 -0700 (MST)
From: bame@hp.com
Errors-To: bame@hp.com
To: parisc-linux@parisc-linux.org
Date: Wed, 04 Feb 2004 11:20:35 -0700
Sender: bame@hp.com
Message-Id: <20040204182036.B9F9973819@fc.hp.com>
Cc: 
Subject: [parisc-linux] Kernel 2.6 autobuilds discontinued
Reply-To: bame@hp.com
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Kernel autobuilds for 2.6 at http://cvs.parisc-linux.org/download/linux-2.6/
have been discontinued.  Patch creation will continue as usual.

I've never been able to build 64-bit kernels and now can't build
32-bit ones either since the kernel demands a newer tool chain than is
available for woody and we need that box to stay "stable".  If someone
has appropriate woody tool chain debs I'll be happy to re-start
those builds!

	-P

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 462D94A19
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 17:33:13 -0700 (MST)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id 3CA0457F
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 19:33:10 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id RAA28619
	for <parisc-linux@parisc-linux.org>; Thu, 1 Mar 2001 17:33:08 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14YdVL-0000NE-00
	for <parisc-linux@parisc-linux.org>; Thu, 01 Mar 2001 17:33:07 -0700
To: parisc-linux@parisc-linux.org
Date: Thu, 01 Mar 2001 17:33:07 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14YdVL-0000NE-00@noam.fc.hp.com>
Subject: [parisc-linux] 64-bit compiler millicode update
List-ID: <linux-parisc.vger.kernel.org>

This affects people building 64-bit kernels after willy's (not yet
available) changes, whereupon the $$mulI millicode routine becomes
needed.

New cross compilers will soon be available, but if you just want to
get the millicode change and no others, replace your 64-bit libgcc.a
with [ftp|http]://puffin.external.hp.com/pub/parisc/binaries/libgcc.a.gz

	-P

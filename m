Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B2504A19
	for <parisc-linux@parisc-linux.org>; Fri,  2 Mar 2001 10:50:33 -0700 (MST)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id E1ECCC12
	for <parisc-linux@parisc-linux.org>; Fri,  2 Mar 2001 12:50:14 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id KAA21934
	for <parisc-linux@parisc-linux.org>; Fri, 2 Mar 2001 10:50:13 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14Ytgz-0000x5-00
	for <parisc-linux@parisc-linux.org>; Fri, 02 Mar 2001 10:50:13 -0700
To: parisc-linux@parisc-linux.org
Date: Fri, 02 Mar 2001 10:50:13 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14Ytgz-0000x5-00@noam.fc.hp.com>
Subject: [parisc-linux] Linux CVS partial cleanup
List-ID: <linux-parisc.vger.kernel.org>

Theoretically the vendor branch of Linux in CVS should match the upstream
tarballs from Linus.  I found there were lots of extra files on our
vendor branch due to older merges and
removed them from our vendor branch, which now diffs cleanly against
upstream.  If you grab old enough versions (prior to 2.4.0-test* perhaps)
it's possible you'll be missing some files because the removal I did
isn't time/tag-sequenced perfectly.  I can fix that for specific cases
if someone asks.

These changes are not visible on the main development branch, which is
as it should be.

		-P

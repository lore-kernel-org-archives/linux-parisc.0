Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E2834845
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 12:58:18 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel13.hp.com (Postfix) with ESMTP id 0182C4009D3
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 11:58:16 -0800 (PST)
Received: from cup.hp.com (maverick.cup.hp.com [15.13.105.84])
	by hpindda.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with ESMTP id LAA18709
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 11:58:11 -0800 (PST)
Message-ID: <3C8E5DCD.942E6278@cup.hp.com>
Date: Tue, 12 Mar 2002 11:58:06 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: parisc <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Switch console error.
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

Built a new kernel and trying to boot with the new one.
the following message appeared .

 ----------error Msg Start------------------
 Branching to kernel entry point 0x00100058.  If this is the last
 message you see, you may need to switch your console.  This is
 a common symptom -- search the FAQ and mailing list at parisc-linux.org


 ---END-------------------------------------------

I guess that I may have ommitted some console drivers during building my
kernel.
Anyine has nay clue about this.

I am using the following machines.
HP-N Class server.
Console is through a lanronix box.
Linux code I am using is linux-latest.tar.gz from ftp.parisc.org

I searched the mailing list, but didn't get anything specific.
Guru

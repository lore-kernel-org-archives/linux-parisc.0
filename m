Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D157482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 08:32:56 -0700 (MST)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id B2C5B47A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 16:32:48 +0100 (MET)
Received: from hpfrcu81.france.hp.com (localhost [127.0.0.1]) by iws1pb05.france.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 SMKit7.01) id QAA01128 for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 16:39:39 +0100 (MET)
Message-ID: <3C41AA3B.6598C187@hpfrcu81.france.hp.com>
Date: Sun, 13 Jan 2002 16:39:39 +0100
From: phi 4369 <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
References: <3C3F0ADA.3060504@verizon.net>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc bug
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

Hi All,

On my palinux box I got this gcc error while compiling a source code.

$ gcc -c -g -O3 c2.c
c.c: In function `string_match_1':
c.c:406: Internal error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.

Where should I submit this? since it happen on a palinux box I dunno if the
gcc maitainer does have such a box?

Thanx in advance,
Phi


--
mailto:Philippe_Benard@hp.com
WTEC HP-UX kernel debugging tools

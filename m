Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tungsten.btinternet.com (tungsten.btinternet.com [194.73.73.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91CF0482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Apr 2001 07:35:15 -0600 (MDT)
Received: from [213.122.37.179] (helo=tardis)
	by tungsten.btinternet.com with esmtp (Exim 3.03 #83)
	id 14rK1B-0005ia-00
	for parisc-linux@lists.parisc-linux.org; Sun, 22 Apr 2001 14:35:13 +0100
Date: Sun, 22 Apr 2001 14:31:16 +0100 (BST)
From: Dave Gilbert <gilbertd@treblig.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.10.10104221429520.3101-100000@tardis.home.dave>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Current CVS gcc build
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  In the current puffin CVS gcc a make install tried to install assert.h
in /install rather than in prefix.

Dave

-- 
 ---------------- Have a happy GNU millennium! ----------------------   
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \ 
\ gro.gilbert @ treblig.org | MIPS,x86,ARM, SPARC and HP-PA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from humbolt.nl.linux.org (humbolt.nl.linux.org [131.211.28.48])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBF81482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 05:05:35 -0600 (MDT)
Received: (from localhost user: 'armijn' uid#1008 fake: STDIN
	(armijn@humbolt.nl.linux.org)) by humbolt.nl.linux.org
	id <S16110AbSEQLF1>; Fri, 17 May 2002 13:05:27 +0200
Date: Fri, 17 May 2002 13:05:27 +0200
From: Armijn Hemel <armijn@nl.linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020517130527.J32014@humbolt.geo.uu.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] installing on b2600 fails
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

hi all,

I tried to install a b2600 workstation with Linux, but I couldn't get it
to work. I tried to install Debian woody (downloaded unofficial ISO from
http://cdimage-unofficial.debian.net/), which didn't want to install
(couldn't find a library). I also tried the 0.9.3 release PARISC-Linux (full
install) which also didn't work.

I got either a stack dump when it was loading the ramdisk, or I got the
following errors on the funky display on the front of the machine:

HPMC initiated, bus timeout, bad os HPMC cksm, OS HPMC br err

I am wondering what went wrong. I'm quite new to PA-RISC hardware, so
I don't know if this is a software or hardware failure. Can anyone help
me with this? Thanks in advance.

armijn

-- 
 ---------------------------------------------------------------------------
   armijn@nl.linux.org | http://people.nl.linux.org/~armijn/ | Penguin Power
 ---------------------------------------------------------------------------
                 http://nl.linux.org/ | Alles over Linux
 ---------------------------------------------------------------------------

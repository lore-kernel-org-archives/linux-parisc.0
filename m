Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01061482A
	for <parisc-linux@parisc-linux.org>; Wed, 28 Mar 2001 16:11:21 -0700 (MST)
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by deimos.frii.net (8.11.2/8.11.2) with ESMTP id f2SNBL253956
	for <parisc-linux@parisc-linux.org>; Wed, 28 Mar 2001 16:11:21 -0700 (MST)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA30150
	for <parisc-linux@parisc-linux.org>; Wed, 28 Mar 2001 16:11:19 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m14iP5y-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Wed, 28 Mar 2001 16:11:18 -0700 (MST)
Message-Id: <m14iP5y-001VltC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@parisc-linux.org
Date: Wed, 28 Mar 2001 16:11:18 -0700
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] FYI floating point
List-ID: <linux-parisc.vger.kernel.org>

After adding code to emulate the FRND instruction I thought
I'd be done with FP, but I've been seeing unimplemented instruction traps
on FP instructions that I know are implemented (FSUB, FDIV).  Apparently
the FPU expects emulation to handle the exceptional cases of some
instructions (such as division by a very tiny number).  Don't count
on this to be fixed until sometime next week.

	-Paul Bame

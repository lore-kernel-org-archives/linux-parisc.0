Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta05.chello.at (viemta05.chello.at [195.34.133.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51BB7482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Apr 2001 15:43:13 -0600 (MDT)
Received: from dot.at ([62.178.92.247]) by viemta05.chello.at
          (InterMail vK.4.03.02.00 201-232-124 license 6aea1bd1f01aef5a9a73363c16ebee43)
          with ESMTP id <20010416214310.PRGM29087.viemta05@dot.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 16 Apr 2001 23:43:10 +0200
Sender: chris@dsl2.external.hp.com
Message-ID: <3ADB676F.473EB406@dot.at>
Date: Mon, 16 Apr 2001 23:43:11 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] one problem with base-20010404 on 720, no problems on E55
List-ID: <linux-parisc.vger.kernel.org>

Hello PA-RISC group(s)!

Thanks again for your good work.

The new tarball "base-20010404" has a problem on my 9000/720. Some
commands begin to block (I have not debugged yet).
For example a 
	ls -l /
blocks. It outputs "total 24" or whatever, but no files are displayed,
and the command blocks (no prompt comes again).

On my E55 server (9000/856) the base-20010404 works perfect !! 
An "ls -l /" works perfectly as expected.

The blocking on the 720 I also saw on some other commands, but I don't 
remember at the moment.

With friendly regards

	Christoph Plattner


-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at

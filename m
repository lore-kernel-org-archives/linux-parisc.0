Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA08221
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 14:17:30 -0700
Sender: subc@mailserv2.iuinc.com
Message-ID: <38BC2975.CCAB5108@subcarrier.org>
Date: Tue, 29 Feb 2000 15:17:57 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] branching HOW(NOT)TO
List-ID: <linux-parisc.vger.kernel.org>

Just a short note on branching.  If you are thinking about creating a
branch, you should know that branching/merging is one of the weakest
parts of CVS.

For branching I would like to establish the following conventions.  For
branch "foo" there will be a static FOO_BASE tag that marks the
beginning of the branch, and development will be done using the
FOO_BRANCH tag.  The static tag is crucial for later merging.

Using all caps is ugly but helps to distinguish between directory names
and tags names on the command line.  (This is a weak protection, but
helps when you're playing with tags at 3am in the morning.)

	- Mike.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA24924
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 18:32:26 -0600
Received: from Galois.suse.de (Galois.suse.de [194.112.123.130])
	by Cantor.suse.de (Postfix) with ESMTP id E850E32CEE
	for <parisc-linux@thepuffingroup.com>; Sat, 23 Oct 1999 02:33:18 +0200 (MEST)
Received: from Wotan.suse.de (Wotan.suse.de [10.10.0.1])
	by Galois.suse.de (Postfix) with ESMTP id D3AE767A8
	for <parisc-linux@thepuffingroup.com>; Sat, 23 Oct 1999 02:33:18 +0200 (MEST)
Date: Sat, 23 Oct 1999 02:33:18 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991023023318.D22908@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Code Readability
List-ID: <linux-parisc.vger.kernel.org>

As there already seems to be a discussion going on about this, here's a list
of things I would change in order to save developers time;  this is obviously
biased towards developers who spent some time doing this, not towards those
new to the code.

 - get rid of the cvs $Log$s.  Not only do they tend to get longer than the
code in question, they also seem to be downright boring to me.  The only
information you need in the common case is "who was the last one to modify
this file" which $Id$ does just fine.

 - use #if 0 (or #ifdef SOMETHING) instead of "/*" to comment out sections of
code more than one line long.

 - try to avoid using C++-style "//" line comments, or any comment style except
the usual one, which is
	line; /* line comment */

/*
 * long comment
 * ...
 */

 - if you use #ifdef SOMETHING_DEBUG to conditionally compile sanity checks,
put an #undef SOMETHING_DEBUG or #define SOMETHING_DEBUG at the top of the
file.  If it is a header file, you don't want to run into problems because
#define SOMETHING_DEBUG is in some .c files and not in others.

 - stay with standard linux names.  We're pretty good at that.

 - look at Documentation/CodingStyle once in a while, especially Chapter 4

	Philipp Rumpf

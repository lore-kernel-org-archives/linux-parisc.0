Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA06024
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Jan 2001 05:23:00 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 6 Jan 2001 12:26:22 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14EsQP-0004CG-00
	for parisc-linux@thepuffingroup.com; Sat, 06 Jan 2001 12:26:21 +0000
Date: Sat, 6 Jan 2001 12:26:21 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010106122621.C14922@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] website
List-ID: <linux-parisc.vger.kernel.org>


As I've mentioned before, I'm not happy with several aspects of the
proposed replacement website.

 * I believe there is too much boilerplate HTML which will quickly get out
   of sync between the different files.
 * The proposed site doesn't have the useful `last updated' feature.
 * The text is too small.
 * It uses too many tables.
 * The <title></title> gives no useful information (also a problem with the
   current site.)
 * Too many directories containing only one file.
 * It now requires perl to build.

Instead of just whining about it, I've taken the design of the proposed
site and merged it into our current site.  I don't propose to put
the results back into CVS yet, so I've made a tarball available from
ftp://puffin.external.hp.com/pub/parisc/newsite.tar.bz2.  It merges most
of the proposed site into te current site, fixing the following things:

 * Removes all boilerplate HTML and places it in common files.
 * Reintroduces the `last updated' text.
 * Puts useful information in the title
 * Eliminates useless directories
 * Builds using sh, grep, sed, date, pwd, head, tr.

There are a lot of things I like about the proposed site, that's why
I'm bothering to try to fix the things I don't like.  I haven't tried to
fix the tables and font sizes because these are aesthetic design issues,
not technical issues.

This tarball doesn't contain everything I like from the proposed site; it
represents a merge of the more important bits into the current site.  Other
bits should be brought across, but I want to get some feedback on whether
this design works before i put more than a couple of hours work into it.

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04941
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 18:56:16 -0700
Received: from localhost (mang@localhost) by cuzea.pair.com (8.9.1/8.6.12) with ESMTP id TAA19988 for <parisc-linux@thepuffingroup.com>; Tue, 8 Feb 2000 19:51:04 -0500 (EST)
Date: Tue, 8 Feb 2000 19:51:04 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSF.4.10.10002081938400.11091-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] cvs tricks
List-ID: <linux-parisc.vger.kernel.org>

Updating
update to latest working version, get newly add dirs
  cvs up -Ad
get linus' 2.3.42 version of a file
  cvs up -rlinus2342 somefile
  (need to do "cvs up -A" to get back to latest version)

Diffs
between current version and linus2342
  cvs di -rlinus2342
our changes
  cvs di -r1.1 -rLINUS_2342_PREMERGE
linus' changes from 2.3.29 to 2.3.42
  cvs di -rlinus2329 -rlinus2342
changes we've made since checking in 2.3.42 sources to tip
  cvs di -rLINUS_2342_FIXUP_START -rHEAD

Merging
merge in linus' changes
  cvs up -jrlinus2329 -jlinus2342

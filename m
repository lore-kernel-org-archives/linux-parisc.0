Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D8524A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 15:18:09 -0700 (MST)
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] db2 build failed 
In-Reply-To: Message from Bdale Garbee <bdale@gag.com>
   of "Tue, 06 Feb 2001 15:34:35 MST." <20010206223437.0FAF635CF1@rover.gag.com>
References: <20010206223437.0FAF635CF1@rover.gag.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Feb 2001 15:20:21 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010215222021.09E5B38786@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Bdale Garbee writes...

> On the same J, building the Debian db-2.7.7 "db2" libraries fails after 
> building the "important" pieces with the following:
> 
> gcc -g3 -pg  -Ibuild_unix -Iinclude -fPIC -Wall -pipe -D_REENTRANT  -c -o btr
> eec
> cc1: warning: PIC code generation is not compatible with profiling
> 
> btree/bt_compare.c: In function `__bam_cmp':
> btree/bt_compare.c:137: Internal compiler error in output_90, at insn-output.
> c:4

Alan Modra just mentioned that profiling is broken. He is working on a fix.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation

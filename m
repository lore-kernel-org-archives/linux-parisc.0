Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin8.bigpond.com (mailin8.bigpond.com [139.134.6.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id F18BC482D
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 23:51:08 -0700 (MST)
Received: from bubble.local ([144.135.24.72]) by
          mailin8.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GMGZC200.8PQ for <parisc-linux@lists.parisc-linux.org>; Thu,
          8 Nov 2001 16:57:38 +1000
Date: Thu, 8 Nov 2001 17:20:26 +1030
From: Alan Modra <amodra@bigpond.net.au>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011108172026.I6922@bubble.sa.bigpond.net.au>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain> <20011107200110.C616@dogbert.localdomain> <3BE9799E.8C2C9C77@esiee.fr> <20011108080516.A1857@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011108080516.A1857@dogbert.localdomain>; from fullung@ilink.nis.za on Thu, Nov 08, 2001 at 08:05:16AM +0200
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

Randolph Chung is currently testing a new glibc that should cure most,
if not all, of your problems.  The problem was that the lazy linking
code in ld.so used r28 without saving it.  r28 is used by functions
to return values;  In the case of a function returning a struture, on
function entry r28 points to an area of memory to hold the structure.
So trashing r28 meant that functions returning structures scribbled them
into the wrong part of memory.  In fact, they overwrote the procedure
linkage table.

Alan

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0361C482C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Nov 2001 07:20:38 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161q2l-0006L0-00
	for parisc-linux@lists.parisc-linux.org; Thu, 08 Nov 2001 16:20:35 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 161q2X-0000fF-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 08 Nov 2001 16:20:21 +0200
Date: Thu, 8 Nov 2001 16:20:21 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011108162021.C2541@dogbert.localdomain>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain> <20011107200110.C616@dogbert.localdomain> <3BE9799E.8C2C9C77@esiee.fr> <20011108080516.A1857@dogbert.localdomain> <20011108172026.I6922@bubble.sa.bigpond.net.au> <20011108001410.B2835@tausq.org> <20011108161126.A2541@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011108161126.A2541@dogbert.localdomain>
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

Hello,

On Thu, 08 Nov 2001, Albert Strasheim wrote:

<snip>

> 2. Using original apt, with new libs, apt-cache search, apt-get remove,
>    and apt-get install all seem to work. apt-get update from http sites
>    seems to work. apt-get update with deb-src lines in the sources.list
>    produces an Illegal instruction error right after wgetting the
>    relevant file. /var/log/syslog contains the following:

<snip>

FYI, Tried deb-src update both with http and ftp now. Doesn't make a
difference; still see the same Illegal instruction.

> That's about. :-)

That's about it. :-)

Regards,

Albert

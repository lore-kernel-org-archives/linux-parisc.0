Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0B224840
	for <parisc-linux@parisc-linux.org>; Mon, 14 Jul 2003 13:47:20 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h6EJlFI15031;
	Mon, 14 Jul 2003 15:47:15 -0400
Subject: RE: [parisc-linux] [PATCH] fix arbitrary limits on stack size
From: James Bottomley <James.Bottomley@steeleye.com>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3F0BEA8300001164@ocpmta1.freegates.net>
References: <3F0BEA8300001164@ocpmta1.freegates.net>
Content-Type: text/plain
Date: 14 Jul 2003 14:47:14 -0500
Message-Id: <1058212036.2966.13.camel@mulgrave>
Mime-Version: 1.0
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

On Mon, 2003-07-14 at 05:48, Joel Soete wrote:
> I don' t remember the historical reason of this choice but do you think it
> is possible to back-port it into 2.4 (it will facilitate so much the merge
> with upstream?)

Well, I suppose, theoretically.

However, before we consider backporting, what I really need is for
people to test it.  Downward growing mappings may cause application
issues:  If you map to an unspecified address, you may be surprised to
discover that you can't expand the mapping upwards.  Of course, no
application should ever depend on being able to expand unspecified maps
in either direction, but you never know...

James

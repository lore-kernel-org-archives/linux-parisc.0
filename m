Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D93F14829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 08:18:05 -0700 (MST)
Date: Fri, 20 Dec 2002 07:20:34 -0800
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.21-pre2 : sysctl.h pb
Message-ID: <20021220152034.GC31792@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E0085D0000004FA@ocpmta5.freegates.net> <3E0085D000000500@ocpmta5.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E0085D000000500@ocpmta5.freegates.net>
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

> Merging 2.4.21-pre2 with parisc tree, I notice the following the following
> pb:

just bump the hppa numbers
>         KERN_HPPA_PWRSW=55,     /* int: hppa soft-power enable */
>         KERN_HPPA_UNALIGNED=56, /* int: hppa unaligned-trap enable */

make these 57, 58 or so

it seems a bit odd to me that the sysctl number space is not
partitioned, but... 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

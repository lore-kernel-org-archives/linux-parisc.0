Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1189B482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 15:59:17 -0600 (MDT)
Date: Mon, 12 May 2003 14:58:37 -0700
From: Randolph Chung <randolph@tausq.org>
To: Guy Martin <gmsoft@gentoo.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc and -march=2.0 flag bug
Message-ID: <20030512215837.GN4509@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200305122351.57449.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200305122351.57449.gmsoft@gentoo.org>
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

> I had some problems with gcc. When I set the CFLAGS/CXXFLAGS -march=2.0, most 
> of the applications builded are b0rked. This occured on many stations. Using 
> -march=1.1 works well.

How are they "b0rked"? Can you be a bit more precise?
 
> Is this a 'feature' of unimplemented 64bit userspace or is this a bug ?
> 
> In case of a bug, what do you need to debug it.

We compile pa20 32-bit kernels (e.g. for c3k) using 32-bit and
-march=2.0. seems to work. Do you have a test case for what you think
is broken? -march2.0 is really orthogonal to 64-bit userspace.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

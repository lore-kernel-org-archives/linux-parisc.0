Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA34848A1
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 04:49:02 -0600 (MDT)
Date: Thu, 25 Sep 2003 03:50:05 -0700
From: Randolph Chung <randolph@tausq.org>
To: santosh.abraham@hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-ID: <20030925105005.GX16872@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <000701c38351$3907ada0$e5624c0f@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000701c38351$3907ada0$e5624c0f@india.hp.com>
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

> Also, does'nt __flush_dcache_page () need to have a for loop for "i_mmap"
> similar to the one for "i_mmap_shared" ?
> 

no, this was discussed recently on this list.

see jejb's message:
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-August/020791.html

and the corresponding thread for more info.

i thought flush_dcache_page is for making kernel mapping visible to
user, if you are trying to make user data visible to the kernel, you
should not be relying on flush_dcache_page.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

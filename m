Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99D4B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 11:12:58 -0600 (MDT)
Date: Sun, 18 May 2003 10:16:45 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
Message-ID: <20030518171645.GH548@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.BSF.4.53.0305181226340.86062@e0-0.zab2.int.zabbadoz.net> <20030518161001.GG548@tausq.org> <Pine.BSF.4.53.0305181640470.86062@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0305181640470.86062@e0-0.zab2.int.zabbadoz.net>
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

> > once gcc-3.2 gets patched and glibc gets recompiled, you'll be ok.
> > otherwise, consider downgrading to libc6_2.3.1-16 and everything will be
> > ok.
> 
> what about the gcc-3.3 debs that are distributed ? If I rebuilt the
> packages from source with them would they be ok ?

yes, that should work too.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AA144847
	for <parisc-linux@parisc-linux.org>; Sun,  2 Feb 2003 01:23:06 -0700 (MST)
Date: Sun, 2 Feb 2003 00:18:36 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Compiler switches
Message-ID: <20030202081836.GX20940@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030202051940.GR20940@tausq.org> <200302020552.h125qajv025111@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302020552.h125qajv025111@hiauly1.hia.nrc.ca>
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

In reference to a message from John David Anglin, dated Feb 02:
> > http://buildd.debian.org/fetch.php?&pkg=synopsis&ver=0.4.1cvs20030125-1&arch=hppa&stamp=1044017572&file=log&as=raw
> 
> Yah, that's a stub table overflow.  Try the linker patch.

yup, this seems to work.

randolph

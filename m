Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D93C54840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:11:39 -0700 (MST)
Date: Sun, 23 Nov 2003 23:15:51 -0800
From: Randolph Chung <randolph@tausq.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hppa64-linux-ld segfault
Message-ID: <20031124071550.GZ975@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031124070724.GB26585@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031124070724.GB26585@colo.lackof.org>
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

> It likely I'm not be the only person running into this.
> And not sure why I'm suddenly seeing this problem though...

The 64-bit binutils in gcc-hppa64 is too old. This problem was fixed a
few months back but we don't yet have a newer packaged binutils. you can
either build one yourself from latest binutils cvs for the hppa64-linux
target, or wait for a new gcc-hppa64 to be packaged. (any volunteers?
;-)

i wanted to update the package to use a newer gcc (it's using 3.0.4
right now) but gcc-3.3 doesn't seem to produce working kernels for
hppa64-linux :( for now i guess we want to build gcc-3.0.4+latest
binutils

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39969482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 09:54:39 -0600 (MDT)
Date: Fri, 18 Oct 2002 08:57:52 -0700
From: Randolph Chung <tausq@debian.org>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: phi <phi@hpfrcu03.france.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux version 2.4.19-pa22 uname -a fault.
Message-ID: <20021018155752.GV5602@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3DA56CAE00003154@ocpmta8.be.tiscali.com> <3DB015AF.C26FA30B@hpfrcu03.france.hp.com> <3DB02B96.6050702@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DB02B96.6050702@esiee.fr>
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

> I saw that recently after dist-upgrading a debian unstable.
> There is a bugreport already filled at debian bts.
> Dunno if it's closed yet.

no it's not. debian's uname has some procinfo patch in it that's quite
broken imo. i'm going to submit a patch for this this weekend.

randolph

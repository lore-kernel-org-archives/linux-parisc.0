Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout05.sul.t-online.com (mailout05.sul.t-online.com [194.25.134.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A9B6482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 05:20:47 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: H_Aue@t-online.de (Hinrich Aue)
To: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: [parisc-linux] DSL on a 715/80 with rp-pppoe
Date: Sat, 29 Dec 2001 13:23:44 +0100
References: <20011228124334.96741.qmail@web21207.mail.yahoo.com> <20011229050103.54069482A@dsl2.external.hp.com>
In-Reply-To: <20011229050103.54069482A@dsl2.external.hp.com>
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Message-ID: <16KITV-0dMC0GC@fwd05.sul.t-online.com>
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

Am Samstag, 29. Dezember 2001 06:01 schrieben Sie:
> =?iso-8859-1?q?Hinrich=20Aue?= wrote:
> > I found out, that you (Grant Grundler) already had the
> > same? Problem. There already was a submitted Bug.
> > Has somebody tried to fix that?
>
> Either Richard Hirst or Thomas Bogendoerf already fixed that.
> 132 should be closed since last I tried, I was able to use pppd
> with the dialup modem. Sorry about that - I should have closed it.
>
> > I'll post the stackdump later today, from syslog.
>
> The "trap 15" is a kernel crash. That doesn't get logged
> to syslog (afaik). Are you sure it's the same symptom?
>
> grant

Yes, I found no logging in syslog. I'm not used to kernel stuff, (2. 
semester) but the stackdump looked familiar. And after all, it happens when I 
start pppd with async ppp. If I don't activate async ppp It don't crashes, 
but it don't work. That was a problem first when I tried to use DSL. After I 
activated async ppp the machine crashes at the start of pppd.
I also tried the latest CVS kernel Verison (pa27).
I would like to dig in that stuff, but I don't know where to start and have 
too little experience.

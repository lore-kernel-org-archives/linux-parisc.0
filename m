Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3BC7482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 00:50:54 -0700 (MST)
Date: Mon, 27 Jan 2003 23:46:07 -0800
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Cc: debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030128074607.GE20940@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030126044656.GB6057@dsl2.external.hp.com> <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca> <20030127072615.GF8487@tausq.org> <20030128073101.GD20940@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030128073101.GD20940@tausq.org>
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

In reference to a message from Randolph Chung, dated Jan 27:
> > well.... Grant and I did some more debugging on this.... here's what
> > we've tried so far:
> 
> ok, here's what's happening apparently.... (with many thanks to Grant 
> for a sharp eye :)

there's a temporary workaround in cvs now (2.4.20-pa23). For people
who have seen the crash with gcc-3.2, please give it a try and let us 
know how it goes.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

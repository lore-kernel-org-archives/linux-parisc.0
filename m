Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06BBA4829
	for <parisc-linux@parisc-linux.org>; Tue, 14 Jan 2003 11:06:05 -0700 (MST)
Date: Tue, 14 Jan 2003 10:02:05 -0800
From: Randolph Chung <tausq@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 status update 2003-01-14
Message-ID: <20030114180205.GJ12986@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030114155409.X26554@parcelfarce.linux.theplanet.co.uk> <20030114180200.GC32537@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030114180200.GC32537@dsl2.external.hp.com>
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

> >  - oprofile support (tausq)
> 
> done? Seems like it's working but has a bug.

well, not really. the stuff in cvs now will compile but not work. i have
local changes to make it work (modulo some bugs), but it requires some 
core changes. i'm working with the oprofile developers to get those 
changes incorporated first.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

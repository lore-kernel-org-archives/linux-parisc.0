Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30FFA482C
	for <parisc-linux@parisc-linux.org>; Fri, 18 Oct 2002 09:42:04 -0600 (MDT)
Date: Fri, 18 Oct 2002 08:45:11 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] asm/offset.h vs asm/offsets.h
Message-ID: <20021018154511.GU5602@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20021018134522.A5285@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021018134522.A5285@parcelfarce.linux.theplanet.co.uk>
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

> can no longer be a part of it.  I'm not sure this is an awful problem
> since it's regenerated more consistently than our old offset.h, but it's
> something to be aware of before we switch.

make dep also doesn't seem to be required in 2.5 unless you have
CONFIG_MODVERSIONS, so the error message doesn't fit too well

let's use the "standard" method! :-)

randolph

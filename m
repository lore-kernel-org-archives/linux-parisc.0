Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3A0C489C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 10:12:05 -0600 (MDT)
Date: Mon, 15 Jul 2002 09:15:26 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	rhirst@linuxcare.com, grundler@dsl2.external.hp.com,
	varenet@esiee.fr, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability
Message-ID: <20020715161526.GI8724@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <200207101707.g6AH7xMS010810@hiauly1.hia.nrc.ca> <200207101744.g6AHiKW0011045@hiauly1.hia.nrc.ca> <20020715150543.M27706@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020715150543.M27706@parcelfarce.linux.theplanet.co.uk>
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

> hrm.  i wonder what happens when we run off the top of the stack ...

we seem to handle this properly at least most of the time.

i have tried various recursive function call cases and at least simple
tests don't crash the system (we just get a segfault)

randolph

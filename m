Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EEC6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 11:33:03 -0700 (MST)
Date: Thu, 30 Jan 2003 10:12:09 -0800
From: Randolph Chung <tausq@debian.org>
To: Sir Ace <chandler@nateng.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] I found the cause of my kernel hangs
Message-ID: <20030130181209.GK11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <Pine.LNX.4.33.0301301022570.235-100000@jordan.eng.nateng.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0301301022570.235-100000@jordan.eng.nateng.com>
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

In reference to a message from Sir Ace, dated Jan 30:
> 
> The offending thing was:
> HIL MLC Support
> 
> I went through the options one by one, starting with just about everything
> turned off, and adding one thing at a time, until I replicated my hang.
> What info would you guys like, besides this?
> 
> The machine is a J200.

http://www.parisc-linux.org/faq/kernelbug-howto.html

randolph

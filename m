Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC918482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 10:29:52 -0700 (MST)
Date: Fri, 22 Nov 2002 09:33:19 -0800
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Squid-2.4.7 problem
Message-ID: <20021122173319.GG19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DAAAD4600004184@ocpmta1.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DAAAD4600004184@ocpmta1.be.tiscali.com>
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

> I try to install squid on a sarge install with a kernel 2.4.19-32. This squid
> failled with data_page_fault.

if this is reproducible, it is much better if you generate a core file
and look at that instead.

> As I would like to build an elementary FW there is no dev tools on this box.
> So I try to debug the problem on my unstable (just update this morning) box
> but here the problem is absolutly different: squid loop and a strace tells
> me:
> ...
> sched_yield()    =0
> sched_yield()    =0

i suspect this is quite normal, depending on what squid is doing.

strace by default also only looks at the parent task. if any children
are fork()ed they will not be traced unless you tell it to. 

randolph

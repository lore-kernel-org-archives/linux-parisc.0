Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA217482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 17:58:35 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id QAA05250
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 16:58:25 -0800
From: James Bottomley <James.Bottomley@steeleye.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
In-Reply-To: <20030211004917.33A12482E@dsl2.external.hp.com>
References: <20030211004917.33A12482E@dsl2.external.hp.com>
Content-Type: text/plain
Date: 10 Feb 2003 18:58:22 -0600
Message-Id: <1044925103.1774.331.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 jejb
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

On Mon, 2003-02-10 at 18:49, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.5
> Changes by:	jejb	03/02/10 17:49:17
> 
> Modified files:
> 	arch/parisc/kernel: init_task.c signal.c 
> 	include/asm-parisc: ptrace.h 
> 
> Log message:
> Update for new kernel signal/sigaction split to replace sig

I should add a warning here that doing this has eliminated the pa-risc
private PTRACE_SETSIGINFO and PTRACE_GETSIGINFO definitions in favour of
the newly minted global kernel ones in linux/ptrace.h

Unfortunately, the values have changed, so some user space tracing tools
that relied on these may have to change.

I think they were unused previously, so all may be well, but someone who
knows this area should check.

James

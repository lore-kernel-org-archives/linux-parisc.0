Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DCA3482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 09:40:08 -0600 (MDT)
Date: Mon, 12 May 2003 08:36:59 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
Message-ID: <20030512153659.GK4509@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030512132248.GU27494@lug-owl.de> <200305121458.h4CEwmom001051@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200305121458.h4CEwmom001051@hiauly1.hia.nrc.ca>
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

> No, you don't want to use the libgcc version as it is specific to
> user programs.  A kernel version is needed.  I think all that needs to
> be done is return the function pointer passed to it.  It should totally
> disappear if inlined.  Thus, __canonicalize_funcptr_for_compare could
> be defined in a header.

how does that work? __c_f_f_c is emitted by the compiler internally,
right? how can we define an inline version of this function?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

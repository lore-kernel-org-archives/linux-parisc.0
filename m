Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FFAB4840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 01:35:09 -0600 (MDT)
Date: Sun, 26 Oct 2003 00:39:52 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031026073952.GI24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030812060244.GE21328@tausq.org> <20031026073751.GH24406@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031026073751.GH24406@tausq.org>
Subject: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
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

> +			 * 16: ldw 16(%r21), %rp
> +			 * 20: bv %r0(%rp)

btw, this comment is wrong, it's actually
> +			 * 16: ldw 16(%r21), %r20
> +			 * 20: bv %r0(%r20)

trashing rp in a syscall is a bad idea ;-)

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

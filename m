Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C021F4909
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Oct 2003 10:04:36 -0600 (MDT)
Date: Sat, 25 Oct 2003 09:07:54 -0700
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: teaching the kernel to do division
Message-ID: <20031025160754.GD24406@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20031023072157.GX24406@tausq.org> <20031023233935.GZ24406@tausq.org> <3F9A5ACA.1010403@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F9A5ACA.1010403@tiscali.be>
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

> Is somebody knows where can I find the right solution?

think about how you would do binary long division by hand. the algorithm
is exactly the same.

the more interesting question is how can we implement a more efficient
one for hppa. $$divU in libgcc.a is almost what we want, except i only
see a 32-bit version.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

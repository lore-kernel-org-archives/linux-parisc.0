Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75254482E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 13:34:32 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BIuoj-00079U-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 15:34:01 -0400
Date: Wed, 28 Apr 2004 15:34:00 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040428193400.GI6936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] On the subject of POSIX timers.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


parisc-linux,

When an si_code is negative in the kernel, it imagines the signal was
generated *from* userspace, it's the convention that positive si_code is
kernel generated signals.

POSIX Timers generate SI_TIMER, evaluating to -2, when the generic
kernel code examines this value, it tries a shortcut. If si_code < 0
(see kernel/signal.c (copy_siginfo_to_user)) then it doesn't retouch
the structure. However, in the compat case we *always* have to retouch
the structure to make it 32-bit correct.

Does anyone know why the shortcut "si_code < 0" is valid? Any thoughts?

Cheers,
Carlos.

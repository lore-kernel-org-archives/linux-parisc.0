Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B75BC482E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 12:08:12 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BItTB-0006r3-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 14:07:41 -0400
Date: Wed, 28 Apr 2004 14:07:41 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040428180741.GH6936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] A job for a debian-developer?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


parisc-linux,

Do we know if any programs use K_INLINE_SYSCALL from our
linux/include/asm-parisc/unistd.h, or rather all the _syscall[n] macros?

It's rather wrong. Even if I were to correct the issue, I'm curious if
anything uses these definitions. 

There is reference to fdisk.

c.

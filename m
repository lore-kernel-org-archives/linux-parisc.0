Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id E00704832
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jan 2002 09:08:20 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id kwggkaaa for parisc-linux@parisc-linux.org; Fri, 11 Jan 2002 09:02:34 -0700
Date: Fri, 11 Jan 2002 07:25:04 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FWD: The problematic asm code
Message-ID: <20020111152452.GD365@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020110224338.GK3247@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020110224338.GK3247@tausq.org>
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

In reference to a message from Randolph Chung, dated Jan 10:
> Torsten, the Debian ghostscript maintainer, has been working on trying
> to figure out a weird floating-point related (?) problem with the
> ghostscript package on hppa.

As a followup... torsten managed to track this down to a simple test
case:


#include <stdio.h>
void	out(const char *str, double x)
{
	printf("%s: %f\n", str, x);
}
int	main(int argc, char **argv)
{
	void	(*f)(const char *, double) = out;
	f("Calling via function pointer", 3.1415926535);
	out("Calling directly", 3.1415926535);
	return 0;
}

This gives:
% ./realind
Calling via function pointer: 0.000000
Calling directly: 3.141593

The RTL and the disassembly shows that in the function pointer case gcc
tries to load the floating point argument into an integer register.

A bug has been filed against gcc upstream about this.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

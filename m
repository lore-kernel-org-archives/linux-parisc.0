Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 252EA482F
	for <parisc-linux@parisc-linux.org>; Sat,  2 Feb 2002 07:19:05 -0700 (MST)
Date: Sat, 2 Feb 2002 14:07:41 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Proposed change to arch/parisc/Makefile and generation of offset.h
Message-ID: <20020202140740.GD2884@sleepie.demon.co.uk>
References: <20020202063408.GA604@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020202063408.GA604@tausq.org>
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

On Fri, Feb 01, 2002 at 10:34:08PM -0800, Randolph Chung wrote:
> I'd like to check this change in to change how we clean up and
> regenerate include/asm-parisc/offset.h. This will let us ship a working
> offset.h in our kernel-headers package to be used by glibc builds, and
> will also allow things like gdb to build.
> 
> (basically, the problem right now is that offset.h is removed after a
> 'make clean')
> 
> With this change, 'make dep' will regenerate the offset.h and allow the
> kernel dependency mechanism to kick in. 'make mrproper' will remove the
> offset.h file, but 'make clean' will not.
> 
> comments?

Sounds like a reasonable compromise to me.  Only snag is that if you
build a 32 bit kernel, make clean, change config for a 64 bit kernel,
then make again, you will build a 64 bit kernel with the wrong offset.h.

Would be nice if 'make' could verify that the offset.h ifile was correct,
without changing it (and so triggering dependencies).  If it could do
that, it could regenerate it only if it was wrong.

Richard

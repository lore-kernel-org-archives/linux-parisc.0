Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 643F54838
	for <parisc-linux@parisc-linux.org>; Mon,  4 Feb 2002 10:07:27 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id rrwglaaa for parisc-linux@parisc-linux.org; Mon, 4 Feb 2002 10:07:14 -0700
Date: Mon, 4 Feb 2002 09:07:15 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] hppa-linux gcc-3.0.3: -O2 optimization does not handle fp args correctly
Message-ID: <20020204170715.GG624@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020204163842.GF624@tausq.org> <200202041704.g14H4RlP018142@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200202041704.g14H4RlP018142@hiauly1.hia.nrc.ca>
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

> The problem that needs fixing in the linker is passing floating
> arguments to indirect functions.  The above program doesn't involve
> an indirect call.

hrm... ok. any ideas when this was fixed? we can't ship 3.1 with the
upcoming debian release, so we'll need to backport the fix.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

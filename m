Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE09B482B
	for <parisc-linux@parisc-linux.org>; Wed, 24 Oct 2001 19:36:24 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id wapgiaaa for parisc-linux@parisc-linux.org; Wed, 24 Oct 2001 18:31:44 -0700
Date: Wed, 24 Oct 2001 18:36:12 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011024183612.Y537@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] RfC: hpux-like sysconf variables in glibc, cpu affinity
List-ID: <linux-parisc.vger.kernel.org>

While helping to port the hpux PI performance monitoring stuff to Linux, I
came across several sysconf calls that appear to be supported by hpux
but not under Linux. Would like to get your opinions on how best to
support these:

variable:		sample output
===================================================================
_SC_CPU_VERSION		CPU_PA_RISC2_0
_SC_CPU_CHIP_TYPE	bitfield describing cpu type and rev
_SC_PSET_SUPPORT	1/0, see more below

there's also a call to confstr(_CS_MACHINE_MODEL) which is also not
supported by glibc.

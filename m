Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0874D482A
	for <parisc-linux@parisc-linux.org>; Sat, 12 Jan 2002 09:36:38 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id lftgkaaa for parisc-linux@parisc-linux.org; Sat, 12 Jan 2002 09:36:42 -0700
Date: Sat, 12 Jan 2002 08:36:17 -0800
From: Randolph Chung <randolph@tausq.org>
To: Peter Lavender <plaven@bigpond.net.au>
Cc: parisc <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] bogomips?
Message-ID: <20020112163617.GB21816@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <005601c19b59$d9645370$090ba8c0@winnie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005601c19b59$d9645370$090ba8c0@winnie>
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

> What's a 715/64 equate to in terms of intel arches?
> 
> Here's my p90 with 48meg of ram:
> Calibrating delay loop... 35.84 BogoMIPS
> 
> and my 715/64 with 128 meg of ram:
> Calibrating delay loop... 63.69 BogoMIPS

bogomips is not a good measure of this..... try looking at the SPEC
website (www.spec.org) for the CPU95/SPECint95/SPECfp95 results.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

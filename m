Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail12.speakeasy.net [216.254.0.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id F232E482F
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 23:16:27 -0600 (MDT)
Received: from unknown (HELO pippin.tausq.org) ([64.81.244.94]) (envelope-sender <randolph@tausq.org>)
          by mail12.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@parisc-linux.org>; 13 Jul 2002 05:16:25 -0000
Date: Fri, 12 Jul 2002 22:20:16 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] compiling kernels with gcc-3.2
Message-ID: <20020713052016.GA10191@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020712073628.GB8838@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020712073628.GB8838@tausq.org>
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

well, after some advice from Dave about how to build gcc-3.2... i now
have a gcc-3.2 compiled kernel working as well:

tausq@a500:~$ uname -a
Linux version 2.4.18-pa54 (tausq@a500) (gcc version 3.2 20020711 (experimental)) #2 SMP Fri Jul 12 22:04:23 PDT 2002
tausq@a500:~$

I'm quite perplexed about why it doesn't seem to always work for
others... i didn't really have to do anything special with either gcc or
the kernel to get it to boot.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

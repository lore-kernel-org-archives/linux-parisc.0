Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83F1E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 08:52:53 -0600 (MDT)
Date: Wed, 4 Sep 2002 07:55:36 -0700
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	grundler@dsl2.external.hp.com, joel.soete@freebel.net,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Unaligne access [was: Back to evms-1.0.1 && unaligne access && gdb ]
Message-ID: <20020904145536.GA8310@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200209032044.g83KiS0d008279@hiauly1.hia.nrc.ca> <3D3815BD0000B3C0@ocpmta5.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3815BD0000B3C0@ocpmta5.be.tiscali.com>
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

> >Unlikely.  The unaligned trap handler in the kernel is probably
> >fixing the unaligned access.  You need to look in the kernel log
> >to see if this is happening.
> >
> Nothing to notice about unalign access kernel trap in any /var/log files
> (with checks.c.new) Is there some "debug" #define to set to increase verbosity
> of this trap?

no, it will log by default.. nothing to configure.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

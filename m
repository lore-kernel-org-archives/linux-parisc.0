Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail13.speakeasy.net [216.254.0.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5972A483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 23:52:41 -0600 (MDT)
Date: Mon, 10 Jun 2002 22:52:33 -0700
From: Randolph Chung <randolph@tausq.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org, varenet@esiee.fr,
	grundler@cup.hp.com
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Message-ID: <20020611055232.GD5876@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1023773807.7353.19.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1023773807.7353.19.camel@beavis>
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

> Is this the same behavior people are seeing on the SMP A500's?  

yes, this is what i have seen too.

> Can I see what locks are being held by the stuck process? etc..)  I will
> continue to poke around and see what I can find also.

Paul Bame has done some work on showing wait channels that might be
useful.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

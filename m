Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEC44482D
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 22:08:09 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id odgbkaaa for parisc-linux@parisc-linux.org; Sun, 30 Dec 2001 22:02:15 -0700
Date: Sun, 30 Dec 2001 21:07:41 -0800
From: Randolph Chung <randolph@tausq.org>
To: andi <andi@fischlustig.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problem with threads..
Message-ID: <20011231050740.GD2179@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011229012436.4586cb54.csuder@cisco.com> <20011230064447.GA2179@tausq.org> <20011229235830.4bfec5f9.csuder@cisco.com> <20011230184222.GC2179@tausq.org> <1009749327.28491.0.camel@cube>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1009749327.28491.0.camel@cube>
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

> does that mean using the PTHREAD_MUTEX_INITIALIZER as defined in
> phread.h (which DirectFB does) does not work on parisc, and we _have_ to
> call pthreas_mutex_init()? Why does PTHREAD_MUTEX_INITIALIZER exist
> then?

that works too.... 

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

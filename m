Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32DB7482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 11:42:53 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id wmdbkaaa for parisc-linux@parisc-linux.org; Sun, 30 Dec 2001 11:36:57 -0700
Date: Sun, 30 Dec 2001 10:42:22 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problem with threads..
Message-ID: <20011230184222.GC2179@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011229012436.4586cb54.csuder@cisco.com> <20011230064447.GA2179@tausq.org> <20011229235830.4bfec5f9.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011229235830.4bfec5f9.csuder@cisco.com>
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

> > fwiw, what i've seen elsewhere is that on palinux, you have to make sure
> > the mutex is initialized before locking works. on other platforms
> > sometimes you can get away with doing a lock without a mutex init.
> 
> Yes !!! There was one of 4 mutex not initialized, added that one and now
> it works.

Just to clarify...

hppa is the only platform supported by linuxthreads right now where we 
initialize the mutex variable to 1 so that we can do locking using ldcw. On 
other platforms, locks are initialized to 0 and locking is done using things 
like test-and-set.

In general, you always need to call pthread_mutex_init for mutexes to
work. In the case of pan, the mutex variable is declared static, so it
is automatically initialized to 0.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

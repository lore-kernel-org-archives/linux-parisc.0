Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD9001D42.dip.t-dialin.net [217.0.29.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8848482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 14:55:24 -0700 (MST)
Subject: Re: [parisc-linux] Problem with threads..
From: andi <andi@fischlustig.de>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20011230184222.GC2179@tausq.org>
References: <20011229012436.4586cb54.csuder@cisco.com>
	<20011230064447.GA2179@tausq.org>
	<20011229235830.4bfec5f9.csuder@cisco.com>
	<20011230184222.GC2179@tausq.org>
Date: 30 Dec 2001 22:55:26 +0100
Message-Id: <1009749327.28491.0.camel@cube>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

> Just to clarify...
> 
> hppa is the only platform supported by linuxthreads right now where we 
> initialize the mutex variable to 1 so that we can do locking using ldcw. On 
> other platforms, locks are initialized to 0 and locking is done using things 
> like test-and-set.
> 
> In general, you always need to call pthread_mutex_init for mutexes to
> work. In the case of pan, the mutex variable is declared static, so it
> is automatically initialized to 0.

does that mean using the PTHREAD_MUTEX_INITIALIZER as defined in
phread.h (which DirectFB does) does not work on parisc, and we _have_ to
call pthreas_mutex_init()? Why does PTHREAD_MUTEX_INITIALIZER exist
then?


#define PTHREAD_MUTEX_INITIALIZER \
  {0, 0, 0, PTHREAD_MUTEX_TIMED_NP, __LOCK_INITIALIZER}

andi

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A4CF482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 23:45:24 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id clzakaaa for parisc-linux@lists.parisc-linux.org; Sat, 29 Dec 2001 23:39:22 -0700
Date: Sat, 29 Dec 2001 22:44:47 -0800
From: Randolph Chung <randolph@tausq.org>
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with threads..
Message-ID: <20011230064447.GA2179@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011229012436.4586cb54.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011229012436.4586cb54.csuder@cisco.com>
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

> the pan newsreader does not want to work on parisc platforms (neither the ones from the debian archive nor a version compiled from scratch). Digging a little bit I found the application hangs at pthread_mutex_lock and similar calls. Tried with various kernel versions over the last couple of months, never worked. Known issue ?
> 

fwiw, what i've seen elsewhere is that on palinux, you have to make sure
the mutex is initialized before locking works. on other platforms
sometimes you can get away with doing a lock without a mutex init.

for another example see http://bugs.debian.org/124307

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6682482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 00:59:10 -0700 (MST)
Date: Sat, 29 Dec 2001 23:58:30 -0800
From: Christian Suder <csuder@cisco.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with threads..
Message-Id: <20011229235830.4bfec5f9.csuder@cisco.com>
In-Reply-To: <20011230064447.GA2179@tausq.org>
References: <20011229012436.4586cb54.csuder@cisco.com>
	<20011230064447.GA2179@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 29 Dec 2001 22:44:47 -0800
"Randolph Chung" <randolph@tausq.org> wrote:

> > the pan newsreader does not want to work on parisc platforms (neither
the ones from the debian archive nor a version compiled from scratch).
Digging a little bit I found the application hangs at pthread_mutex_lock
and similar calls. Tried with various kernel versions over the last couple
of months, never worked. Known issue ?> > 
> 
> fwiw, what i've seen elsewhere is that on palinux, you have to make sure
> the mutex is initialized before locking works. on other platforms
> sometimes you can get away with doing a lock without a mutex init.

Yes !!! There was one of 4 mutex not initialized, added that one and now
it works.

Many thanks,

	Christian 

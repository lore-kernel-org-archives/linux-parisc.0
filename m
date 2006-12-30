From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] timing bug in clone() ?
Date: Sat, 30 Dec 2006 09:07:12 +0800
Message-ID: <4595BBC0.2020602__25818.1181423881$1416624244$gmane$org@tausq.org>
References: <200612291721.53961.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <randolph@tausq.org>
In-Reply-To: <200612291721.53961.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> Help !
> 
> I'm trying to find the reason, why the program below segfaults on parisc.
> if you change the "#if 0" to "#if 1", then it works without segfaulting.
> 
> To me it seems we have some kind of race in the linux kernel, e.g.
> thread exits, wants to notify parent, but parent hasn't returned from clone() call... ?!?
> 
> Any ideas ?

We have some other problems that may be related to this. It might be a
race in how signals are delivered. We hit some problems with multiple
threads that seems somewhat similar.  See thread_test2.c in our
userspace cvs repo. It *might* be the same problem.

Sorry I don't have any ideas what the real problem is. I tried to debug
this a bit but reach any conclusions. It might be because our fork() is
quite slow because of all the cache flushing.

randolph

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zayda.com (celery.zayda.com [208.186.180.200])
	by dsl2.external.hp.com (Postfix) with ESMTP id A027D4831
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 16:06:24 -0700 (MST)
Received: from localhost (sonny@localhost)
	by zayda.com (8.11.6/8.11.6) with ESMTP id fBCN6JG19513
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 23:06:19 GMT
Date: Wed, 12 Dec 2001 23:06:19 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112122255130.18883-100000@zayda.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] tulip driver
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

What is the state of the tulip driver currently?  I have been running 
2.4.9-pa45 for a few weeks with a tulip pci card in a b132L.  I decided to 
upgrade the system and kernel.  The kernel I used is 2.4.16-pa16.  During 
the boot process, the kernel just locks up after reporting that it has 
freed some memory.  Further investigation revealed that loading the tulip 
module locks it up.  It spewed out some debugging info, but I did not grab 
it.  I have the kernel module autoloader set and tulip compiled as a 
module.
Any advice, or hint as to where to start looking would be appreciated.

On a releated note, I have a tulip based 4-port ethernet card 
(AHA6944B/TX) that I have been playing with.  Loading the tulip module 
with this thing installed also locks the machine up nicely.  I do have the 
debugging information the kernel spit, but I'm not quite sure what to do 
with it.  Again, any advice would be appreciated.

Thanks,
Sonny

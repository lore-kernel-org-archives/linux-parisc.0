Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1117C482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 00:49:15 -0600 (MDT)
Received: from unknown (HELO pippin.tausq.org) ([64.81.244.94]) (envelope-sender <randolph@tausq.org>)
          by mail14.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@lists.parisc-linux.org>; 24 Jul 2002 06:49:14 -0000
Date: Tue, 23 Jul 2002 23:53:44 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020724065344.GF17737@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020723065000.E4DE3482C@dsl2.external.hp.com> <20020723065807.GB17737@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020723065807.GB17737@tausq.org>
Subject: [parisc-linux] 2.5 kernel crash on a500 -- help needed
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

(this reference was copied from the cvs list w.r.t our 2.5 merge)

In reference to a message from Randolph Chung, dated Jul 22:
> > init/main.c
> > add parisc_init back into the init sequence.... this causes the machine to crash though, need to investigate if the call is in the right place

without parisc_init(), i'm getting this on a500... debugging
output should be pretty much self-explanatory...

POSIX conformance testing by UNIFIX
before init_idle
after init_idle
Starting rest_init
Starting kernel thread 0x0000000010479180, arg 0x0000000000000000, flags 69120
Return from kernel_thread; pid = 352186432
After kernel_thread
Calling cpu_idle
schedule: need_resched
prev->stat = 0
schedule: switch_tasks
context_switch: mm = 0x0000000014fdf078, oldmm = 0x00000000103ce968
doing switch_to; prev=0x0,0x0, next=0x104d0040,0x104d0070
-> (the prev/next numbers are reg->iaoq[0] and reg->kpc)
-> there's another printk() right after the switch_to() call, i don't
   see that...

At this point, the machine hpmcs. The hpmc output is not very helpful,
and probably wrong. it points the crash to printk (both iaoq and
gr2 point to printk, but different locations)

I'm not sure whether this is a bug inside our switch_to code (looks
correct...) or if the switched to task is crashing. It seems to me the
only thing in the runqueue at this point should be the init thread, 
right?  but i don't get the printk() output from init.....

any hints on how to debug this?

baffled....
randolph

p.s. for those of you wondering, we do have a linkable 2.5 kernel now
(at least in some configurations). it doesn't come near to booting yet,
but willy/helge/richard/grant and others are busy working on it :)
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

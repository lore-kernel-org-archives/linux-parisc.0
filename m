Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 595C6482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 10:55:40 -0600 (MDT)
Date: Thu, 7 Aug 2003 09:59:19 -0700
From: Randolph Chung <randolph@tausq.org>
To: geos@canada.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] adding a second nic to B1000
Message-ID: <20030807165919.GF4979@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030807091916.8745.h006.c009.wm@mail.canada.com.criticalpath.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030807091916.8745.h006.c009.wm@mail.canada.com.criticalpath.net>
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

Please reply to the list, not to me privately.

In reference to a message from geos@canada.com, dated Aug 07:
> I will try that later tonite 
> i cannot get the 3c95x.c to compile or when i do it
> tells me its compiled for the wrong kerel 

this looks like a generic module compiling problem, not hppa specific...
have you done this before succesfully? Are you building a module from
the same tree where you built the kernel you are running? I just tried
this against 2.4 cvs and it works fine.

> modconf does not show this nic in the list

is the module installed in /lib/modules/`uname -r` ?

> make config did not change anything 

what did you expect it to do?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

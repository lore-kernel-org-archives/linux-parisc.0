Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8378C482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 10:16:07 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18FHOg-0001aE-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 18:15:18 +0100
Date: Fri, 22 Nov 2002 18:14:45 +0100
Message-ID: <3DAAAD4600004184@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Squid-2.4.7 problem
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

Hi all,

I try to install squid on a sarge install with a kernel 2.4.19-32. This squid
failled with data_page_fault.

As I would like to build an elementary FW there is no dev tools on this box.
So I try to debug the problem on my unstable (just update this morning) box
but here the problem is absolutly different: squid loop and a strace tells
me:
...
sched_yield()    =0
sched_yield()    =0
sched_yield()    =0
nanosleep({0, 2000001}, NULL)   =0
sched_yield()    =0
sched_yield()    =0
...

What should (could) I do ... 
in the first case I do not want to reinstall dev tools;
in the second one I do not know how to revert last apt-get update?

Thansk in advance,
    Joel


********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be

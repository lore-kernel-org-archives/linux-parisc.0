Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF536482C
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 17:41:08 -0700 (MST)
Message-Id: <200112130036.RAA12216@puffin.external.hp.com>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] tulip driver 
In-Reply-To: Message from Sonny Cook <sonny@aspersion.org>
   of "Wed, 12 Dec 2001 23:06:19 GMT." <Pine.LNX.4.33.0112122255130.18883-100000@zayda.com>
Date: Wed, 12 Dec 2001 17:36:03 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Sonny Cook wrote:
> What is the state of the tulip driver currently?

Stable - I don't think tulip's your problem.

> The kernel I used is 2.4.16-pa16.  During 
> the boot process, the kernel just locks up after reporting that it has 
> freed some memory.

Helge enabled freeing bootmem and it was disabled again because of such
lock-ups. At least until all extra __init's get removed.
I think it's disabled since 2.4.16-pa18 or -pa19.
So tulip is just a victim here and not a culprit.

> Any advice, or hint as to where to start looking would be appreciated.

Pull newer kernel source or disable the #if 1 that was enabled in -pa14.
See parisc-linux-cvs archive for details.

grant

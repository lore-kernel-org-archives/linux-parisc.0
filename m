Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 041364841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Nov 2003 03:39:12 -0700 (MST)
Message-ID: <3FC9C8D0.6080302@tiscali.be>
Date: Sun, 30 Nov 2003 10:39:12 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] spinlock 2.4 re-organise a la 2.6 [was: [RFC]
 rewrite kernel spinlock code to work better with gcc]
References: <20031126070714.GN975@tausq.org> <3FC93D47.5020501@tiscali.be> <20031130033705.GA24965@colo.lackof.org>
In-Reply-To: <20031130033705.GA24965@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


Grant Grundler wrote:
> On Sun, Nov 30, 2003 at 12:43:51AM +0000, Joel Soete wrote:
> ...
> 
>>+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/atomic.h	2003-11-30 01:23:57.000000000 +0100
>>@@ -1,7 +1,6 @@
>> #ifndef _ASM_PARISC_ATOMIC_H_
>> #define _ASM_PARISC_ATOMIC_H_
>> 
>>-#include <linux/config.h>
>> #include <asm/system.h>
> 
> 
> Joel,
> This is wrong - atomic.h uses CONFIG_SMP and thus is
> required to include config.h.
> 
I trust you.
Just a small explanation: i was confused by the begining of asm/system.h 
which is:
---------><---------
#ifndef __PARISC_SYSTEM_H
#define __PARISC_SYSTEM_H

#include <linux/config.h>
#include <asm/psw.h>

[...]
---------><---------

so I trusted that asm/system.h firstly include  <linux/config.h>.
So there should be something wrong elsewhere but don't yet find.

Sorry for my bad understand,

	Joel

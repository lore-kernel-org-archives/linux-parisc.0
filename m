Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F78A48F2
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Aug 2003 01:04:43 -0600 (MDT)
Date: Thu, 28 Aug 2003 09:04:40 +0200
Message-ID: <3F4D798800000061@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Grant,

>AFAIK, a cacheline will get loaded as "shared clean"
>until someone writes to it - which is when the cacheline ping-pong
>starts.

Mhh would it not request some kind of ipc between cpu for cache management?

But to avoid usage of cache would it be possible to access global kernel's
variable with absolute addressing mode? Is it feasible?

...

btw scaning code related to SMP I find in smp.c a very draft of an 'ipi_init()'
but unfortunately 'Ignore for now. *May* need this "hook" to register IPI
handler'..., interesting isn't it :).
Is there any other platform inplementing such stuff (I try to scan 2.4 src
but not found anywhere else) or some reference on to implement it?


>PAT PDC (L-/N-class and A500) have hard coded numbers for CPUs.
>parisc-linux only uses logical CPU numbers to avoid sparsely populated
>arrays. parisc-linux can get the  "Physical CPU #" from PAT PDC.
>See code inside USE_PAT_CPUID in arch/parisc/kernel/processor.c.
>You might hack that code a bit so you can correlate logic to physical
>CPU numbers.

Ah see better now, it answers to another question.

Thanks,
    Joel




-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 

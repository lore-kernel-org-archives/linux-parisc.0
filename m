Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CEA34962
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 11:54:41 -0600 (MDT)
Date: Tue, 26 Aug 2003 19:54:38 +0200
Message-ID: <3F2A5B0400005FBB@ocpmta1.freegates.net>
In-Reply-To: <20030825164553.GB28778@dsl2.external.hp.com>
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

>> 
>The additional CPUs just reference (ie load) the shared data using
>the same address. AFAIK, a cacheline will get loaded as "shared clean"
>until someone writes to it - which is when the cacheline ping-pong
>starts.

Ok I will have to re-read and again and again (each world is very important
in this book all short-cut is fatal for a good understanding)

>> Can you tell me more: in a previous piminfo collected I got for CPU#3
(3
>> is the "address" of the second cpu)

>PAT PDC (L-/N-class and A500) have hard coded numbers for CPUs.
>parisc-linux only uses logical CPU numbers to avoid sparsely populated
>arrays. parisc-linux can get the  "Physical CPU #" from PAT PDC.
>See code inside USE_PAT_CPUID in arch/parisc/kernel/processor.c.
>You might hack that code a bit so you can correlate logic to physical
>CPU numbers.

(I would do so later), I mean i would like to find the 'psw' value in a piminfo
listing (whatever the form it is: oct, hex, bin) to learn more about cpu
status at the panic moment (sorry for confusion but English is not my mother
tongue and frequently i still have pb to make understand my thought:) )

Thanks again,
    Joel
 

-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 

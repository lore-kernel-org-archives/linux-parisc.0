Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EE124871
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Aug 2003 06:33:07 -0600 (MDT)
Date: Tue, 19 Aug 2003 14:33:04 +0200
Message-ID: <3F2E54A800001F32@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: [parisc-linux] itlb miss handler optimizations!
To: parisc-linux@lists.parisc-linux.org
Cc: "Matthew Wilcox" <willy@debian.org>
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

>On Thu, Aug 14, 2003 at 08:02:04AM +0200, Joel Soete wrote:
>> btw is it for that reason (interlock) that in your patch we can read:
>> [...]
>>         cmpb,=        %r0,t0,itlb_miss_...
>>         nop
>> [...]
>> I am alway asking why the 'nop'.
>
>To fill the delayed branch slot (a silly idea, but ...)

Would it be the same 'by setting the "nullify" bit' (ie cmpb,=,n ...)

Joel




-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 

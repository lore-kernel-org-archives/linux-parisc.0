Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BE9C4848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 10:15:30 -0600 (MDT)
Date: Thu, 14 Aug 2003 18:15:28 +0200
Message-ID: <3F2A5B0400003183@ocpmta1.freegates.net>
In-Reply-To: <20030814152348.GA17578@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
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
>> On Thu, Aug 14, 2003 at 03:56:42PM +0200, Joel Soete wrote:
>> In the 2 cases, if a fault occurs an interrupt (6, 15, 16,17 or 20) is
>> 'triggered'?
>>
>yes, but most people call them "traps" or "faults" to be more specific.
>Chapter 5 of the PA 2.0 arch book differentiates nicely.

Yes (that is from where came 6,15,.. reference).
Oh yes, my bad: I didn't notice that here interrupt is not the shortcut of
interruptions as I use to make the mishmash :(

Thanks,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id A626E482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Aug 2003 10:08:17 -0600 (MDT)
Date: Thu, 28 Aug 2003 18:08:14 +0200
Message-ID: <3F4D78B00000000A@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3F4D78B00000000A/mail.tiscali.be"
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

--========/3F4D78B00000000A/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

>
>no.
>IIRC instructions for purging the cache are broadcast to other CPUs.
>
That is the first thing I would like to check (as the first signal I notice
is a itlb miss fault and the piminfo of the 2d cpu seems to show a crash
on a branch instruction [cmpb iirc], I presume that during the init of the
second cpu this last tries to access a page which was just purged by the
first.  This is also why I would like to find the psw of this second cpu
in the mentionned pimfinfo :) )

>> But to avoid usage of cache would it be possible to access global kernel's
>> variable with absolute addressing mode? Is it feasible?
>
>Since the caches use virtual indices, it would make sense when using
>physically addresses to bypass the cache. But I don't know if that's
>really the case or not. I would expect that described in the PA2.0 Arch
>book.

I don't yet browse all the book but at a first glance ldda and stda are available
(respectively load and store doubleword absolute)...

>> btw scaning cod
>>  related to SMP I find in smp.c a very draft of
>> an 'ipi_init()' but unfortunately 'Ignore for now.  *May* need this
>> "hook" to register IPI handler'..., interesting isn't it :).
>
>I wrote that. ipi_init and comments can be deleted.
>I haven't see a need for ipi_init(). When I originally
>implemented the SMP support I thought it might be.
>
>The IPI handler is statically "hooked" (aka registered) in
>	arch/parisc/kernel/irq.c:cpu_irq_actions[]
>
>See ipi_interrupt() for IPI implementation.
>
Allright (clear)
>>
>> Is there any other platform inplementing such stuff (I try to scan 2.4
src
>> but not found anywhere else) or some reference on to implement it?
>
>it == ?
>IPI is implemented.

I continue so.

BTW here is a small 2.6 back port that may be you could co safely:
--- processor.c.orig	2003-08-28 18:04:57.000000000 +0200
+++ processor.c	2003-08-28 18:08:37.000000000 +0200
@@ -370,9 +370,9 @@
 };
 
 static struct parisc_driver cpu_driver = {
-	name:		"CPU",
-	id_table:	processor_tbl,
-	probe:		processor_probe
+	.name		= "CPU",
+	.id_table	= processor_tbl,
+	.probe		= pprocessor_probe
 };
 
 /**


Many thanks again for your attention,
    Joel



-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 



--========/3F4D78B00000000A/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="processor.diff"

LS0tIHByb2Nlc3Nvci5jLm9yaWcJMjAwMy0wOC0yOCAxODowNDo1Ny4wMDAwMDAwMDAgKzAyMDAK
KysrIHByb2Nlc3Nvci5jCTIwMDMtMDgtMjggMTg6MDg6MzcuMDAwMDAwMDAwICswMjAwCkBAIC0z
NzAsOSArMzcwLDkgQEAKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgcGFyaXNjX2RyaXZlciBjcHVfZHJp
dmVyID0gewotCW5hbWU6CQkiQ1BVIiwKLQlpZF90YWJsZToJcHJvY2Vzc29yX3RibCwKLQlwcm9i
ZToJCXByb2Nlc3Nvcl9wcm9iZQorCS5uYW1lCQk9ICJDUFUiLAorCS5pZF90YWJsZQk9IHByb2Nl
c3Nvcl90YmwsCisJLnByb2JlCQk9IHBwcm9jZXNzb3JfcHJvYmUKIH07CiAKIC8qKgo=

--========/3F4D78B00000000A/mail.tiscali.be--

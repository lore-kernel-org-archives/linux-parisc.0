Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BD8C4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 06:19:13 -0600 (MDT)
Date: Tue, 20 May 2003 14:19:02 +0200
Message-ID: <3EC7621000000876@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] RE: Dump module patche.
To: "Bruno Vidal" <bruno_vidal@hp.com>
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

>gcc version 3.0.4
>
>
>Joel Soete wrote:
>> Bruno,
>>
>>>>sorry, I don't remember this kind of error...did you try make mrproper
>>>
>> ???
>>
>>>>
>>>I think so as I prefer distclean?
>>>
>>>umm 2.4.20-pa32 is still available in ftp.p-l.org:/cvs so I will first
>grab
>>>it and apply patch. Then comeback to you :)
>>>
>>
>> It didn't help so I have to come back to you with severall questions:
>>
>> A. what is your compiler release gcc 3.0 3.2 3.3?
>>
>> B. I suspect also a different .config: may I ask your to compare with
mine?
>>
Hi Bruno,

Continuing my investigation, I reach now (with some known modif) to compile
the kernel with your patch and gcc-3.3 (as it seems that it became the
default in unstable) but to reach to compile dump_lbz2 (as static builtin)
i had to change following stuff into driver/dump/Makefile:

--- Makefile.orig	2003-05-20 14:50:46.000000000 +0200
+++ Makefile	2003-05-20 12:58:43.000000000 +0200
@@ -6,6 +6,7 @@
 # the dump directory.
 #

+O_TARGET        :=      dumpdrv.o
 export-objs	:=	dump_base.o

 list-multi	:=	dump.o
@@ -34,7 +35,8 @@
 	dump-objs		+= dump_parisc.o
 endif

+include $(TOPDIR)/Rules.make
+
 dump.o:	$(dump-objs)
 	$(LD) -r -o $@ $(dump-objs)

-include $(TOPDIR)/Rules.make

I do not realy understand make :(

Thanks for advise,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be

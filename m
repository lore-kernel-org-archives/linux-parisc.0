Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AC934833
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 May 2002 09:45:09 -0600 (MDT)
Message-Id: <200205051545.g45Fj6CZ026798@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
To: doko@cs.tu-berlin.de (Matthias Klose)
Date: Sun, 5 May 2002 11:45:06 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
In-Reply-To: <15573.10385.229145.132477@gargle.gargle.HOWL> from "Matthias Klose" at May 5, 2002 02:41:53 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> this is a diff of the test results for b and c. g++ is worse, the

I think all the new g++ fails are in new tests.  So, I don't think
g++ is actually worse.

> regressions for g77 and gcc are new test cases in the trunk. One new
> gcc regression:

Yes, gcc.c-torture/compile/20000504-1.c is a regression.  It's good
to see the g77 fails go away.

> Ada doesn't build:
> ../../xgcc -B../../ -c -g -O2 -g -O2 -W -Wall -gnatpg -I. -I/home/packages/gcc/try/gcc-3.1-3.1ds90/src/gcc/ada s-taprop.adb
> s-taprop.adb:48:12: warning: no entities of "Os_Primitives" are referenced
> make[4]: *** [s-taprop.o] Error 1
> make[4]: Leaving directory `/home/packages/gcc/try/gcc-3.1-3.1ds90/build/gcc/ada/rts'

The enclosed patch fixes the compilation error.  However, Florian hasn't
installed it.  I'll try and get an update on its status.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

>From fw@deneb.enyo.de Sun Apr 28 16:44:10 EDT 2002
Received: from nrcmrddc1.imsb.nrc.ca (nrcmrddc1.imsb.nrc.ca [132.246.56.35])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g3SKi9FN016414
	for <DAVE@HIAULY1.HIA.NRC.CA>; Sun, 28 Apr 2002 16:44:10 -0400 (EDT)
Received: by nrcmrddc1.imsb.nrc.ca with Internet Mail Service (5.5.2653.19)
	id <JHXDSBQQ>; Sun, 28 Apr 2002 16:44:05 -0400
Received: from mail.enyo.de (cygnus-ext.enyo.de [212.9.189.162]) by nrcmrdbh1.imsb.nrc.ca with SMTP (Microsoft Exchange Internet Mail Service Version 5.5.2653.13)
	id JT1Y1AT2; Sun, 28 Apr 2002 16:44:03 -0400
Received: from [212.9.189.171] (helo=deneb.enyo.de)
	by mail.enyo.de with esmtp (Exim 3.34 #2)
	id 171vWf-0001yK-00; Sun, 28 Apr 2002 22:44:05 +0200
Received: from fw by deneb.enyo.de with local (Exim 3.34 #4)
	id 171vWc-0005rb-00; Sun, 28 Apr 2002 22:44:02 +0200
Message-ID: <87adrnmu3x.fsf@deneb.enyo.de>
From: Florian Weimer <fw@deneb.enyo.de>
To: John David Anglin <dave@HIAULY1.HIA.NRC.CA>
Cc: dave.anglin@nrc.ca, gcc-gnats@gcc.gnu.org
Subject: Re: ada/6495: no entities of "Os_Primitives" are referenced
Date: Sun, 28 Apr 2002 16:44:02 -0400
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2653.19)
Content-Type: text/plain;
	charset="iso-8859-1"
Status: RO

"John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:

>> dave.anglin@nrc.ca writes:
>> 
>> > s-taprop.adb:48:12: warning: no entities of "Os_Primitives" are
referenced
>> 
>> Could you please look at the file s-taprop.adb in the gcc/ada/rts and
>> check which version it is?  After the copyright string, there should
>> be a comment like this one:
>> 
>> --  This is a POSIX-like version of this package
>
> Says
>
> --  This is a no tasking version of this package

Thanks.  Could you try the following patch, please?

--- 5ntaprop.adb.~1.3.~	Sun Mar 17 09:08:21 2002
+++ 5ntaprop.adb	Sun Apr 28 22:42:59 2002
@@ -45,9 +45,6 @@
 --  used for Ada_Task_Control_Block
 --           Task_ID
 
-with System.OS_Primitives;
---  used for Delay_Modes
-
 with System.Error_Reporting;
 --  used for Shutdown
 
@@ -55,7 +52,6 @@
 
    use System.Tasking;
    use System.Parameters;
-   use System.OS_Primitives;
 
    -----------------
    -- Stack_Guard --

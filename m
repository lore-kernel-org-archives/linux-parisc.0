Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F4B1482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 07:50:20 -0700 (MST)
Received: from nyepost.start.no (nyepost.start.no [195.159.1.214])
	by smtp1.powertech.no (Postfix) with ESMTP id 45E43883D
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 15:50:19 +0100 (CET)
Received: (from apache@localhost)
	by nyepost.start.no (8.11.6/8.11.2) id fBEEfnv28746
	for parisc-linux@parisc-linux.org; Fri, 14 Dec 2001 15:41:49 +0100
To: parisc <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] 0.9.3 on a B132L
Message-ID: <1008340909.3c1a0fadd700f@nyepost.start.no>
Date: Fri, 14 Dec 2001 15:41:49 +0100 (CET)
From: Andy Walker <squawker@start.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting "James P. Kinney III" <jkinney@localnetsolutions.com>:

> Andy,
>
> This is great news! I have a C160 with the A4071B_LZ graphics card in
> slot 3. I get nada once the "you may not see anything beyond this
> point
> message" is done :( . So _please_ send details on command line and
> config to the group. I would like to get the serial console off my
> desk
> and use this huge 4033A monitor.
>

Hi James,

I just borrowed a C110 with an A4071B in slot 3. Booting from the
CD with all default parameters seemed to work fine for me. This is
the only graphics device in the C110, so there's no room for confusion
there. Typing 'pa con' in the PDC gives:

    Console path:       GRAPHICS3

Don't know the exact model of the A4071B (LZ etc.) - the one in the
B132L has a kind of daughter board, the one in the C110 doesn't.
Both seem to work fine.

Another point - I was playng with a 725/100 as well today. The
internal disk is a FW-Diff connected to a Bluefish card. it
exhibits the nasty timeout/lockup/reset behaviour reported for
720's and 735's with the sym58c720 interface when the disk is
attached. My current plan is to boot on a SE disk and to try
an AHA-2744W in an EISA slot for the FW-Diff disk. Will this
work?

Regards,

-Andy



------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/


------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/

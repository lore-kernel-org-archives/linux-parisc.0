Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0ECE14829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 08:40:33 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 1916pL-0006uD-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 03 Apr 2003 17:40:31 +0200
Date: Thu, 3 Apr 2003 17:40:30 +0200
Message-ID: <3E8AE87E00000E4E@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] break 0,0: pid=304 command jade ??
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

Hi all,

I just buy A. S. Tanenbaum's book "Operating Systems: Design and Implementation"
and its MINIX should run on bochs.

I try so to compile the last bochs release onto a my unstable debian pariec
linux.
This failled at the build of docbook because 'jade' failed on following
trap:
Trace/breakpoint trap

# dmesg show me then:
break 0,0: pid=304 command='jade'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 4072b5a4 4071a687 00000005
r04-07  4072b4d4 faf0060c 00000000 40026e40
r08-11  40000238 0000000a 00000000 00000000
r12-15  000dbb28 000f7508 000f7508 000f75a8
r16-19  00000000 00000000 00014000 4072b4d4
r20-23  00000000 00000000 40000238 00000005
r24-27  40000658 0000001a 00000001 00100600
r28-31  00000005 0000005f faf00700 4071a687
sr0-3   00000300 00000300 00000000 00000300
sr4-7   00000300 00000300 00000300 00000300

IASQ: 00000300 00000300 IAOQ: 4000023b 4000023f
 IIR: 00000000    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 1e580000 CR31: 103d0000
 ORIG_R28: 00000000

Is somebody could help me to understand what happened with this trap?

Thanks in advance,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be

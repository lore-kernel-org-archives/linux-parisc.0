Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D51E484B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Oct 2003 11:21:03 -0600 (MDT)
Date: Wed, 1 Oct 2003 19:20:57 +0200
Message-ID: <3F5CB6FB0000B84C@ocpmta1.freegates.net>
In-Reply-To: <3F5CC41F0000B5FA@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
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

I also notice additional info:

a) in SL (gsp console) A grab severall message as:

Log Entry #   0 : 
SYSTEM NAME: ap8002
DATE: 10/01/2003 TIME: 16:32:35
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 1
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 33 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 01

0x7000102082016333 00000000 00B92200 type 14 = Problem Detail
0x5800182082016333 00006709 01102023 type 11 = Timestamp 10/01/2003 16:32:35
Type CR for next entry, Q CR to quit.

Which seems indicating an I/O pb (But I don't know how much there are relevant
because: 'implementation dependent')

b) at the end of the pim info I also notice:
[...]
------------  I/O Module Error Log Information  ------------

Summary of IO subsystem log entries
-----------------------------------
                        Phys Loc             Vendor  Device   Severity
Description             (hex)                 Id      Id      CORR UNC FE
 CW
-----------             -----                ------  ------   ----------------
System Bus Adapter SB  0x000000ffffffff82   0x103c  0x1050              X
System Bus Adapter SB  0x000000ffffffff82   0x103c  0x1050              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter -- System Bus Interface
------------------------------------------

Timestamp =    Wed Oct  1 16:32:31 GMT 2003    (20:03:10:01:16:32:31)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X                X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0xfffffffffed00000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000007ff0034

System Bus Adapter -- System Bus Interface
------------------------------------------

Timestamp =    Wed Oct  1 16:32:31 GMT 2003    (20:03:10:01:16:32:31)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X                X       

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0xfffffffffed40000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff01

Module Error Register   = 0x0000000007ff0034
[...]

And "IO Responder Address    = 0xfffffffffed40000" match the bootlog entry:
Found devices:
[...]
11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions
0x803, 0x0, 0xc

And "IO Responder Address    = 0xfffffffffed00000" 
2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions
0x803, 0x0, 0xc

Could it be the sources of the crash pb?

Thanks in advance,
    Joel



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 

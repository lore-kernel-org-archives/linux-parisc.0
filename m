From: Meelis Roos <mroos@linux.ee>
Subject: Re: A500 boot crash in 4.2.0-rc3-00246-g763e326
Date: Fri, 14 Aug 2015 09:35:56 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1508140922300.2428@math.ut.ee>
References: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee> <BLU437-SMTP22FDC655D41AF9BCB78508977D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP22FDC655D41AF9BCB78508977D0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Tried 4.2.0-rc3-00246-g763e326 on A500 but it crashes on boot. This is 
> > still present in todays 4.2.0-rc6+git. 4.1 was fine, I Will bisect but 
> > it takes time.
> 
> This is probably a hpmc.  Could you look at SL event log?  It should show address of
> the hpmc.  Then, look at kernel image with objdump and search for address.  This should
> show where crash occurred and it might give a clue as to the cause.

SL errors from last boot that failed are below - how can I decode it 
further, I find no addresses here? All these errors only happen on 
problematic boot, none of these happen on 4.1.0 boot.

Log Entry #   0 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:18
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 6 = disk   SOURCE ID: 0
PROBLEM DETAIL: 3 = functional failure

CALLER ACTIVITY: 6 = machine check   STATUS: 0
CALLER SUBACTIVITY: 20 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002386006200 00000000 00000000 type  0 = Data Field Unused
0x5800082386006200 00007307 0E052412 type 11 = Timestamp 08/14/2015 05:36:18


Log Entry #   1 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:18
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 9 = serial   SOURCE ID: 0
PROBLEM DETAIL: 3 = functional failure

CALLER ACTIVITY: 6 = machine check   STATUS: 0
CALLER SUBACTIVITY: 20 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002389006200 00000000 00000000 type  0 = Data Field Unused
0x5800082389006200 00007307 0E052412 type 11 = Timestamp 08/14/2015 05:36:18

Log Entry #   2 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:17
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 6
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382066343 00000000 00070200 type 14 = Problem Detail
0x5800082382066343 00007307 0E052411 type 11 = Timestamp 08/14/2015 05:36:17


Log Entry #   3 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:17
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 4
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382046343 00000000 00070200 type 14 = Problem Detail
0x5800082382046343 00007307 0E052411 type 11 = Timestamp 08/14/2015 05:36:17


Log Entry #   4 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:17
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 2
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382026343 00000000 00070200 type 14 = Problem Detail
0x5800082382026343 00007307 0E052411 type 11 = Timestamp 08/14/2015 05:36:17


Log Entry #   5 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:17
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O 
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 0
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382006343 00000000 00070200 type 14 = Problem Detail
0x5800082382006343 00007307 0E052411 type 11 = Timestamp 08/14/2015 05:36:17



Log Entry #   6 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:17
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 40 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002000FF6402 00000000 00000000 type  0 = Data Field Unused
0x5800082000FF6402 00007307 0E052411 type 11 = Timestamp 08/14/2015 05:36:17


Log Entry #   7 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:17
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 45 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002000FF6452 00000000 00000000 type  0 = Data Field Unused
0x5800082000FF6452 00007307 0E052411 type 11 = Timestamp 08/14/2015 05:36:17


Log Entry #   8 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:15
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 7 = memory
SOURCE DETAIL: 9 = unexpected   SOURCE ID: 0
PROBLEM DETAIL: 3 = unexpected

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 13 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002379006133 C1BFF0FF FED08040 type 14 = Problem Detail
0x5800082379006133 00007307 0E05240F type 11 = Timestamp 08/14/2015 05:36:15


Log Entry #   9 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:15
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 7 = memory
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 08 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002070006082 00000000 00B92400 type 14 = Problem Detail
0x5800082070006082 00007307 0E05240F type 11 = Timestamp 08/14/2015 05:36:15


Log Entry #  10 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:15
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 7 = memory
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 06 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x6000002070006062 00000000 00100010 type 12 = Device Status
0x5800082070006062 00007307 0E05240F type 11 = Timestamp 08/14/2015 05:36:15


Log Entry #  11 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:14
ALERT LEVEL: 7 = reserved

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 29 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000007000FF6292 00000000 00000000 type  0 = Data Field Unused
0x5800087000FF6292 00007307 0E05240E type 11 = Timestamp 08/14/2015 05:36:14


Log Entry #  12 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:14
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 1 = processor
SOURCE DETAIL: 1 = processor general   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 31 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x1800002011006312 CB810000 00000000 type  3 = Actual Data
0x5800082011006312 00007307 0E05240E type 11 = Timestamp 08/14/2015 05:36:14


Log Entry #  13 :
SYSTEM NAME: a500-m
DATE: 08/14/2015 TIME: 05:36:14
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 24 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002000FF6242 00000000 00000000 type  0 = Data Field Unused
0x5800082000FF6242 00007307 0E05240E type 11 = Timestamp 08/14/2015 05:36:14




-- 
Meelis Roos (mroos@linux.ee)

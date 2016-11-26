From: Meelis Roos <mroos@linux.ee>
Subject: parsic: strange boot crash on a500
Date: Sat, 26 Nov 2016 02:13:34 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I have succeeded in keepin my rp3410 and rp3440 up to date but I have 
trouble on A500 after 4.8.

Tried two kernels, something around 4.9-rc2 and 
4.9.0-rc5-00297-g20afa6e, they both crash on boot like that. Hardware 
seems fine, I can boot kernels up to 4.8 without problems.

After these messages it just sits there, no progress is made.

PDT is empty.

All fields see to be 0 for the alert, except timestamp ands alert level 
(=7).

Is there anything in PIM that might be of interest?


Bisecting slowly is possible.

HARD Booted.
palo ipl 1.95 portage@a500 Thu Jul  7 15:40:10 EEST 2016

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     224   83 ext2
3             225   31696   83 ext2
4           31697   34732   83 ext2

PALO(F0) partition contains:

Command line for kernel: 'root=/dev/sda3 console=ttyS0 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2

************* SYSTEM ALERT **************
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         OFF       ON         ON
LED State: Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 00000000 00000000 - type  0 = Data Field Unused
0x5800087000FF6292 0000740A 19151E19 - type 11 = Timestamp 11/25/2016 21:30:25
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:Timeout!
*****************************************

Interesting entries from SL GSP command from these seconds:




Log Entry # 300 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 6
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382066343 00000000 00070200 type 14 = Problem Detail
0x5800082382066343 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.


Log Entry # 301 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 4
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382046343 00000000 00070200 type 14 = Problem Detail
0x5800082382046343 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 302 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 2
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382026343 00000000 00070200 type 14 = Problem Detail
0x5800082382026343 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 303 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 8 = I/O
SOURCE DETAIL: 2 = system bus adapter   SOURCE ID: 0
PROBLEM DETAIL: 3 = function failure

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 34 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002382006343 00000000 00070200 type 14 = Problem Detail
0x5800082382006343 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 304 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 0 = No failure detected, forward progress

SOURCE: 8 = I/O
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 0
CALLER SUBACTIVITY: 30 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000000080006300 00000000 00000001 type  0 = Data Field Unused
0x5800080080006300 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 305 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 40 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002000FF6402 00000000 00000000 type  0 = Data Field Unused
0x5800082000FF6402 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 306 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 44 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002000FF6442 00000000 00000000 type  0 = Data Field Unused
0x5800082000FF6442 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.

Log Entry # 307 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 0 = No failure detected, forward progress

SOURCE: 8 = I/O
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: F
CALLER SUBACTIVITY: 31 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x000000008000631F 00000000 00000000 type  0 = Data Field Unused
0x580008008000631F 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 308 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 0 = No failure detected, forward progress

SOURCE: 8 = I/O
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 0
CALLER SUBACTIVITY: 31 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000000080006310 00000000 00000001 type  0 = Data Field Unused
0x5800080080006310 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 309 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 7 = memory
SOURCE DETAIL: 9 = unexpected   SOURCE ID: 0
PROBLEM DETAIL: 3 = unexpected

CALLER ACTIVITY: 6 = machine check   STATUS: 3
CALLER SUBACTIVITY: 13 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002379006133 C1BFF0FF FED08040 type 14 = Problem Detail
0x5800082379006133 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.


Log Entry # 310 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 7 = memory
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 08 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x7000002070006082 00000000 00392400 type 14 = Problem Detail
0x5800082070006082 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 311 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 7 = memory
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 06 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x6000002070006062 00000000 00000010 type 12 = Device Status
0x5800082070006062 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.


Log Entry # 312 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 1 = Information only, no action required

SOURCE: 6 = platform
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 2A = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0xA000001060FF62A2 00000000 0000050B type 20 = major change in system 
state
0x5800081060FF62A2 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 313 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 7 = reserved

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 29 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000007000FF6292 00000000 00000000 type  0 = Data Field Unused
0x5800087000FF6292 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.


Log Entry # 314 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 1 = processor
SOURCE DETAIL: 1 = processor general   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 31 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x1800002011006312 CB810000 00000000 type  3 = Actual Data
0x5800082011006312 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.



Log Entry # 315 :
SYSTEM NAME: a500-m
DATE: 11/25/2016 TIME: 21:30:25
ALERT LEVEL: 2 = Non-Urgent operator attention required

SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

CALLER ACTIVITY: 6 = machine check   STATUS: 2
CALLER SUBACTIVITY: 24 = implementation dependent
REPORTING ENTITY TYPE: 0 = system firmware   REPORTING ENTITY ID: 00

0x0000002000FF6242 00000000 00000000 type  0 = Data Field Unused
0x5800082000FF6242 0000740A 19151E19 type 11 = Timestamp 11/25/2016 
21:30:25
Type CR for next entry, - CR for previous entry, Q CR to quit.




-- 
Meelis Roos (mroos@linux.ee)

Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 207A64843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 00:32:09 -0700 (MST)
Date: Fri, 6 Feb 2004 08:31:47 +0100
Message-ID: <40218AE200000F67@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb 
To: bame@hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Randolph Chung <randolph@tausq.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Paul,
>>
>> I am just curious to know the amount of memory on the Paul's b2k?
>>
>
>Mem:    505596k total

I only have 256Mb.

That was also a difference with c3k but here it is the only difference between
our b2k systems. Unfortunately I don't have any spare part to increase my
ram :(

Just in case Randolph has the opportunity to check the piminfo:

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp = 
  Fri Feb  6 07:20:26 GMT 2004    (20:04:02:06:07:20:26)

HPMC Chassis Codes = 2cbf0  2500b  2cbf5  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  000000001043e000  00000000000600d0  fffffff0f0000018
04-07   0000000000438000  0000000000439000  00000000fffffff0  00000000f0002f68
08-11   0000000000000027  00000000f0072848  000000000fff0000  000000001052c538
12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f0400004
16-19   00000000f00008c4  00000000f000017c  00000000f0000174  0000000000000000
20-23   0000000000000000  00000000fee003f8  00000000fee003fd  0000000000000000
24-27   0000000000000000  0000000000065e38  0000000000065e38  0000000000065e34
28-31   0000000000100000  0000000f4c7a3298  00000000004dc100  0000000000000060

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  000000000000001f
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000f4e0c5fee  0000000000000000  00000000001000e0  00000000702b0b30
20-23   0000000014340041  000000000f83e598  0000000000000008  0000000080000000
24-27   0000000000438000  0000000000438000  000000005fd50d56  000000007fdfdf2f
28-31   00000000ffbeffbe  00000000bfeb37dc  00000000104dc000  00000000104e0000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000001000e4
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x003010bb
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00031800
System Responder Address     = 0xfffffffffed10200
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
04-07   00003d09ffffffff  00000078ffffffff  00000000001c9c38  ddffffffffffffff
08-11   ffffffffffffffff  bfffffffffffffff  ffffffffffffffff  ffffffffffffffff
12-15   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffbfefffffffef
16-19   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
20-23   ffffffffffffffff  fbfffffffffffdff  ffffffffffffffff  ffffff7fffffffff
24-27   ffffffffffffffff  ffffffffffffffbf  ffffffffffffffff  ffffffffffffffff
28-31   ffffffffffffffff  dfffffffffffffff  ffffffffffffffff  ffffffffffffffff


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041000000000
Available Memory             = 0x0000000010000000
CPU Diagnose Register 2      = 0x0301000000802204
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8080000000000000
SADD LOG                     = 0xf813ec001043e598
Read Short LOG               = 0xc18040fffee003fd
ERROR_STATUS                 = 0x0000000000000010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffffffffffff


HPMC PIM Analysis Information:

Timestamp = 
  Fri Feb  6 07:20:26 GMT 2004    (20:04:02:06:07:20:26)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data Miss Timeout occurred while CPU 0 was
requesting information.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
I/D Cache Parity Info        = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000


-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  fffffff0f009d000  000000f0f000b618  00000000000f4240
04-07   0000000c6d9b6071  0000000000000004  0ffffff0f0408aa8  0000000000000002
08-11   00fffff000408ab0  00000000f0072848  000000000fff0000  00000000104f04d0
12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f0400004
16-19   00000000f00008c4  00000000f000017c  00000000f0000174  fffffff0f007ee38
20-23   fffffff0f05f0068  0000000000000004  0000000000000009  fffffff0f003d428
24-27   0000000013cf8409  000000003d090000  0000000017d78400  fffffff0f0412000
28-31   0000000017d78400  0000000000000008  fffffff0f0408d68  fffffff0f007eff8

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000960000009600  0000000000000005
12-15   0000000000000000  0000000000000000  000000f0f0003800  0000000000000000
16-19   0000000c816e9083  00000000000000f0  000000f0f000b628  00000000020008b8
20-23   000000009a37c3c1  c000000002008d10  000000ff08098f08  8000000000000000
24-27   000000000042c000  000000000042c000  00000000fffffff7  00000000fffffff7
28-31   00000000fffffff7  00000000fffffff7  0000000010495880  000000001049a000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x00000000000000f0
IIA Offset                   = 0x000000f0f000b620
CPU State                    = 0x9e000001


Memory Error Log Information:

Timestamp = 
  Fri Feb  6 07:20:26 GMT 2004    (20:04:02:06:07:20:26)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp = 
  Fri Feb  6 07:20:26 GMT 2004    (20:04:02:06:07:20:26)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    ----------   0x4e0cc009   ------------------
   5    ----------   0x5e0cc009   ------------------
   6    ----------   0x6e0cc009   ------------------
   7    ----------   0x7e0cc009   ------------------

Thanks a lot for attention,
    Joel





-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr

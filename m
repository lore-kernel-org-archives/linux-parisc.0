Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id EE504482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Feb 2002 12:12:33 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 2 Feb 2002 20:06:55 +0100
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_JF6XHCS1PKLM6GA59IUG"
Message-Id: <200202022006.55581.deller@gmx.de>
Subject: [parisc-linux] PIM after c3k crash w/ VisEG PCI card
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

--------------Boundary-00=_JF6XHCS1PKLM6GA59IUG
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 8bit

Hi all,

the attached file shows the PIM of a 64bit kernel after my 
machine crashed while trying to initialize the STI with a 
VisEG PCI card in PCI slot 2. So it's the same problem
as with a 32bit kernel.

Hopefully/Maybe this log may be usefull for someone of 
you helping me to debug this problem ?

TIA,
Helge



--------------Boundary-00=_JF6XHCS1PKLM6GA59IUG
Content-Type: text/plain;
  charset="us-ascii";
  name="hpmc.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="hpmc.txt"

pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp = 
  Sat Feb  2 18:48:51 GMT 2002    (20:02:02:02:18:48:51)

HPMC Chassis Codes = 2cbf0  2500b  27821  2cbf4  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  ffffffffffffffff  00000000001072a0  00000000004c5240
04-07   000000007fb70da8  00000000fa100000  00000000fa380000  00000000003376c8
08-11   0000000010494740  00000000000000c1  0000000010494740  000000001040084c
12-15   0000000010494740  00000000fb000000  0000000010494740  00000000f0400004
16-19   0000000010494740  00000000f000017c  0000000010494740  000000000804000e
20-23   00000000f0000174  000000008fb70ef0  0000000010494740  00000000004c5240
24-27   000000007fb70da8  00000000fa380000  00000000000000f0  00000000103ebd20
28-31   0000000000496788  0000000000000038  0000000000494958  0000000000000000

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  00000000000000c0  000000000000003f
12-15   0000000000000000  0000000000000000  0000000000104000  ffffffffffffffff
16-19   0000001c8128124b  0000000000000000  000000007fb31878  0000000048c20008
20-23   00000000a627ffe8  c0000000e0380004  000000ff0000ff08  8000000000000000
24-27   0000000000380000  0000000000380000  00000000ffffffff  00000000ffffffff
28-31   00000000ffffffff  00000000ffffffff  000000008fb70000  0000000010480000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000007fb3187c
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fffa380004
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000000
04-07   00003d091037f038  000000788fb70000  00000000001c9c38  000000000800000f
08-11   00000000103ebd20  00000000ffffffff  00000000103ebd20  0000000010474e88
12-15   0000000010374cf8  0000000000000001  000000001016c2c8  000000000804000e
16-19   000000001037f038  0000000000000002  0000000000000002  000000001040084c
20-23   000000000804000e  00000000000000c1  0000000000000000  0000000000000000
24-27   834e0b5f0800000f  00000000103ebd20  00000000103ebd20  0000000000000000
28-31   0000000000000802  0000000000000000  0000000010158288  0000000000000002

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81045028000000
Available Memory             = 0x0000000080000000
CPU Diagnose Register 2      = 0x0203000000802004
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0xaf115ebd36f73fff
Read Short LOG               = 0xc1a0f0fffa380004
ERROR_STATUS                 = 0x0000000000500050
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000000100000442f
MEM_SYND_CORR                = 0x8c008c0000008c00
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffff0a060200


HPMC PIM Analysis Information:

Timestamp = 
  Sat Feb  2 18:48:51 GMT 2002    (20:02:02:02:18:48:51)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/6/2/0 (PCI slot 2).


Memory/IO Controller Error Analysis Information:

There were multiple correctable memory errors.  See 'Memory Error Log Info'.

<Press any key to continue (q to quit)> 

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
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000000000
CPU State                    = 0x00000000


<Press any key to continue (q to quit)> 

Memory Error Log Information:

Timestamp = 
  Sat Feb  2 18:48:51 GMT 2002    (20:02:02:02:18:48:51)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

 This log displays the contents of memory specific registers when the
 HPMC occurred.  If there are multiple memory errors, the order they are
 listed is not indicative of the order they occurred.

                                   Trans  Addr
   Memory Error Type(s)  OV  MID    ID    par  CP   DIMM       Runway Address
   --------------------  --  ---  -----  ----  --  -------  -------------------
1) Correctable Mem       1   0x0  0x10   na    na  01       0x       0000110bc0

                                                Syndrome
                                           ------------------
                                        1) 0x8c008c0000008c00
<Press any key to continue (q to quit)> 

I/O Module Error Log Information:

Timestamp = 
  Sat Feb  2 18:48:51 GMT 2002    (20:02:02:02:18:48:51)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x0000e000   0x6e0cc009   0x00000000fa38003c
   7    ----------   0x7e0cc009   ------------------
Service Menu: Enter command >  
--------------Boundary-00=_JF6XHCS1PKLM6GA59IUG--

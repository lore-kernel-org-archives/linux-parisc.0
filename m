Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8784D482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Jul 2002 13:30:16 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id EFE677BC5A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Jul 2002 12:30:12 -0700 (PDT)
Date: Mon, 22 Jul 2002 12:30:12 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0207221210530.2211-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] J5000 SMP problem
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

Here's the current crash info with console.  Hopefully I included all 
relevant info.  I'm running 2.4.18-pa55 SMP on a J5000 with 512M ram.  If 
you have any ideas of where I should look for further info, or need to 
know something else about the box, I'd be happy to provide.

Near the end of apt-get update (usually in the "Reading Package Lists" but
this time in end of download), the box crashes.  The console prints the
message "apt-get(268): unaligned access to 0x403ce08c at ip=0x4005e4f7".  
The LCD screen reads "FLT CBFF: SYS BD \ multiple HPMCs" "FLT CBF0: SYS BD
\ HPMC initiated" "FLT 5008: SYS BD \ Runway broad err" "FLT CBF4: SYS BD
\ bad OS HPMC cksm" "FLT CBFC: SYS BD \ OS HPMC br err" "FLT CBF0: SYS BD 
\ HPMC initiated" in an infinate loop.

After power-cycling the box, I interrupted the boot and did a "ser pim".  
Here's the output.  There is nothing in the log files.

PROCESSOR PIM INFORMATION
-----------------  Processor 0 HPMC Information ------------------
Timestamp = 
  Fri Jul  19 22:44:13 GMT 2002    (20:02:07:19:22:44:13)

HPMC Chassis Codes = 2cbf0  25008  2cbf4  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  fffffff0f009d000  fffffff0f000b618  00000000000186a0
04-07   00000019742b1ec9  0000000000000000  00000000003396f8  fffffffffed30000
08-11   fffffff0f0414800  fffffff0f009c850  0000000000000000  0100000000000000
12-15   fffffffffed30058  fffffffffed30000  0000000000000000  fffffffffed30080
16-19   0000000000000001  000000000000000c  0000000000029494  fffffff0f007ee38
20-23   0000000000000007  fffffffffed22238  0000000000000009  fffffff0f003d428
24-27   00000000017553c2  00000000061a8000  00000000029f6300  fffffff0f0412000
28-31   00000000029f6300  0000000000000008  0000000000339a08  fffffff0f007ee38

<Press any key to continue (q to quit)> 
Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   00000000000001ea  0000000000000000  00000000000000c0  000000000000003f
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ff000000
16-19   0000001975a483a5  000000003ffffff5  fffffff0f000b628  00000000020008b8
20-23   0000000014340000  00000000ce7399b0  000000ff0808e908  0000000088000000
24-27   0000000000354000  000000001d9bb000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  000000002d9d0000  00000000103f0000
Space Registers 0 - 7

00-03   00000000          000000f5          00000000          000000f5
04-07   000000f5          000000f5          000000f5          000000f5

<Press any key to continue (q to quit)> 

IIA Space                    = 0x000000003ffffff5
IIA Offset                   = 0xfffffff0f000b620
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa0000
System Requestor Address     = 0xfffffffffffa2000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000a00000001  3f3333334fd369dc  00000003c8700000  7857f4754fd369dc
08-11   00000004b36f8c92  ffffffff0000000a  10101fc000000000  103ffdb300000000
12-15   0000000010347810  1117469010148340  1034781010353640  11174000103e8000
16-19   2ffba00011174000  0000000000000002  000000001034b010  1034781010346810
20-23   1034701010347810  103478102ffba000  0000000000000001  0000000100000000
24-27   0000000100000000  0000000000000000  0000000000000000  00000000102f46b4
28-31   3031323334353637  38396162101485e8  6768696a6b6c6d6e  6f70717273747576

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81841008000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0201000000000004
CPU Status Register 0        = 0x3440c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4820000000000000
Read Short LOG               = 0xc13ff0f0f000b628
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x53c43f51e840d000
RUN_DATA_LOW                 = 0x53c33f4d481f06b8
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc13ff0f0f000b630
System Responder Path        = 0x00ffffffffffffff

HPMC PIM Analysis Information:
Timestamp = 
  Fri Jul  19 22:44:13 GMT 2002    (20:02:07:19:22:44:13)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

CPU 0 observed a Broadcast Error on the Runway Bus.
Memory/IO Controller Error Analysis Information:

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

-----------------  Processor 1 HPMC Information ------------------
Timestamp = 
  Fri Jul  19 22:44:13 GMT 2002    (20:02:07:19:22:44:13)

HPMC Chassis Codes = 2cbf0  

General Registers 0 - 31
00-03   0000000000000000  000000001034cf20  000000001010090c  0000000000000000
04-07   0000000000354000  00000000f0400008  00000000000000fa  00000000f0002f68
08-11   0000000000000000  0000000000000000  000000000004000e  0000000010393408
12-15   00000000000000f2  0000000000000001  0000000000000001  00000000000000f3
16-19   0000000002020202  0000000000000002  00000000f000016c  000000001117c000
20-23   0000000000000000  00000000103262a0  0000000010347804  0000000000000000
24-27   00000000103478e0  0000000000000032  0000000000000019  0000000010326010
28-31   0000000000000000  0000000000000010  000000001117c6c0  00000000103478e0

<Press any key to continue (q to quit)> 
Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000114  0000000000000000  00000000000000c0  000000000000001e
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ff000000
16-19   00000019366a2a9a  0000000000000000  0000000010100914  0000000086803fe5
20-23   0000000000000000  0000000000000000  000000000004ff0f  0000000000000000
24-27   0000000000354000  000000001f77c000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  000000001117c000  0000000011111111
Space Registers 0 - 7

00-03   00000000          0000008a          00000000          0000008a
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000010100918
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa2000
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000000
04-07   2ffba00000000001  000000011015fa10  1035305000000000  11174000103e8000
08-11   1035305000000002  ffffffff0000000a  10101fc000000000  103ffdb300000000
12-15   0000000010347810  1117469010148340  1034781010353640  11174000103e8000
16-19   2ffba00011174000  0000000000000002  000000001034b010  1034781010346810
20-23   1034701010347810  103478102ffba000  cccccccd51eb874f  0000000333333334
24-27   b38cf9b100000450  0000000600000000  0000000f102f46a8  2ffba005102f46b4
28-31   3031323334353637  38396162101485e8  6768696a6b6c6d6e  6f70717273747576

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81841000000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0201010000000004
CPU Status Register 0        = 0x3440c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4800000000000000
Read Short LOG               = 0xc1af00fffed30000
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x37470000ebffbb9d
RUN_DATA_LOW                 = 0x37470000ebffbb9d
RUN_CTRL                     = 0x0000005c00001658
RUN_ADDR                     = 0xc1bff0f0f0408f08
System Responder Path        = 0x00ffffffffffffff

HPMC PIM Analysis Information:
   No valid timestamp


Memory/IO Controller Error Analysis Information:

<Press any key to continue (q to quit)> 

-----------------  Processor 1 LPMC Information ------------------
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


-----------------  Processor 1 TOC Information -------------------
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
  Fri Jul  19 22:44:13 GMT 2002    (20:02:07:19:22:44:13)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged
I/O Module Error Log Information:
Timestamp = 
  Fri Jul  19 22:44:13 GMT 2002    (20:02:07:19:22:44:13)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc229   ------------------
   3    ----------   0x3f4fd808   ------------------
   4    0x00000000   0x40000008   0xffffffffffffffff
   5    ----------   0x50000008   ------------------
   6    0x00000000   0x60000008   0xffffffffffffffff
   7    ----------   0x70100008   ------------------
Main Menu: Enter command > 

--
	"During the race
	 We may eat your dust,
	 But when you graduate,
	 You'll work for us."
	-- Reed College cheer

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id D625A4832
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Jun 2002 15:58:13 -0600 (MDT)
Date: Mon, 3 Jun 2002 14:58:11 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <Pine.LNX.4.44.0206021214450.11012-100000@garibaldi.apptechsys.com>
Message-ID: <Pine.LNX.4.44.0206031455490.24659-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 2 Jun 2002, Jeremy Drake wrote:

> On Sun, 2 Jun 2002, Grant Grundler wrote:
> 
> > If it avoids the HPMC (but we still see other hangs), then it's
> > a clue we don't have caching working right for that CPU setup.

> OK.  No HPMC, but a new and interesting message.  The serial console 
> hangs, as always.
> 
> Fetched 2696kB in 26s (103kB/s)
> apt-get(263): unaligned access to 0x403ce08c at ip=0x4005e4f7
> Reading Package
> 
> But, the LCD screen has a new message for me: 
> 
> INI 3001: SYS BD
> PDH control init
> 
> If you think it would help, I could pay the box a visit today and get 
> whatever "ser pim" or "ser pim toc" I can...

Here it is...  BTW, maybe you could explain how to interpret these, so I 
don't have to send you all of this...

ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp = 
  Tue May  28 23:38:36 GMT 2002    (20:02:05:28:23:38:36)

HPMC Chassis Codes = 2cbf0  2500b  2cbf1  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  000000095bf6dde5  0000000000019bf0  00000000f4004000
04-07   0000000000001d58  0000000000002710  ffffffffffffffce  0000000000002000
08-11   0000000044657266  fffffffff4004000  000000000000000a  fffffff0f0000834
12-15   0000000000000000  ffffffffffffffff  0000000000000001  fffffff0f0400004
16-19   fffffff0f00008c4  fffffff0f000017c  fffffff0f0000174  00000000000019fc
20-23   00000000f4004014  00000000000001f4  0000000000019bf0  ffffffffffffffff
24-27   ffffffffffffffff  0000000000000000  000000fa00000000  fffffff0f0412000
28-31   0000000000035b60  ffffffffffffffff  0000000000001e90  0000000000002710

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000004  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000006
12-15   0000000000000000  0000000000000000  000000f0f0003800  0000000000000000
16-19   000000095d2ccf91  0000000000000000  0000000000019bf4  000000000e80103d
20-23   00000000a607ffd0  c000000001004014  000000ff0000ff08  8800000000000000
24-27   0000000055555555  0000000055555555  0000000000041020  00000000f0412000
28-31   0000000055555555  0000000055555555  00000000f04088d8  0000000000000020
Space Registers 0 - 7

00-03   00000000          c9af9dd0          00000000          00000000
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000019bf8
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff4004014
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000000
04-07   2ffa200000000001  000000011015fa8c  1036505000000000  00000001f0400004
08-11   1036505000000002  ffffffff0000000a  0000000100000000  1041fdd31035d020
12-15   ffffffff000000ff  103a4000101482f4  103a4000ffff99ef  1115070010110264
16-19   2ffa200011150000  0000000000000002  000000001035d010  1035981010358810
20-23   1035901010359810  103598102ffa2000  1115000000000000  0000000200000000
24-27   5555555555555555  5555555555555555  5555555555555555  5555555555555555
28-31   3031323334353637  383961621014859c  6768696a6b6c6d6e  6f70717273747576

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xc381141008000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x02010000ac802000
CPU Status Register 0        = 0x2040000000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0x0221fd0050210df0
Read Short LOG               = 0xc18080fff4004014
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x37dd3fa153c23ee1
RUN_DATA_LOW                 = 0xe840d00037de3f01
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc13ff0f0f003ce50
System Responder Path        = 0x00ffffff0a000f01


HPMC PIM Analysis Information:

Timestamp = 
  Tue May  28 23:38:36 GMT 2002    (20:02:05:28:23:38:36)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/0/15/1 (built-in PCI device).


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

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
00-03   0000000000000000  0000000040000000  000000004000dc93  00000000faf00800
04-07   0000000040000000  0000000000000008  0000000040026758  0000000000000000
08-11   0000000000000000  00000000faf00798  0000000000000000  0000000000000000
12-15   00000000faf00890  0000000040026612  00000000faf00300  0000000000000000
16-19   0000000040000000  0000000010408000  0000000000000000  0000000040000000
20-23   00000000faf0089f  00000000faf006a0  000000001031a8b0  00000000faf00798
24-27   0000000000000008  0000000011150408  000000000000000f  000000001015fbb4
28-31   0000000000028000  0000000011150380  0000000011150640  000000004000f923

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000002  0000000000000000  00000000000000c0  0000000000000010
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ff800000
16-19   000000110d4ad99d  0000000000000000  00000000101076c0  000000002f301221
20-23   0000000010340004  0000000054150408  000000000004000e  0000000000000000
24-27   0000000000366000  00000000003bb000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  0000000011150000  0000000010410000
Space Registers 0 - 7

00-03   00000001          00000001          00000000          00000001
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000101076c4
CPU State                    = 0x9e000001


<Press any key to continue (q to quit)> 

-----------------  Processor 1 HPMC Information ------------------

Timestamp = 
  Sun Jun  2 19:40:32 GMT 2002    (20:02:06:02:19:40:32)

HPMC Chassis Codes = 2cbf0  2510b  2cbf4  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  fffffff0f009d000  fffffff0f0068d78  0000000000000000
04-07   7f00000000000000  feffffffffffffff  000000000031b6f8  0000000000000008
08-11   fffffffffed30300  fffffffffed22200  0100000000000000  000000000002cb90
12-15   00000000000f4000  000000000000c800  fffffffffed40000  fffffffffed22210
16-19   4000000000000000  0000000000000002  00000000f000016c  fffffffffee003f9
20-23   fffffffffee003fb  0000000000000087  fffffffffee003f8  5871000000000000
24-27   7f00000000000000  fffffff0f0071eb8  fffffffffee003fa  fffffff0f0412000
28-31   0000000000000000  fffffffffee003fb  000000000031b7d8  fffffffffee00000

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   000000000000010c  0000000000000000  00000000000000c0  0000000000000039
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ff000000
16-19   000000124c7c7456  000000003ffffff0  fffffff0f0037354  000000000e80103a
20-23   00000000ae07fffb  c0000000802003fb  0000000008000108  0000000080000000
24-27   0000000000336000  000000001f7e3000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  00000000100dc000  0000000011111111
Space Registers 0 - 7

00-03   00000000          00000086          00000000          00000086
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x000000003ffffff0
IIA Offset                   = 0xfffffff0f0037358
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fffee003fb
System Requestor Address     = 0xfffffffffffa2000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000000
04-07   2ffe200000000001  000000011015fa58  1033505000000000  00000001f0400004
08-11   1033505000000002  ffffffff0000000a  000000010000003f  103dfdd300000040
12-15   00000000103caf14  103caf4010148768  00000000ffff9b5f  100d470000000000
16-19   2ffe2000100d4000  0000000000000002  000000001032d010  1032981010328810
20-23   1032901010329810  103298102ffe2000  cccccccd51eb874f  0000000333333334
24-27   b38cf9b100000450  5555555555555555  5555555555555555  5555555555555555
28-31   3031323334353637  3839616210148a10  6768696a6b6c6d6e  6f70717273747576

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041008000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0201010000000004
CPU Status Register 0        = 0x2440c24000000000
CPU Status Register 1        = 0x800a000000000000
SADD LOG                     = 0xc11ff0f0f0002b50
Read Short LOG               = 0xc18100fffee003fb
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xe840c002000014bc
RUN_DATA_LOW                 = 0x379c00680f9a20dc
RUN_CTRL                     = 0x0000005c00001658
RUN_ADDR                     = 0xc13ff0f0f0002b50
System Responder Path        = 0x00ffff0a000e0101


HPMC PIM Analysis Information:

Timestamp = 
  Sun Jun  2 19:40:32 GMT 2002    (20:02:06:02:19:40:32)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

An Instruction I/O Fetch and Data I/O Fetch Timeout occurred while CPU 1 was
requesting information from a device at the path 10/0/14/1/1 (built-in PCI device).


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

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
00-03   0000000000000000  000000001035eee0  00000000101009dc  0000000000000000
04-07   0000000000366000  00000000f0400008  00000000000000fa  00000000f0002f68
08-11   0000000000000000  0000000000000000  000000000004000e  00000000103a7464
12-15   00000000000000f2  0000000000000001  0000000000000001  00000000000000f3
16-19   0000000002020202  0000000000000002  00000000f000016c  0000000011158000
20-23   0000000000000000  00000000103382b0  00000000103597c4  0000000000000000
24-27   00000000103598a0  0000000000000032  0000000000000019  0000000010338010
28-31   0000000000000000  0000000000000010  00000000111586c0  00000000103598a0

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  00000000000000c0  000000000000001e
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ff800000
16-19   0000001107f8d7df  0000000000000000  00000000101009dc  0000000003c008b3
20-23   0000000000000000  0000000000000000  000000000004ff0f  0000000000000000
24-27   0000000000366000  0000000000366000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  0000000011158000  0000000011111111
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000101009e0
CPU State                    = 0x9e000001


<Press any key to continue (q to quit)> 

Memory Error Log Information:

Timestamp = 
  Sun Jun  2 19:40:32 GMT 2002    (20:02:06:02:19:40:32)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp = 
  Sun Jun  2 19:40:32 GMT 2002    (20:02:06:02:19:40:32)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x0002e000   0x0e0cc009   0x00000000000007fc
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    0x04000000   0x2e0cc009   0xffffffffffffffff
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
Main Menu: Enter command > 
Main Menu: Enter command > 
Main Menu: Enter command > 

> 
> 
> > > hth,
> > grant
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> 
> 

-- 
On ability:
	A dwarf is small, even if he stands on a mountain top;
	a colossus keeps his height, even if he stands in a well.
		-- Lucius Annaeus Seneca, 4BC - 65AD

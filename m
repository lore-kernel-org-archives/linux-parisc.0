Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32050482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 15:56:05 -0600 (MDT)
Date: Tue, 28 May 2002 14:56:03 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <Pine.LNX.4.44.0205281239110.11012-100000@garibaldi.apptechsys.com>
Message-ID: <Pine.LNX.4.44.0205281436230.11012-100000@garibaldi.apptechsys.com>
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

On Tue, 28 May 2002, Jeremy Drake wrote:

> On Tue, 28 May 2002, Jeremy Drake wrote:
> 
> > On Tue, 28 May 2002, Grant Grundler wrote:
> > 
> > > It remotely possible the latest commit I made will affect this problem.
> > > Can you retry with -pa28 (or -pa29)?
> > Sure.  No problem.  I've been trying to keep the kernel as up-to-date as 
> > possible...
> OK, I was doing an apt-get update, and the damn thing died at Reading 
> Package Lists... 0%.  I'll see what's up with it when I can, do you want 
> ser pim, ser pim toc, or just wait for a new kernel?  (this sort of thing 
> happens a lot on smp, but this box is surprisingly stable on UP)
> 
The LCD has a network, the HDD and an unfilled heart on the screen -- not 
changing.

The console says apt-get (668): unaligned access to 0x403ce08c it 
ip=0x4005e4f7

The TOC button had no effect.  Here's a ser pim from after I pulled the 
power and restarted it.  It doesn't look particularly helpful.

ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

   No valid timestamp

HPMC Chassis Codes = 2cbf0  

General Registers 0 - 31
00-03   0000000000000000  000000001035eee0  00000000101009dc  0000000000800327
04-07   000000000001efff  000000000006cd00  0000000010410000  00000000f0002f68
08-11   0000000000000000  0000000000000003  000000000004000e  00000000103a5178
12-15   0000000000000000  00000000ffffffff  0000000000000001  00000000f0400004
16-19   00000000f00008c4  00000000f000017c  00000000f0000174  0000000010408000
20-23   0000000000000000  00000000103382a0  00000000103597c4  0000000000000000
24-27   00000000103598a0  0000000000000032  0000000000000019  0000000010338010
28-31   0000000000000000  0000000000000010  0000000010408700  00000000103598a0

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000106  0000000000000000  00000000000000c0  000000000000001f
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ffffffff
16-19   00001d631d9a90dc  0000000000000000  00000000101009e0  000000004a740028
20-23   0000000000000000  0000000000000000  000000000004ff0f  0000000000000000
24-27   0000000000366000  000000001f571000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  0000000010408000  0000000010410000
Space Registers 0 - 7

00-03   00000000          00000083          00000000          00000083
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000101009e4
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
04-07   2ff8e00000000001  000000011015fa8c  1036505000000000  00000001f0400004
08-11   1036505000000002  ffffffff0000000a  0000000100000000  1041fdd31035d020
12-15   ffffffff000000ff  103a4000101482f4  103a4000ffff99ef  1115070010110264
16-19   2ff8e00011150000  0000000000000002  000000001035d010  1035981010358810
20-23   1035901010359810  103598102ff8e000  cccccccd51eb874f  0000000333333334
24-27   b38cf9b100000450  5555555555555555  5555555555555555  5555555555555555
28-31   3031323334353637  383961621014859c  6768696a6b6c6d6e  6f70717273747576

<Press any key to continue (q to quit)> 


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81841000000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0201000000000004
CPU Status Register 0        = 0x3440c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4820000000000000
Read Short LOG               = 0xc1a0f0f0f0400804
ERROR_STATUS                 = 0x0000000000100010
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

   No valid timestamp



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

   No valid timestamp

HPMC Chassis Codes = No chassis codes logged

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

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000000000
Check Type                   = 0x00000000
CPU State                    = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

Floating-Point Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000

<Press any key to continue (q to quit)> 

Check Summary                = 0x0000000000000000
Available Memory             = 0x0000000000000000
CPU Diagnose Register 2      = 0x0000000000000000
CPU Status Register 0        = 0x0000000000000000
CPU Status Register 1        = 0x0000000000000000
SADD LOG                     = 0x0000000000000000
Read Short LOG               = 0x0000000000000000
ERROR_STATUS                 = 0x0000000000000000
MEM_ADDR                     = 0x0000000000000000
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x0000000000000000
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x0000000000000000
RUN_DATA_LOW                 = 0x0000000000000000
RUN_CTRL                     = 0x0000000000000000
RUN_ADDR                     = 0x0000000000000000
System Responder Path        = 0x0000000000000000


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

   No valid timestamp

   No memory errors logged


I/O Module Error Log Information:

   No valid timestamp

   No I/O module errors logged

Main Menu: Enter command > 
Main Menu: Enter command > 
> 
> > 
> > > 
> > > grant
> > > 
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > > 
> > 
> > 
> 
> 

-- 
I called my parents the other night, but I forgot about the time difference.
They're still living in the fifties.
		-- Strange de Jim

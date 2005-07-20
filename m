From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Tue, 19 Jul 2005 23:31:13 -0400 (EDT)
Message-ID: <200507200331.j6K3VD3v001086@hiauly1.hia.nrc.ca>
References: <20050720010425.GC24060@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050720010425.GC24060@roadwarrior.mcmartin.ca> from "Kyle
	McMartin" at Jul 19, 2005 09:04:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> TOC dump, IIR, IOAQ/IASQ locations? Come on people... It's really hard
> to even begin to figure out what's wrong if no debugging information
> has been provided...

2.6.8.1-pa11 is quite stable (12 days up and numerous GCC builds).
As Joel has indicated, this can be pushed a bit further.  However,
2.6.10 and later are not stable.  Randolph and James resolved one
of the major bugs (fp register bug).  However, this wasn't sufficient
to stabilize 2.6.12 under load.  I spent considerable time trying
to isolate the change(s) that introduced the instability but this
is difficult and time consuming.

It might help to have a "stable" branch that is maintained longer
than is current practice.  At a minimum, the current tree needs to
be slushed until the main problems are resolved.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

PS: TOC on Linux gsyprf11.external.hp.com 2.6.11-pa4 #5 SMP Sat May 21 19:09:19 PDT 2005 parisc64 GNU/Linux

Proc 0 r2 -> return from call to __brelse in journal_put_journal_head
Proc 0 IIA Offset -> location in __brelse

Proc 1 IIA Offset -> to final loop in panic.

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  000000001055f4c0  000000001023b3f4  0000000008108a24
04-07  0000000010552cc0  0000000204228918  0000000010517a40  000000013a7a0868
08-11  0000000000000001  0000000204228918  00000000ff85fc00  0000000000001000
12-15  0000000000000001  0000000013566ee8  0000000000000000  0000000204228918
16-19  0000000000000001  0000000000080000  0000000010553cc0  0000000000000000
20-23  0000000010517a40  0000000008108a24  000000000800000f  0000000008108a24
24-27  0000000000000001  00000000ffee4400  0000000204228930  0000000010552cc0
28-31  000000013a7a0868  00000000f8688a80  00000000f8688b30  0000000000000040


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000010c02  0000000000000000  00000000000000c0  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000106000  fff0000000000000
16-19  0002b96338e536de  0000000000000000  00000000101b68dc  0000000008000240
20-23  0000000000000000  0000000000000000  00000000080c000e  e200000000000000
24-27  00000000004cc000  00000000a4152000  0000000000041020  0000000041198b80
28-31  5555555555555555  5555555555555555  00000000f8688000  000000001051c000

Space Registers 0 - 7
00-03  04300800          04300800          00000000          04300800
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x00000000101b68d4
CPU State                    = 0x9e000001



-----------------  Processor 1 HPMC Information - PDC Version: 42.09  ------

   * * * No valid timestamp * * *


	  No HPMC chassis codes logged

	  General Registers 0 - 31
	  00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000


	  Control Registers 0 - 31
	  00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

	  Space Registers 0 - 7
	  00-03  00000000          00000000          00000000          00000000
	  04-07  00000000          00000000          00000000          00000000


	  IIA Space (back entry)       = 0x0000000000000000
	  IIA Offset (back entry)      = 0x0000000000000000
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


	  Floating Point Registers 0 - 31
	  00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000


	  Check Summary                = 0x0000000000000000
	  Available Memory             = 0x0000000000000000
	  CPU Diagnose Register 2      = 0x0000000000000000
	  CPU Status Register 0        = 0x0000000000000000
	  CPU Status Register 1        = 0x0000000000000000
	  SADD LOG                     = 0x0000000000000000
	  Read Short LOG               = 0x0000000000000000



	  -----------------  Processor 1 LPMC Information ------------------

	  Check Type                   = 0x00000000
	  IC Parity Info               = 0x00000000
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
	  00-03  0000000000000000  00000000103c5ca0  000000001014c628  00000000fe38c620
	  04-07  0000000010552cc0  00000000046db5d4  00000000105cc360  00000000105ccfb0
	  08-11  0000000000000018  0000000010424050  0000000000000001  00000000bd893300
	  12-15  0000000000000000  00000000ff85fc00  0000000000000008  00000000fe38c288
	  16-19  00000000fe38c620  00000000ff85b400  0000000000000000  0000000000024089
	  20-23  0002b96357cd9ae6  000000000009eb10  000000000000ff00  fffffff0f0430ed8
	  24-27  0000000000000520  0000000000000000  00000000046db5d4  0000000010552cc0
	  28-31  0000000000000000  00000000fe38cc20  00000000fe38cc50  0203010200802004


	  Control Registers 0 - 31
	  00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
	  08-11  000000000000e486  0000000000000000  00000000000000c0  0000000000000038
	  12-15  0000000000000000  0000000000000000  0000000000106000  0000000000000000
	  16-19  0002b96357d799de  0000000000000000  000000001014c67c  00000000020008b3
	  20-23  00000000103403b8  00000000e338cba8  000000ff0804fd0f  8140000000000000
	  24-27  00000000004cc000  00000000d153a000  0000000000041020  000000f0f0165650
	  28-31  000000f0f0165650  5555555555555555  00000000fe38c000  0000000000008020

	  Space Registers 0 - 7
	  00-03  03921800          00000000          00000000          03921800
	  04-07  00000000          00000000          00000000          00000000

	  IIA Space (back entry)       = 0x0000000000000000
	  IIA Offset (back entry)      = 0x000000001014c680
	  CPU State                    = 0x9e000001


	  --------------  Memory Error Log Information  --------------

	  Bus 0 Log Information


	     No errors logged for this bus


	     ------------  I/O Module Error Log Information  ------------


		No I/O module errors logged


		Service Menu: Enter command >
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

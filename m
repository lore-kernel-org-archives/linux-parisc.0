From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Sun, 12 Mar 2006 14:26:16 +0100
Message-ID: <200603121426.16996.deller@gmx.de>
References: <20060307211213.3A261494013@palinux.hppa>
	<200603072227.38097.deller@gmx.de>
	<20060308073743.GA31959@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060308073743.GA31959@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 08 March 2006 08:37, Grant Grundler wrote:
> On Tue, Mar 07, 2006 at 10:27:37PM +0100, Helge Deller wrote:
> > Attached is the patch.
> > I still think we should try to get real ioremapping working.
> > I'm no Linux-Kernel-memory-expert, but my plan was to read about it and learn.
> > Currently, if I enable CONFIG_HPPA_IOREMAP the 64bit kernel crashes
> > in sba_iommu.c: sba_driver_callback() after the first ioremap().
> > Maybe others here want to try as well ?
> 
> Yes, I have. It crashed in exactly the same location.
> But I don't understand the VM magic needed to make this work either.

I did some more testing and analysis on this problem.
(I even for the first time did some reading on Linux kernel memory management to understand all that pgd, pmd, pte stuff :-))

Here is my current analysis.
Maybe someone with a better understanding might have some idea on what's going on ?

drivers/parisc/sba_iommu.c does the following on my machine:
        void __iomem *sba_addr;
        sba_addr = ioremap(0xfffffffffed00000, 4096);  /* 0xfffffffffed00000 is hpa of Astro BC Runway Port at 0xfffffffffed00000 [10] */
        func_class = * (volatile unsigned long long *) (sba_addr + 8);

Here is the important part of the bootlog:

Linux version 2.6.16-rc5-pa2 (root@p100) (gcc version 3.4.3) #21 Sun Mar 12 13:43:30 CET 2006
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Found devices:
1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 3ba6c0 (1 CPUs online)

hpa start = fffffffffed00000 size=4096    <<<<<< this is the Astro BC
IOREMAP: phys_addr=fffffffffed00000, offset = 0, size=4096
IOREMAP: addr = 0000000000008000         <<<<< the new vm area ( fffffffffed00000(phys) will be mapped to 0x8000(virt))
set_pte: virtual:8000 -> phys=fffffffffed00000, pte=fffffffffed00283  << here is the pte entry which ioremap() generates.

The pte value seems right, and the __pgprot flags which I used were: _PAGE_PRESENT | _PAGE_RW | _PAGE_NO_CACHE;

So, in my opinion, ioremap() does technically the right thing.
Nevertheless, when reading the quadword from (virt) 0x8000+8 it crashes ("A Data Miss Timeout"? - see HPMC log).

Below is the PIM HPMC output.
Looking at the log, it seems that the pte was (mostly?) right, since
the System Responder Address below is 0xfffffffffed10200.
Although I don't understand why it was 0xfffffffffed10200 and not 0xfffffffffed00008 ?

Any ideas ?

Helge

-----------------  Processor 0 HPMC Information ------------------
Timestamp =
  Sun Mar  12 13:12:54 GMT 2006    (20:06:03:12:13:12:54)

HPMC Chassis Codes = 2cbf0  2500b  2cbf4  2cbfc

General Registers 0 - 31
00-03   0000000000000000  0000000010604920  000000001027a738  000000008fc4a400
04-07   0000000010601920  0000000010576690  0000000000008000  00000000105766b8
08-11   0000000010673380  0000000000000000  000f41fa3d8dea40  00000000105673a8
12-15   000000003b9aca00  00000000ffffffff  0000000000000000  00000000f0400004
16-19   000000008fc4a400  00000000f000017c  00000000f0000174  0000000010567b50
20-23   0000000000000000  0000000000000001  000000000000093c  000000000067123c
24-27   ffffffffffffffff  0000000000000001  0000000010567b50  0000000010601920
28-31   0000000000000018  000000008fc24b30  000000008fc24890  0000000000000060

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  00000000000000c0  0000000000000024
12-15   0000000000000000  0000000000000000  0000000000103000  8000000000000000
16-19   00000009653d8c30  0000000000000000  000000001027a738  000000000cd010d3
20-23   000000000035fffb  0000000040008008  000000000804000f  8000000000000000
24-27   000000000055d000  000000000055d000  00000000ffffffff  00000000ffffffff
28-31   00000000ffffffff  00000000ffffffff  000000008fc24000  00000000105b4000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000001027a73c
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

'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041000000000
Available Memory             = 0x0000000080000000
CPU Diagnose Register 2      = 0x0301000000802004
CPU Status Register 0        = 0x2020c20000000000
CPU Status Register 1        = 0x8080000000000000
SADD LOG                     = 0x2b0a10000fc212c1
Read Short LOG               = 0xc18040fffee003fd
ERROR_STATUS                 = 0x0000000000000010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00002a1c
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffffffffffff

HPMC PIM Analysis Information:
Timestamp =
  Sun Mar  12 13:12:54 GMT 2006    (20:06:03:12:13:12:54)
'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data Miss Timeout occurred while CPU 0 was
requesting information.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

Memory Error Log Information:
Timestamp =
  Sun Mar  12 13:12:54 GMT 2006    (20:06:03:12:13:12:54)

'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged

I/O Module Error Log Information:
Timestamp =
  Sun Mar  12 13:12:54 GMT 2006    (20:06:03:12:13:12:54)

'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

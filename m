Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PIM after c3k crash w/ VisEG PCI card 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Sat, 02 Feb 2002 20:06:55 +0100." <200202022006.55581.deller@gmx.de>
References: <200202022006.55581.deller@gmx.de> 
Date: Sat, 02 Feb 2002 23:57:34 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020203065735.3DAD2482A@dsl2.external.hp.com>
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

Helge Deller wrote:
> Hi all,
> 
> the attached file shows the PIM of a 64bit kernel after my 
> machine crashed while trying to initialize the STI with a 
> VisEG PCI card in PCI slot 2. So it's the same problem
> as with a 32bit kernel.
> 
> Hopefully/Maybe this log may be usefull for someone of 
> you helping me to debug this problem ?

I can try.
notes/thoughts mixed in.
Much of the original text deleted.

> Timestamp = 
>   Sat Feb  2 18:48:51 GMT 2002    (20:02:02:02:18:48:51)

You should verify the timestamp actually matches the incident.
(This looks ok)

> HPMC Chassis Codes = 2cbf0  2500b  27821  2cbf4  2cbfc  

Normally these are useful - if you have the magic decoder 
for them. I don't know what the first digit "2" means.
The cbf0/500b/7821/cbf4/cbfc look familiar.

Here's what I *think* these mean based on some *really old* notes:
cbf0: HPMC
500b: Bus Timeout
7821: 782x == Mem Correctable Err, 1 == DIMM 1

	This seems to match the "clear" text that was printed later.
	Sounds like an orthogonal problem. Perhaps swap DIMM 1 with
	one of the other DIMMS?

cbf4: invalid OS HPMC checksum - page zero OS entry ptr was invalid
cbfc: couldn't call OS HPMC handler

	So fixing this would probably help get more info to console
	when it dies. Perhaps we try to setup the console before
	enabling the OS HPMC handler?

	But no console means no output unless EARLY_BOOTUP_DEBUG
	is defined in pdc_cons.c.


> General Registers 0 - 31
> 00-03   0000000000000000  ffffffffffffffff  00000000001072a0  00000000004c524
>   0

I'm going to guess GR02 is a realmode address (matching
virtual addr would be 101072a0).
Or perhaps a "double" HPMC occurred?

First one happened in STI code and then the OS HPMC handler
tripped again when it tried to output?


> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x000000007fb3187c

Is this were STI gets loaded?
Looks like an awefully high address.
Artifact of no OS HPMC handler?

I'd hope STI would work the same on all boxes.

> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0030103b
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x000000fffa380004

Address CPU was trying to read.

> System Requestor Address     = 0xfffffffffffa0000

HPA of CPU that timed out.

...
> '9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:
> 
> Check Summary                = 0xcb81045028000000
> Available Memory             = 0x0000000080000000
> CPU Diagnose Register 2      = 0x0203000000802004
> CPU Status Register 0        = 0x2420c20000000000
> CPU Status Register 1        = 0x8002000000000000
> SADD LOG                     = 0xaf115ebd36f73fff
> Read Short LOG               = 0xc1a0f0fffa380004
> ERROR_STATUS                 = 0x0000000000500050
> MEM_ADDR                     = 0x000001ff3fffffff
> MEM_SYND                     = 0x0000000000000000
> MEM_ADDR_CORR                = 0x000000100000442f
> MEM_SYND_CORR                = 0x8c008c0000008c00
> RUN_DATA_HIGH                = 0xc1bff0fffed08040
> RUN_DATA_LOW                 = 0xc1bff0fffed08040
> RUN_CTRL                     = 0x0000021c00001418
> RUN_ADDR                     = 0xc1bff0fffed08040
> System Responder Path        = 0x00ffffff0a060200

Much is actually interesting - but I think Read Short LOG
was the address of the most recent sub-cacheline read.
Not sure if this is only IO.

...
> A Data I/O Fetch Timeout occurred while CPU 0 was
> requesting information from a device at the path 10/6/2/0 (PCI slot 2).

Typical of two scenarios:
o device wasn't initialized/enabled
  (ie PCI CMD Bus Master and/or MMIO Enable bits not set)

o Some Bridge chip betwen CPU and PCI Device was already Fatal
  (eg DMA to invalid address with cause Astro/U2 to go fatal
   because of unresolved IO TLB fault)

> Memory/IO Controller Error Analysis Information:
> 
> There were multiple correctable memory errors.  See 'Memory Error Log Info'.

I'm wondering if this is related. Do these happen with out Viz-EG
enabled too?
You can "ser clearpim", boot, build a kernel or something, reboot
and check PIM info again.

> -----------------  Processor 0 LPMC Information ------------------

FWIW, typically LPMC is for correctable memory errors.
I believe the OS gets notified of these since it may chose
to evacuate the memory page that's getting those.

>  This log displays the contents of memory specific registers when the
>  HPMC occurred.  If there are multiple memory errors, the order they are
>  listed is not indicative of the order they occurred.
> 
>                                    Trans  Addr
>    Memory Error Type(s)  OV  MID    ID    par  CP   DIMM       Runway Address
>    --------------------  --  ---  -----  ----  --  -------  -----------------
>   --
> 1) Correctable Mem       1   0x0  0x10   na    na  01       0x       0000110b
>   c0

hmmm...is 00110bc0 a kernel address?
that's not far off from GR02.

> '9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:
> 
>  Rope     Word1        Word2            Word3
> ------ ------------ ------------
>    0    0x00000000   0x0e0cc009   0x00000000fed30048
>    1    0x00000000   0x1e0cc009   0x00000000fed32048
>    2    ----------   0x2e0cc009   ------------------
>    3    ----------   0x3e0cc009   ------------------
>    4    0x00000000   0x4e0cc009   0x00000000fed38048
>    5    ----------   0x5e0cc009   ------------------
>    6    0x0000e000   0x6e0cc009   0x00000000fa38003c
>    7    ----------   0x7e0cc009   ------------------

Rope 6 went fatal (0xe). Forgot  what word3 is - offending address?


hth,
grant

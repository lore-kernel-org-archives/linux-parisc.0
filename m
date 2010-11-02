From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Mon, 1 Nov 2010 23:32:24 -0600
Message-ID: <20101102053224.GB14166@lackof.org>
References: <20101031174018.GA26539@hiauly1.hia.nrc.ca> <20101031180214.GA7501@hiauly1.hia.nrc.ca> <20101031194623.GA8288@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101031194623.GA8288@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 31, 2010 at 03:46:26PM -0400, John David Anglin wrote:
> On Sun, 31 Oct 2010, John David Anglin wrote:
> 
> > On Sun, 31 Oct 2010, John David Anglin wrote:
> > 
> > > Attached hpmc dumps.  It appears that struct pci_hba_data *l is
> > > causes the hpmc.  Maybe defining some of the DEBUG_LBA* macros
> > > would provide more info.
> 
> Attached console output with debug macros enabled.  Also, attached
> new hpmc dump as this one seems different.

This is definitely a different problem.
This one is easy to explain.


> [    0.000000] Linux version 2.6.36+ (dave@mx3210) (gcc version 4.3.5 (GCC) ) #4 SMP Sun Oct 31 14:51:20 EDT 2010
...
> [    0.000000] Determining PDC firmware type: 64 bit PAT.
...
> [    0.256000] Found devices:
...
> [    0.324000] 13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
...
> [    4.800000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
...
> [    4.852000] mercury_cfg_read(0+ 0) -> 0xffffffff
> [    4.852000] mercury_cfg_read(800+ 0) -> 0x1290103c

http://pci-ids.ucw.cz/read/PC/103c
Auxiliary Diva Serial Port

...
> [    4.892000] mercury_cfg_read(800+ 4) -> 0x146
> [    4.892000] mercury_cfg_write(800+ 4) <- 0x144 (c)
> [    4.896000] mercury_cfg_read(800+10) -> 0x0
> [    4.896000] mercury_cfg_write(800+10) <- 0xffffffff (c)
> [    4.904000] mercury_cfg_read(800+10) -> 0x0
> [    4.904000] mercury_cfg_write(800+10) <- 0x0 (c)
> [    4.904000] mercury_cfg_write(800+ 4) <- 0x146 (c)

Size BAR 0 (offset 0x10)

...
> [    5.124000] mercury_cfg_read(900+ 0) -> 0x1048103c

Diva Serial [GSP] Multiport UART
> [    5.124000] mercury_cfg_read(900+ e) -> 0x80
> [    5.124000] mercury_cfg_read(900+ 6) -> 0x290
> [    5.128000] mercury_cfg_read(900+34) -> 0x48
> [    5.128000] mercury_cfg_read(900+48) -> 0x1
> [    5.136000] mercury_cfg_read(900+49) -> 0x0
> [    5.136000] mercury_cfg_read(900+ 8) -> 0x7000203
> [    5.144000] mercury_cfg_read(900+ 6) -> 0x290
> [    5.144000] mercury_cfg_read(900+34) -> 0x48
> [    5.152000] mercury_cfg_read(900+48) -> 0x1
> [    5.152000] mercury_cfg_read(900+49) -> 0x0
> [    5.152000] mercury_cfg_read(900+3d) -> 0x1
> [    5.160000] mercury_cfg_read(900+3c) -> 0x0
> [    5.160000] mercury_cfg_read(900+ 4) -> 0x142
> [    5.164000] mercury_cfg_write(900+ 4) <- 0x140 (c)

You just shot yourself in the foot. :)
IIRC we just disabled MMIO in order to size the BAR.
So any accesses to that register will cause an HPMC.

hth,
grant

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 2 Nov 2010 00:26:23 -0600
Message-ID: <20101102062623.GC14166@lackof.org>
References: <20101031174018.GA26539@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101031174018.GA26539@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 31, 2010 at 01:40:20PM -0400, John David Anglin wrote:
> After the main hard drive on my rp3440, I have tried to restore
> functionality on this machine.  Lenny installed without problems.
> Then, I tried upgrading to testing.  All packages installed more
> or less ok, but vmlinux-2.6.32-5-parisc64-smp didn't boot.  Tried
> building 2.6.36 myself with a config derived from that for
> 2.6.32-5-parisc64-smp, but it dies in exactly the same way.

I've tried to look at the HPMC dumps but really need docs
to decode them. :(

Dug around a bit to see if I could match any HPMC output with
the code in lba driver.

> Attached hpmc dumps.  It appears that struct pci_hba_data *l is
> causes the hpmc.  Maybe defining some of the DEBUG_LBA* macros
> would provide more info.

Probably...But it's risky.

> The hard drive that I'm trying to boot from is in a different slot
> from the one that I was using before.  However, vmlinux-2.6.26-2-parisc64-smp
> boots ok from the drive.
> 
> Thoughts?

Maybe try the your kernels on ioz?
Try the kernels from ion or ioz on your machine?

on:~# uname -a
Linux ion 2.6.37-rc1+ #20 SMP Mon Nov 1 13:50:38 PDT 2010 parisc64 GNU/Linux

ioz:~# uname -a
Linux ioz 2.6.34-rc6 #25 Tue May 11 02:29:56 GMT 2010 parisc64 GNU/Linux

Source on ioz:/usr/src/linux-2.6 should match the kernel.
jejb is generally using ion.

Maybe try either config file to build a kernel for your machine?

More notes below.


> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

> PROCESSOR PIM INFORMATION
> 
> Original Product Number:  A7136A
> Current Product Number:   A7136A
> 
> 
> -----------------  Processor 0 HPMC Information - PDC Version: 46.34  ------ 
> 
> Timestamp =   Sun Oct  31 05:46:54 GMT 2010    (20:10:10:31:05:46:54)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0xe800035c00e00000 0x0000000040329434
>        0x57000f7300e00000 0x8040004000000000
>        0xf600105e00e00000 0xfffffff0f0c00000
>        0x140003b200e00000 0x000000000000000b
>        0x5600100b00e00000 0x0000000000000194
>        0x5600106400e00000 0xfffffff0f0435110
> 
> 
> General Registers 0 - 31
> 00-03  0000000000000000  00000000406dea70  00000000401296d0  000000007f8a0000
> 04-07  000000001c5d3000  000000000800000f  0000000000000000  000000007bf79c18
> 08-11  0000000000000000  000000007f838b90  000000001c5d9200  000000001c7aa078
> 12-15  0000000000000000  0000000000020598  000000000001e118  000000000001d18a
> 16-19  00000000fb1562d0  000000000001a000  000000000001ac94  0000000000000002
> 20-23  0000000040653038  0000000000000000  ffffffffc0000000  0000000000100000
> 24-27  000000000000000a  0000000000348002  000000007f007c00  00000000406c4270
> 28-31  000000000002c000  000000007f838f20  000000007f838f50  00000000003c8002
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11  000000000000006a  0000000000000000  00000000000000c0  0000000000000001
> 12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
> 16-19  00000016e043e208  0000000000000000  0000000040329434  000000000f80109f
> 20-23  00000000a627fffb  000000004802c000  000000ff0804ff0e  4000000000000000
> 24-27  00000000005d7000  000000003f802000  eff1ffddadbe93c7  0000000040000b80
> 28-31  0000000040000b80  eff1ffddadbe93c7  000000007f838000  eff1ffddadbe93c7
> 
> Space Registers 0 - 7
> 00-03  0000000000013800  0000000000000000  0000000000000000  000000000001a800
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x0000000040329438

Is this a kernel address...can you tell me what it matches?
Can you please also look up GR1?

> Check Type                   = 0x20000000
> Cpu State                    = 0x9e000000
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x00000000
> Assists Check                = 0x0001a800
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x0000000000000000
> System Requestor Address     = 0x0000000000000000
> 
> Floating Point Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  0000000000000000  000000003f058340  000000003f058348  0000000000000000
> 08-11  000000000800000f  00000000406e5a70  ffffffffc0000000  00000000000001ff
> 12-15  00000000000000ff  000000007f058300  00000000406e6270  00000000406e6270
> 16-19  00000000406e8000  0000000040736000  00000000406e6270  00000000406e5270
> 20-23  000f000000000000  00000000406e5a70  0000000000000000  0000000000000000
> 24-27  0000000000000000  00000000406e6270  000000007f0583c8  00000000404aefdc
> 28-31  0000000000000003  0000000000034bc0  0000000000000003  00000000fa000000
> 
> PIM Revision                 = 0x0000000000000001                
> CPU ID                       = 0x0000000000000014
> CPU Revision                 = 0x0000000000000031
> Cpu Serial Number            = 0x46100b89e43f0503
> Check Summary                = 0x8040004000000000
> SAL Timestamp                = 0x000000004ccd02ce
> System Firmware Rev.         = 0x00000ba20000121a
> PDC Relocation Address       = 0xfffffff0f0c00000
> Available Memory             = 0x000000027fe00000
> CPU Diagnose Register 2      = 0x3112022000002008
> MIB_STAT                     = 0x0040000000200000
> MIB_LOG1                     = 0x0000000000555500
> MIB_LOG2                     = 0x0000800000000000
> MIB_ECC_DATA                 = 0x808800007fffbfd8
> ICache Info                  = 0x0000000000000000
> DCache Info                  = 0x0000000000000000
> Sharedcache Info1            = 0x0000000000000000
> Sharedcache Info2            = 0x0000000000000000
> MIB_RSLOG1                   = 0x0000080000000004
> MIB_RSLOG2                   = 0x0010010000000000
> MIB_RQLOG                    = 0x00002580001e1510
> MIB_REQLOGa                  = 0x8000040000000300
> MIB_REQLOGb                  = 0x01000aa400000000
> Reserved                     = 0x0000000000000000
> Cache Repair Detail          = 0x0000000000000000
> 
> PIM Detail Text:
> 
> -----------------  Processor 1 HPMC Information - PDC Version: 46.34  ------ 
> 
> Timestamp =   Sun Oct  31 01:32:30 GMT 2010    (20:10:10:31:01:32:30)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0xe800035c00e00000 0x00000000142e83a4
>        0x57000f7300e00000 0x8040004000000000
>        0x5600100b00e00000 0x0000000000000194
>        0x5600106400e00000 0xfffffff0f0436fc0
> 
> 
> General Registers 0 - 31
> 00-03  0000000000000000  0000000010202800  00000000102186a0  0000000000000000
> 04-07  0000000010202000  000000007f550150  0000000000000004  0000000000000000
> 08-11  000000007f0b07a8  000000007f550000  0000000000000010  0000000000000000
> 12-15  0000000000000004  0000000000000001  000000007f967130  ffffffff80000080
> 16-19  000000007f0b034a  00000000000003e8  0000000010202000  ffffffffffffffe0
> 20-23  00000000000000a3  0000000000000004  000000007f0b07a8  0000000000000001
> 24-27  0000000000000000  000000000000a300  000000007f550000  00000000142e5000
> 28-31  0000000000000010  000000007f0b08c0  000000007f0b0a10  000000001027c040
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11  000000000000005c  0000000000000000  00000000000000c0  000000000000002a
> 12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
> 16-19  000000398d1a0a60  0000000000000000  00000000142e83a4  000000004bfc0028
> 20-23  00000000a627fe00  0000000000a7c054  000000ff0804ff0f  0000000000000000
> 24-27  00000000005dd000  000000003fa16000  ffffffffffffffff  0000000040000b80
> 28-31  ffffffffffffffff  ffffffffffffffff  000000007f0b0000  ffffffffffffffff
> 
> Space Registers 0 - 7
> 00-03  0000000000017000  0000000000000000  0000000000000000  0000000000017000
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x00000000142e83a8
> Check Type                   = 0x20000000
> Cpu State                    = 0x9e000000
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x00000000
> Assists Check                = 0x00017000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x0000000000000000
> System Requestor Address     = 0x0000000000000000
> 
> Floating Point Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  00000000401f7b10  000000003f050340  0000000000000000  000000007c3f2540
> 08-11  000000004021e018  000000007ec05300  0000000000000000  0000000000000002
> 12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 24-27  0000000000000000  0000000000000000  000000007f037000  000000004053efe0
> 28-31  00000000406c7300  0000000042866a80  0000000000000000  00000000406e8300
> 
> PIM Revision                 = 0x0000000000000001                
> CPU ID                       = 0x0000000000000014
> CPU Revision                 = 0x0000000000000031
> Cpu Serial Number            = 0x46100b89e43f0503
> Check Summary                = 0x8040004000000000
> SAL Timestamp                = 0x000000004cccc72e
> System Firmware Rev.         = 0x00000ba20000121a
> PDC Relocation Address       = 0xfffffff0f0c00000
> Available Memory             = 0x000000027fe00000
> CPU Diagnose Register 2      = 0x3152020008082008
> MIB_STAT                     = 0x0040000000100000
> MIB_LOG1                     = 0x0000000000555500
> MIB_LOG2                     = 0x0000800000000000
> MIB_ECC_DATA                 = 0x808800007fffbfd8
> ICache Info                  = 0x0000000000000000
> DCache Info                  = 0x0000000000000000
> Sharedcache Info1            = 0x0000000000000000
> Sharedcache Info2            = 0x0000000000000080
> MIB_RSLOG1                   = 0x0000088000000004
> MIB_RSLOG2                   = 0x0011010000000000
> MIB_RQLOG                    = 0x046c80003ffeb930
> MIB_REQLOGa                  = 0x8000044000000200
> MIB_REQLOGb                  = 0x01000aa400000000
> Reserved                     = 0x0000000000000000
> Cache Repair Detail          = 0x0000000000000000
> 
> PIM Detail Text:
> 
> -----------------  Processor 2 HPMC Information - PDC Version: 46.34  ------ 
> 
> Timestamp =   Sun Oct  31 01:32:29 GMT 2010    (20:10:10:31:01:32:29)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0xe800035c00e00000 0x000000004031e41c
>        0x57000f7300e00000 0x8040004000000000
>        0xf600105e00e00000 0xfffffff0f0c00000
>        0x140003b200e00000 0x000000000000000b
>        0x5600100b00e00000 0x0000000000000194
>        0x5600106400e00000 0xfffffff0f0438e70
> 
> 
> General Registers 0 - 31
> 00-03  0000000000000000  00000000406e1300  0000000040128748  000000007f5fc000
> 04-07  000000001c54f000  000000000800000f  0000000000000001  0000000000000000
> 08-11  0000000000000000  000000007fa30ba0  000000001c554fe0  000000001837e0b8
> 12-15  0000000000000000  0000000000020630  000000000001e128  000000000001d18a
> 16-19  00000000fb4e52d0  000000000001a000  000000000001ac94  0000000000000002
> 20-23  00000000406586a8  0000000000000000  ffffffffc0000000  0000000000100000
> 24-27  000000000000000a  0000000000348002  000000007f085a00  00000000406c7300
> 28-31  000000000002c000  000000007fa30eb0  000000007fa30ee0  00000000003c8002
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11  000000000000006a  0000000000000000  00000000000000c0  0000000000000001
> 12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
> 16-19  0000003974c44900  0000000000000000  000000004031e41c  000000000f80109f
> 20-23  00000000a627fffb  000000004802c000  000000ff0804ff0e  8000000000000000
> 24-27  00000000005dd000  000000003fa4a000  fffffeffffffffff  0000000040000b80
> 28-31  fffffffffffeffff  ffffffffffffffff  000000007fa30000  ffffffffffffffff
> 
> Space Registers 0 - 7
> 00-03  0000000000012000  0000000000000000  0000000000000000  000000000001a800
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x000000004031e420
> Check Type                   = 0x20000000
> Cpu State                    = 0x9e000000
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x00000000
> Assists Check                = 0x0001a800
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x0000000000000000
> System Requestor Address     = 0x0000000000000000
> 
> Floating Point Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  00000000401f7b10  000000003f050340  0000000000000000  000000007c3f2540
> 08-11  000000004021e018  000000007ec05300  0000000000000000  0000000000000002
> 12-15  000000007f054010  000000007f0503e0  000000007f054000  00000000406c7300
> 16-19  0000000000000002  000000007f050400  000000007f054000  00000000406c7300
> 20-23  00000000406d7300  00000000406e7b00  000000000000012e  0000000000000000
> 24-27  0000000000000000  000000000095d6b8  000000007f037000  000000004053efe0
> 28-31  00000000406c7300  0000000042866a80  0000000000000000  00000000406e8300
> 
> PIM Revision                 = 0x0000000000000001                
> CPU ID                       = 0x0000000000000014
> CPU Revision                 = 0x0000000000000031
> Cpu Serial Number            = 0x44b44b04543f060a
> Check Summary                = 0x8040004000000000
> SAL Timestamp                = 0x000000004cccc72d
> System Firmware Rev.         = 0x00000ba20000121a
> PDC Relocation Address       = 0xfffffff0f0c00000
> Available Memory             = 0x000000027fe00000
> CPU Diagnose Register 2      = 0x31120200c1102008
> MIB_STAT                     = 0x0040000000200000
> MIB_LOG1                     = 0x0000000000500000
> MIB_LOG2                     = 0x0000800000000000
> MIB_ECC_DATA                 = 0xc55b2c1befd0fbdc
> ICache Info                  = 0x0000000000000000
> DCache Info                  = 0x0000000000000000
> Sharedcache Info1            = 0x0000000000000000
> Sharedcache Info2            = 0x0000000000000000
> MIB_RSLOG1                   = 0x0000006000000004
> MIB_RSLOG2                   = 0x0000c10000000000
> MIB_RQLOG                    = 0x00002580001e1510
> MIB_REQLOGa                  = 0x8000003000000200
> MIB_REQLOGb                  = 0x01000aa400000000
> Reserved                     = 0x0000000000000000
> Cache Repair Detail          = 0x0000000000000000
> 
> PIM Detail Text:
> 
> -----------------  Processor 3 HPMC Information - PDC Version: 46.34  ------ 
> 
> Timestamp =   Sun Oct  31 02:14:52 GMT 2010    (20:10:10:31:02:14:52)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0xe800035c00e00000 0x000000004031e41c
>        0x57000f7300e00000 0x8040004000000000
>        0xf600105e00e00000 0xfffffff0f0c00000
>        0x140003b200e00000 0x000000000000000b
>        0x5600100b00e00000 0x0000000000000194
>        0x5600106400e00000 0xfffffff0f043ad20
> 
> 
> General Registers 0 - 31
> 00-03  0000000000000000  00000000406e1300  0000000040128748  000000007f620000
> 04-07  000000001c46a000  000000000800000f  0000000000000001  0000000000000000
> 08-11  0000000000000000  000000007fa38ba0  000000001c46ffe0  000000001c5470b8
> 12-15  0000000000000000  0000000000020630  000000000001e128  000000000001d18a
> 16-19  00000000fb6da2d0  000000000001a000  000000000001ac94  0000000000000002
> 20-23  00000000406586a8  0000000000000000  ffffffffc0000000  0000000000100000
> 24-27  000000000000000a  0000000000348002  000000007f085a00  00000000406c7300
> 28-31  000000000002c000  000000007fa38eb0  000000007fa38ee0  00000000003c8002
> 
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11  000000000000006c  0000000000000000  00000000000000c0  0000000000000001
> 12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
> 16-19  000000157f727a8c  0000000000000000  000000004031e41c  000000000f80109f
> 20-23  00000000a627fffb  000000004802c000  000000ff0804ff0e  0000000000000000
> 24-27  00000000005dd000  000000003f906000  ffffffffffffffff  0000000040000b80
> 28-31  ffffffffffffffff  fffffff7ffffffff  000000007fa38000  ffffffffffffffff
> 
> IIA Space (back entry)       = 0x0000000000000000
> IIA Offset (back entry)      = 0x000000004031e420
> Check Type                   = 0x20000000
> Cpu State                    = 0x9e000000
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x00000000
> Assists Check                = 0x0001b000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x0000000000000000
> System Requestor Address     = 0x0000000000000000
> 
> Floating Point Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  00000000401f7b10  000000003f050340  0000000000000000  000000007c3ffe40
> 08-11  000000004021e018  000000007ec05300  0000000000000000  0000000000000002
> 12-15  000000007f054010  000000007f0503e0  000000007f054000  00000000406c7300
> 16-19  0000000000000002  000000007f050400  000000007f054000  00000000406c7300
> 20-23  00000000406d7300  00000000406e7b00  000000000000012e  0000000000000000
> 24-27  0000000000000000  000000000095d6b8  000000007f037000  000000004053efe0
> 28-31  00000000406c7300  0000000042866a80  0000000000000000  00000000406e8300
> 
> PIM Revision                 = 0x0000000000000001                
> CPU ID                       = 0x0000000000000014
> CPU Revision                 = 0x0000000000000031
> Cpu Serial Number            = 0x44b44b04543f060a
> Check Summary                = 0x8040004000000000
> SAL Timestamp                = 0x000000004cccd11c
> System Firmware Rev.         = 0x00000ba20000121a
> PDC Relocation Address       = 0xfffffff0f0c00000
> Available Memory             = 0x000000027fe00000
> CPU Diagnose Register 2      = 0x31520200c9182008
> MIB_STAT                     = 0x0040000000100000
> MIB_LOG1                     = 0x0000000000500000
> MIB_LOG2                     = 0x0000800000000000
> MIB_ECC_DATA                 = 0xc55b2c1befd0fbdc
> ICache Info                  = 0x0000000000000000
> DCache Info                  = 0x0000000000000000
> Sharedcache Info1            = 0x0000000000000000
> Sharedcache Info2            = 0x0000000000000000
> MIB_RSLOG1                   = 0x000000e000000004
> MIB_RSLOG2                   = 0x0001c10000000000
> MIB_RQLOG                    = 0x00002580001e1910
> MIB_REQLOGa                  = 0x8000007000000300
> MIB_REQLOGb                  = 0x01000aa400000000
> Reserved                     = 0x0000000000000000
> Cache Repair Detail          = 0x0000000000000000
> 
> PIM Detail Text:
> 
> --------------  Memory Error Log Information  --------------
> 
>    No errors logged for this bus
> 
> ------------  I/O Module Error Log Information  ------------
> 
> IO Subsystem Log Entries
> 
> Found 2 PCI Comp errors
> Found 1 PCI Bus error
> ------------------------------------------------
> Detail display of IO subsystem log entries
> ------------------------------------------
> 
>   PCI Component Error information
> 
> PCI Component Error 1
> --- Section Header ---
> GUID
>   data1	0xe429faf6
>   data2	0x3cb7
>   data3	0x11d4
>   datat4	0xbc a7 0 80 c7 3c 88 81 
> REVISION		0x0200
> ERROR_RECOVERY_INFO		0x80
> SECTION_LENGTH		0x00000188
> VALIDATION_BITS		0x0000000000000023
> PCI_COMP_ERROR_STATUS		0x00000000005a2000
> PCI_COMP_INFO		0x0000000000004a7c 0x0035103303104100
>      Vendor Id/Device Id:                  0x35/1033

NEC USB

>      Base Class/Sub Class/Program Interface: 0x41/10/3
>      Segment/Bus/Device/Function:          0x0/0/1/0

and the HW path - builting USB (IIRC)

> PCI_COMP_MEM_NUM		0
> PCI_COMP_IO_NUM		0
> PCI_COMP_REGS_DATA_PAIR
>      Address                Data
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
> 
> PCI_COMP_OEM_DATA_STRUCT
> --- Section Header ---
> GUID
>   data1	0x4f7d86a
>   data2	0x598b
>   data3	0x4a0a
>   data4	0xaa 62 ff 70 73 46 67 4d 
> LENGTH		232
> PHYSICAL_LOCATION		0xffffffffffffff00
> REGISTRATION_NUMBER		0x0000000000000008
> CONFIG_REGISTERS_DATA
>         Offset    Size   Data
>           0        8     0x2210014600351033
>           8        8     0x008080200c031041
>          16        8     0x0000000080002000
>          24        8     0x0000000000000000
>          32        8     0x0000000000000000
>          40        8     0x0035103300000000
>          48        8     0x0000004000000000
>          56        8     0x2a01010000000000
>           0        0     0x0000000000000000
>           0        0     0x0000000000000000
>           0        0     0x0000000000000000
>           0        0     0x0000000000000000
> 
> End of PCI Component Error Information for Error 1
> 
> PCI Component Error 2
> --- Section Header ---
> GUID
>   data1	0xe429faf6
>   data2	0x3cb7
>   data3	0x11d4
>   datat4	0xbc a7 0 80 c7 3c 88 81 
> REVISION		0x0200
> ERROR_RECOVERY_INFO		0x80
> SECTION_LENGTH		0x00000188
> VALIDATION_BITS		0x0000000000000023
> PCI_COMP_ERROR_STATUS		0x00000000005a2000
> PCI_COMP_INFO		0x0000000000004a7c 0x0035103303104101
>      Vendor Id/Device Id:                  0x35/1033
>      Base Class/Sub Class/Program Interface: 0x41/10/3
>      Segment/Bus/Device/Function:          0x0/0/1/1
> PCI_COMP_MEM_NUM		0
> PCI_COMP_IO_NUM		0
> PCI_COMP_REGS_DATA_PAIR
>      Address                Data
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
>      0x0000000000000000     0x0000000000000000
> 
> PCI_COMP_OEM_DATA_STRUCT
> --- Section Header ---
> GUID
>   data1	0x4f7d86a
>   data2	0x598b
>   data3	0x4a0a
>   data4	0xaa 62 ff 70 73 46 67 4d 
> LENGTH		232
> PHYSICAL_LOCATION		0xffffffffffffff00
> REGISTRATION_NUMBER		0x0000000000000008
> CONFIG_REGISTERS_DATA
>         Offset    Size   Data
>           0        8     0x2210014600351033
>           8        8     0x000080200c031041
>          16        8     0x0000000080001000
>          24        8     0x0000000000000000
>          32        8     0x0000000000000000
>          40        8     0x0035103300000000
>          48        8     0x0000004000000000
>          56        8     0x2a01020000000000
>           0        0     0x0000000000000000
>           0        0     0x0000000000000000
>           0        0     0x0000000000000000
>           0        0     0x0000000000000000
> 
> End of PCI Component Error Information for Error 2
> 
> End of PCI Component Error Information
>   PCI Bus Error information
> 
> PCI Bus Error 1
> --- Section Header ---
> GUID
>   data1	0xe429faf4
>   data2	0x3cb7
>   data3	0x11d4
>   data4	0xbc a7 0 80 c7 3c 88 81 
> REVISION		0x0200
> ERROR_RECOVERY_INFO		0x84
> SECTION_LENGTH		0x00000108
> VALIDATION_BITS		0x000000000000074f
> PCI_BUS_ERROR_STATUS	0x00000000005a2000
> PCI_BUS_ERROR_TYPE	0x0000000000000004
> PCI_BUS_ID		0x0000000000000000
> PCI_BUS_ADDRESS		0x0000000000000d20
> PCI_BUS_DATA		0x0000000000000000
> PCI_BUS_CMD		0x0000000000000000
> PCI_BUS_REQUESTOR_ID	0x00000000fed20000
> PCI_BUS_COMPLETER_ID	0x0000000000000000
> PCI_BUS_TARGET_ID	0x0000000000000d20
> PCI_BUS_OEM_ID		0x0000000000003d90

BUS TARGET_ID would be interesting to understand if someone from HP could look this up.

FWIW, I have a similar dump from a long time ago published here:
    http://iou.parisc-linux.org/~grundler/console/pa8800-2.6.22-rc4-mm1-hpmc-01

I don't seem to have any notes relating to that dump.

> 
> Bus OEM Data
>   CEC Header:
> --- OEM Data Header ---
> 
> GUID
>   data1	0x9fe64482
>   data2	0xa02d
>   data3	0x4ef7
>   data4	0xad e6 c6 63 59 62 53 99 
> 
> --- OEM Data Body ---
> 
> CELL_NUMBER		0
> SBA_NUMBER		0
> ROPE_NUMBER		0
> --- Mercury Info ---
> ERROR_STATUS		0x000000010000021c
> ERROR_MASTER_ID_LOG	0x0000000000000000
> INBOUND_ERR_ADDRESS	0x0000000000000000
> INBOUND_ERR_ATTRIBUTE	0x0000000000000000
> COMPLETION_MESSAGE_LOG	0x0000000000000000
> OUTBOUND_ERR_ADDRESS	0x0000000000000d20
> ERROR_CONFIG		0x0000000000000030
> STATUS_INFO_CONTROL	0x0000000000000000
> FUNC_ID			0x22b00146122e103c
> CAPABILITIES_LIST	0x0f00023700200002
> AGP_COMMAND		0x0000000000000000
> PCIX_CAPABILITIES	0x0013ff0000010007
> OLR_CONTROL		0x00023f1b00032403
> CLOCK_CONTROL		0x0000000000000048
> BUS_MODE		0x9db864ef36f58460
> 
> End of PCI Bus Error Information for Error 1
> 
> End of PCI Bus Error Information
> 
> PAGE DEALLOCATION TABLE INFORMATION
> 
>    Location      Address       Type        Perm  Page  
>    ------------  ------------  ----------  ----  ---------
> 
>    No Entries in Page Deallocation Table 
> 
>    PDT Entries Used: 0
>    PDT Entries Free: 3000
>    PDT Total Size:   3000
> 
> --- vmlinux-2.6.36 ---
> 
> Processor 0 hpmc was here:
>  
> 0000000040329408 <lba_pat_out8>:
>     40329408:   d7 9f 18 52     depwi,z -1,29,14,ret0
>     4032940c:   53 5f 03 30     ldd 198(r26),r31
>     40329410:   db 39 0b f0     extrd,u r25,63,16,r25
>     40329414:   db 33 0b fe     extrd,u r25,63,2,r19
>     40329418:   0b 99 02 39     and r25,ret0,r25
>     4032941c:   f3 39 11 4a     depd,z r25,53,54,r25
>     40329420:   0a 79 0a 39     add,l r25,r19,r25
>     40329424:   0b 3f 0a 3f     add,l r31,r25,r31
>     40329428:   0f f8 12 00     stb r24,0(r31)
>     4032942c:   0f 40 10 dc     ldd 0(r26),ret0
>     40329430:   2b 6d 10 00     addil L%1a800,dp,r1
> ->  40329434:   0f 80 10 9f     ldw 0(ret0),r31
>     40329438:   50 3c 09 f0     ldd 4f8(r1),ret0
>     4032943c:   e8 40 d0 00     bve (rp)
>     40329440:   0f 9f 12 80     stw r31,0(ret0)
>     40329444:   00 00 00 00     break 0,0
> 
> lba_pat_out8 was called from outb.

This just means the bus wasn't responding. This is usually due
to IOMMU or PCI host controller have a "fatal" error.

> --- vmlinux-2.6.32-5-parisc64-smp ---
> 
> Processor 2 and 3 hpmcs were here:
> 
> 000000004031e3f0 <lba_pat_out8>:
>     4031e3f0:   d7 9f 18 52     depwi,z -1,29,14,ret0
>     4031e3f4:   53 5f 03 30     ldd 198(r26),r31
>     4031e3f8:   db 39 0b f0     extrd,u r25,63,16,r25
>     4031e3fc:   db 33 0b fe     extrd,u r25,63,2,r19
>     4031e400:   0b 99 02 39     and r25,ret0,r25
>     4031e404:   f3 39 11 4a     depd,z r25,53,54,r25
>     4031e408:   0a 79 0a 39     add,l r25,r19,r25
>     4031e40c:   0b 3f 0a 3f     add,l r31,r25,r31
>     4031e410:   0f f8 12 00     stb r24,0(r31)
>     4031e414:   0f 40 10 dc     ldd 0(r26),ret0
>     4031e418:   2b 6d 00 00     addil L%1a000,dp,r1
> ->  4031e41c:   0f 80 10 9f     ldw 0(ret0),r31
>     4031e420:   50 3c 0f 10     ldd 788(r1),ret0
>     4031e424:   e8 40 d0 00     bve (rp)
>     4031e428:   0f 9f 12 80     stw r31,0(ret0)
>     4031e42c:   00 00 00 00     break 0,0
> 
> lba_pat_out8 was again called from outb:
> 
> 00000000401286d0 <outb>:
>     401286d0:   0f c2 12 c1     std rp,-10(sp)
>     401286d4:   db 39 0f e0     extrd,s r25,63,32,r25
>     401286d8:   d3 3c 1d f0     extrw,s r25,15,16,ret0
>     401286dc:   73 c4 01 08     std,ma r4,80(sp)
>     401286e0:   db 58 0b f8     extrd,u r26,63,8,r24
>     401286e4:   2b 70 30 00     addil L%21800,dp,r1
>     401286e8:   db 9a 0f e0     extrd,s ret0,63,32,r26
>     401286ec:   50 3c 0b 50     ldd 5a8(r1),ret0
>     401286f0:   0f 80 10 9c     ldw 0(ret0),ret0
>     401286f4:   87 80 20 38     cmpib,= 0,ret0,40128718 <outb+0x48>
>     401286f8:   2b 68 00 00     addil L%10000,dp,r1
>     401286fc:   bf 40 20 2a     cmpb,*<>,n r0,r26,40128718 <outb+0x48>
>     40128700:   08 18 02 5a     copy r24,r26
>     40128704:   37 dd 3f a1     ldo -30(sp),ret1
>     40128708:   e8 fc af 14     b,l 40321e98 <eisa_out8>,rp
>     4012870c:   d3 39 1b f0     extrw,u r25,31,16,r25
>     40128710:   e8 00 00 68     b,l 4012874c <outb+0x7c>,r0
>     40128714:   53 c2 3e e1     ldd -90(sp),rp
>     40128718:   50 3c 0c 90     ldd 648(r1),ret0
>     4012871c:   0f 9a 20 da     ldd,s r26(ret0),r26
>     40128720:   9f 40 20 40     cmpb,*= r0,r26,40128748 <outb+0x78>
>     40128724:   2b 70 30 00     addil L%21800,dp,r1
>     40128728:   d3 39 1b f0     extrw,u r25,31,16,r25
>     4012872c:   50 3c 02 10     ldd 108(r1),ret0
>     40128730:   0f 80 10 dc     ldd 0(ret0),ret0
>     40128734:   37 dd 3f a1     ldo -30(sp),ret1
>     40128738:   53 9c 00 30     ldd 18(ret0),ret0
>     4012873c:   53 82 00 20     ldd 10(ret0),rp
>     40128740:   e8 40 f0 00     bve,l (rp),rp
>     40128744:   53 9b 00 30     ldd 18(ret0),dp
> ->  40128748:   53 c2 3e e1     ldd -90(sp),rp
>     4012874c:   e8 40 d0 00     bve (rp)
>     40128750:   53 c4 3f 0d     ldd,mb -80(sp),r4
>     40128754:   00 00 00 00     break 0,0
> 
> In all three cases, register %ret0 contained 000000000002c000.

I don't know offhand what the 0x2c000 is used for.
It seems like an LBA register offset e.g. 0x20000 + (ROPE_NUM << 13)

Which seems odd given we should be accessing one of
the GMMIO ranges which generates IO Port transactions:
#ifdef CONFIG_64BIT
	/* GMMIO is  distributed range. Every LBA/Rope gets part it. */
	if (ldev->hba.gmmio_space.flags) {
		err = request_resource(&iomem_resource, &(ldev->hba.gmmio_space));
....

and 

#define PIOP_TO_GMMIO(lba, addr) \
        ((lba)->iop_base + (((addr)&0xFFFC)<<10) + ((addr)&3))

I was pretty sure iop_base is > 4GB.

hth,
grant

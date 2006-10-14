From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Sat, 14 Oct 2006 23:35:47 +0000
Message-ID: <45317453.1090603@scarlet.be>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
	<20061012195503.GA15124@colo.lackof.org>
	<452F70F2.4020700@scarlet.be>
	<20061013164406.GC13770@colo.lackof.org>
	<4530DF1F.5060601@scarlet.be>
	<20061014141147.GM11633@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061014141147.GM11633@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Matthew Wilcox wrote:
> On Sat, Oct 14, 2006 at 12:59:11PM +0000, Joel Soete wrote:
>> but yes that's the primary question and:
>> 	* I encountered pbs with ncr53c720 and core io ncr53c710
>> 	 (different pb with each hba but same one-to-one on d380 and c110),
>> 	* but no pb with same disk (and its scsi chain: cable + terminator) 
>> 	with ncr53c710 (behind dino) on a b180,
>> so
>> 	* no hw pb with disk,
>> 	* no sw pb with nc53c710 Jame's driver,
>> 	 (even thought less sure, as make me noticed Mike:
>> 		on b180, 53c710 is behind dino i.e. gsc pci bus bridge, 
>> 		right?
>> 		on c110 and d380, this 53c710 is behind LASI (afaik just a 
>> 		vlsi assembly and no bus bridge)
>> 		so could be also a pb with 53c710 when married with gsc?)
> 
> You should never listen to Zick.
Don't blame Mike, it's my mistake I would have to check my ioscan before mentioned this hypothesis
(Appologie Mike)

   53c710 is always part of Lasi on PA
> machines.  There's a discrete 53c700 on pre-Lasi machines.  There is
> never a 53c710 behind Dino.  Dino has a serial port, a ps/2 port, and a
> pci host bridge.
> 
ok my bad.

>> 	* most probably the pb is well in sg list management in ccio (afaik 
>> 	not used by dino)
> 
> Wrong.  sg list management is used by PCI devices behind Dino as well as
> by GSC devices.
> 
Yes and no: there is a big diff between b180 and c110/d380 arch about connectic between cpu and lasi in particular:
on b180 ioscan tel me (grab from hw db):

> :pa:F:F:F:-1:-1:4294967295:bc:root:::0:root:root:CLAIMED:BUS_NEXUS::0
> pa:pa:F:F:F:-1:-1:4294967295:bc:bus_converter:8:80 64 0 7 0 0 0 0 0 0 0 0 0 0 0 0 :1:root.bc:bc:CLAIMED:BUS_NEXUS:Pseudo Bus Converter:1
[snip]
> pa:core:F:F:F:-1:-1:4294967295:ba:core_adapter:8/16:3 240 128 75 0 0 129 0 0 0 0 0 0 0 0 0 :1:root.bc.bus_adapter:bus_adapter:CLAIMED:BUS_NEXUS:Core I/O Adapter:1
> core:wsio:F:T:F:-1:216:131072:ext_bus:CentIf:8/16/0:3 240 128 10 0 0 116 0 0 0 0 0 0 0 0 0 :2:root.bc.bus_adapter.CentIf:CentIf:CLAIMED:INTERFACE:Built-in Parallel Interface:2
> core:wsio:F:T:F:-1:66:0:audio:audio:8/16/1:3 244 128 10 0 0 123 0 0 0 0 0 0 0 0 0 :0:root.bc.bus_adapter.audio:audio:CLAIMED:INTERFACE:Built-in Audio:0
> core:wsio:F:T:F:-1:1:0:tty:asio0:8/16/4:3 240 0 138 0 0 140 0 1 0 0 0 99 9 0 2 :0:root.bc.bus_adapter.asio0:asio0:CLAIMED:INTERFACE:Built-in RS-232C:0
> core:wsio:F:F:F:0:0:65536:ext_bus:c720:8/16/5:3 240 128 138 0 0 130 0 153 0 1 0 77 65 0 2 :1:root.bc.bus_adapter.c720:c720:CLAIMED:INTERFACE:Built-in SCSI:1
> scsi:wsio:F:F:F:-1:-1:4294967295:target:tgt:8/16/5.7:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 :2:root.bc.bus_adapter.c720.tgt:tgt:CLAIMED:DEVICE::1
> scsi:wsio:F:T:F:-1:203:94208:ctl:sctl:8/16/5.7.0:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 :1:root.bc.bus_adapter.c720.tgt.sctl:sctl:CLAIMED:DEVICE:Initiator:1
> core:wsio:F:T:F:-1:159:0:ps2:ps2:8/16/7:3 240 0 138 0 0 132 0 0 0 0 0 110 5 0 2 :0:root.bc.bus_adapter.ps2:ps2:CLAIMED:INTERFACE:Built-in Keyboard/Mouse:0
> pa:wsio:F:F:F:-1:229:4294967295:graphics:graph3:8/24:1 96 0 138 0 0 133 0 1 0 0 0 104 38 0 2 :1:root.bc.graph3:graph3:CLAIMED:INTERFACE:Graphics:1
> pa:pa:F:F:F:-1:-1:4294967295:processor:processor:62:80 64 0 64 0 0 4 129 0 0 0 0 0 0 0 0 :0:root.processor:processor:CLAIMED:PROCESSOR:Processor:0
> pa:pa:F:F:F:-1:-1:4294967295:memory:memory:63:5 160 31 65 0 0 9 0 0 0 0 0 0 0 0 0 :0:root.memory:memory:CLAIMED:MEMORY:Memory:0
> 

so the cpu and ram seems to me connected directly to the root bus.

and the "core_adapter" (I guess lasi interface) is connected to the root bus (btw to cpu) through a bc named here Pseudo Bus 
Converter.

Otoh for c110 (e.g.)

> :pa:F:F:F:-1:-1:4294967295:bc:root:::0:root:root:CLAIMED:BUS_NEXUS::0
> pa:pa:F:F:F:-1:-1:4294967295:bc:bus_converter:8:88 7 8 76 0 0 11 80 0 0 0 0 0 0 0 0 :1:root.ccio:ccio:CLAIMED:BUS_NEXUS:I/O Adapter:1
[snip]
> pa:core:F:F:F:-1:-1:4294967295:ba:core_adapter:8/16:3 32 0 139 0 0 129 0 0 0 0 0 123 85 0 0 :0:root.ccio.bus_adapter:bus_adapter:CLAIMED:BUS_NEXUS:Core I/O Adapter:0
> core:wsio:F:T:F:-1:216:131072:ext_bus:CentIf:8/16/0:3 32 0 10 0 0 116 0 0 0 0 0 0 0 0 0 :2:root.ccio.bus_adapter.CentIf:CentIf:CLAIMED:INTERFACE:Built-in Parallel Interface:2
> core:wsio:F:T:F:-1:66:0:audio:audio:8/16/1:3 32 0 10 0 0 123 0 0 0 0 0 0 0 0 0 :0:root.ccio.bus_adapter.audio:audio:CLAIMED:INTERFACE:Built-in Audio:0
> core:wsio:F:T:F:-1:1:0:tty:asio0:8/16/4:3 32 0 138 0 0 140 0 0 0 0 0 100 121 0 2 :0:root.ccio.bus_adapter.asio0:asio0:CLAIMED:INTERFACE:Built-in RS-232C:0
> core:wsio:F:F:F:0:0:65536:ext_bus:c720:8/16/5:3 32 0 138 0 0 130 0 0 0 0 0 105 39 0 2 :1:root.ccio.bus_adapter.c720:c720:CLAIMED:INTERFACE:Built-in SCSI:1
> scsi:wsio:F:F:F:-1:-1:4294967295:target:tgt:8/16/5.5:0 0 2 2 0 0 0 0 255 242 66 246 235 229 217 91 :2:root.ccio.bus_adapter.c720.tgt:tgt:CLAIMED:DEVICE::1
> scsi:wsio:T:T:F:31:188:86016:disk:sdisk:8/16/5.5.0:0 0 2 2 0 0 0 0 255 242 66 246 235 229 217 91 :3:root.ccio.bus_adapter.c720.tgt.sdisk:sdisk:CLAIMED:DEVICE:Quantum VP32210:1
> scsi:wsio:F:F:F:-1:-1:4294967295:target:tgt:8/16/5.7:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 :3:root.ccio.bus_adapter.c720.tgt:tgt:CLAIMED:DEVICE::1
> scsi:wsio:F:T:F:-1:203:94208:ctl:sctl:8/16/5.7.0:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 :1:root.ccio.bus_adapter.c720.tgt.sctl:sctl:CLAIMED:DEVICE:Initiator:1
> core:wsio:F:T:F:-1:52:0:lan:lan2:8/16/6:3 32 0 138 0 0 138 0 0 0 0 0 91 253 0 2 :0:root.ccio.bus_adapter.lan2:lan2:CLAIMED:INTERFACE:Built-in LAN:0
> core:wsio:F:T:F:-1:159:0:ps2:ps2:8/16/7:3 32 0 138 0 0 132 0 0 0 0 0 110 57 0 2 :0:root.ccio.bus_adapter.ps2:ps2:CLAIMED:INTERFACE:Built-in Keyboard/Mouse:0
> core:wsio:F:F:F:0:0:0:pc:fdc:8/16/10:3 32 0 10 0 0 131 0 0 0 0 0 0 0 0 0 :0:root.ccio.bus_adapter.fdc:fdc:CLAIMED:INTERFACE:Built-in Floppy Drive:0
> pa:core:F:F:F:-1:-1:4294967295:ba:core_adapter:8/20:1 224 0 11 0 0 142 0 0 0 0 0 0 0 0 0 :1:root.ccio.bus_adapter:bus_adapter:CLAIMED:BUS_NEXUS:Core I/O Adapter:1
> core:wsio:F:T:F:-1:24:0:hil:hil:8/20/1:1 224 0 138 0 0 115 0 0 0 0 0 129 124 0 2 :0:root.ccio.bus_adapter.hil:hil:CLAIMED:INTERFACE:Built-in HIL:0
> core:wsio:F:T:F:-1:1:65536:tty:asio0:8/20/2:1 224 0 138 0 0 140 128 0 0 0 0 101 57 0 2 :1:root.ccio.bus_adapter.asio0:asio0:CLAIMED:INTERFACE:Built-in RS-232C:1
> core:eisa:F:F:F:-1:-1:4294967295:ba:eisa_adapter:8/20/5:1 224 0 11 0 0 144 0 0 0 0 0 0 0 0 0 :2:root.ccio.bus_adapter.eisa:eisa:CLAIMED:BUS_NEXUS:EISA Bus Adapter:2
> core:wsio:F:F:F:-1:-1:4294967295:unknown:unknown:8/20/5/1:0 0 0 0 :0:root.ccio.bus_adapter.eisa.unknown:unknown:CLAIMED:INTERFACE:ISA card #:0
> core:wsio:F:T:F:-1:76:0:sicl:sicl:8/20/5/2:0 0 0 0 :0:root.ccio.bus_adapter.eisa.sicl:sicl:CLAIMED:INTERFACE:ISA card #:0
> pa:pa:F:F:F:-1:-1:4294967295:bc:bus_converter:10:88 7 8 76 0 0 11 80 0 0 0 0 0 0 0 0 :2:root.ccio:ccio:CLAIMED:BUS_NEXUS:I/O Adapter:2
> pa:wsio:F:F:F:-1:229:4294967295:graphics:graph3:10/16:3 32 0 138 0 0 133 0 1 0 0 0 107 5 0 2 :0:root.ccio.graph3:graph3:CLAIMED:INTERFACE:Graphics:0
> pa:pa:F:F:F:-1:-1:4294967295:processor:processor:32:88 224 0 0 0 0 4 129 0 0 0 0 0 0 0 0 :0:root.processor:processor:CLAIMED:PROCESSOR:Processor:0
> pa:pa:F:F:F:-1:-1:4294967295:memory:memory:49:4 144 26 1 0 0 9 0 0 0 0 0 0 0 0 0 :0:root.memory:memory:CLAIMED:MEMORY:Memory:0

Here again cpu and ram are also connected directly connected to the root bus.

and otc the core_adapter (I always guess that's lasi interface) is connected to the root bus through ccio bc.

So here, I guess that software reflect this hw configuration and when a lasi module driver (let say e.g. 53c710) need some 
io resources it would forward the request to ccio module driver which would most probably have to use its own sg list 
management functions (like ccio_map_single(), ccio_unmap_single(), ccio_map_sg(), ccio_unmap_sg(), etc) which I called "sg 
list management in ccio".

Otc on b180 lasi module would better have to address there request to the "Pseudo Bus Converter", i.e. quasi directly.

So why/how the kernel on b180 would use those same functions (ccio_map_single(), ccio_unmap_single(), ccio_map_sg(), 
ccio_unmap_sg(), etc) to manage sg list of a non-exitent device???

What did I miss?

Thanks,
	Joel


> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

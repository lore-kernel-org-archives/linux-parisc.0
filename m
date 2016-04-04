From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [Nouveau] PA-RISC (hppa) video cards init failure loading the device driver kernel module
Date: Mon, 4 Apr 2016 19:05:25 -0400
Message-ID: <C805689B-0DCD-420F-9719-3F82B239E9BC@bell.net>
References: <CACrbsaA0RzGtVQD5GH5eMZk-0c1J0AF_nZFWQpGzVYMs-xCE2g@mail.gmail.com> <CAKb7Uvh-DZC4RakBd-F-Gxh45_jFEE+vF89DXou5MLb7qg3Jqw@mail.gmail.com> <CACrbsaC67nqia4C3xOQ0SshkyPQb5DuRuuXq1Zsez1pxezp5nw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Ilia Mirkin <imirkin@alum.mit.edu>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	Paolo Gai <pj@evidence.eu.com>,
	Graham Gower <graham.gower@gmail.com>,
	Gianni Bianchini <giannibi@dii.unisi.it>,
	Helge Deller <deller@gmx.de>,
	Riccardo Schiavi <r.schiavi@evidence.eu.com>,
	Daniele Mazzi <daniele.mazzi@gmail.com>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaC67nqia4C3xOQ0SshkyPQb5DuRuuXq1Zsez1pxezp5nw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There is a TLB U bit which when set prevents cache move in.  This should be set for
pages which map to the I/O space.  I think it should be checked that it is correctly being
set for these cards.

On 2016-04-03, at 11:56 PM, Simone Mannori wrote:

> Dear Ilia,
> 
> this page summarize all the possible options of the "nouveau" kernel module:
> 
> https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> 
> I will test the options that you have suggested as soon as possible.
> 
> Try a PCI video card is a very good advice because the
> AGP/FX1(chipset) is on the top of the "usual suspects" list;
> unfortunately the c8000 has 3.3 PCI slots and all the (very old) PCI
> video cards in my hands have 5V PCI connector
> 
> Many thanks for your suggestions and advice.
> 
>   Simone Mannori - Italy
> 
> 
> On 4 April 2016 at 04:18, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>> Not sure about the radeon issue, but
>> 
>> "DRM: GPU lockup - switching to software fbcon"
>> 
>> basically means "the CPU isn't able to submit commands, or the GPU
>> isn't executing the commands". Basically the GPU can only have so many
>> commands outstanding [well, command buffers], and we hit that limit.
>> From what I understand, PA-RISC has a "funny" architecture that is
>> very unlike x86 in terms of memory coherency, and is thus more likely
>> to hit issues that don't exist on other architectures. Perhaps you can
>> summarize the key points of oddness? Perhaps there's some debug
>> "disable caches" mode or something? Also note that nouveau won't work
>> well on an architecture with a non-4K page size. Not sure if that's
>> the situation for you.
>> 
>> I see that it's using AGP - there's a high chance that something
>> AGP-related is broken - try booting with nouveau.config=NvAGP=0 (or
>> nouveau.agpmode=0 for pre-4.3 kernels).
>> 
>> Perhaps it has issues DMA'ing the command buffer from system memory,
>> we can try forcing the pushbuf to be in vram - boot with
>> nouveau.vram_pushbuf=1 .
>> 
>> If there are PCI slots and you have a PCI video card handy, I'd
>> definitely try that too.
>> 
>> Good luck,
>> 
>>  -ilia
>> 
>> On Sun, Apr 3, 2016 at 3:51 AM, Simone Mannori <simone.mannori@gmail.com> wrote:
>>> Dear "nouveau" developers,
>>> 
>>> I know that many very competent guys have already spent a lot of time
>>> and efforts on this issue without success. I have started to play with
>>> "hppa" two weeks ago and, with the support of the linux-parisc mailing
>>> list people, now I have a - almost fully - working workstation (hp
>>> c8000).
>>> 
>>> Everythings work perfectly BUT the video card. No matter the model,
>>> type, driver, etc. the results are always the same: a very slow frame
>>> buffer mode only.
>>> 
>>> I'm forwarding the results of my investigations with the hope that
>>> someone of you will help me to find the right path to fix this issue.
>>> 
>>> Thanks in advance for your help.
>>> 
>>>  Simone Mannori - Italy
>>> 
>>> //**------------------------------------------------------------------------------------------------------------
>>> 
>>> ---------- Forwarded message ----------
>>> From: Simone Mannori <simone.mannori@gmail.com>
>>> Date: 3 April 2016 at 09:34
>>> Subject: Video cards init failure loading the device driver kernel module
>>> To: John David Anglin <dave.anglin@bell.net>
>>> Cc: Helge Deller <deller@gmx.de>, Graham Gower
>>> <graham.gower@gmail.com>, linux-parisc <linux-parisc@vger.kernel.org>
>>> 
>>> 
>>> Dear All,
>>> 
>>> following you suggestions, now I have an - almost - perfectly working
>>> hp c8000 workstation.
>>> 
>>> Mission accomplished? Not exactly: despite a lot of efforts, the video
>>> card section is still not fully operative. Let me resume the
>>> situation.
>>> 
>>> I'm using a c8000 with two PA-8800 and Debian 8.0, kernel:
>>> 
>>> Linux version 4.4.0-1-parisc64-smp (debian-kernel@lists.debian.org)
>>> (gcc version 4.9.3 (GCC) ) #1 SMP Debian 4.4.6-1 (2016-03-17)
>>> 
>>> I have two very different AGP video cards (ATI FireGL T2 and NVIDIA
>>> QUADRO MXR) that have the same issue, despite the two complety
>>> different drivers ("radeon" and "nouveau"). The full logs are in
>>> bottom of this post. Just to make a long history short:
>>> 
>>> ATI FIRE GL T2 ("radeon")
>>> [   47.836000] [drm:r100_ring_test [radeon]] *ERROR* radeon: ring test
>>> failed (scratch(0x15E4)=0xCAFEDEAD)
>>> [   47.948000] [drm:r100_cp_init [radeon]] *ERROR* radeon: cp isn't
>>> working (-22).
>>> [   48.036000] radeon 0000:80:00.0: failed initializing CP (-22).
>>> [   48.036000] radeon 0000:80:00.0: Disabling GPU acceleration
>>> 
>>> NVIDIA QUADRO MXR ("nouveau")
>>> [   54.388000] nouveau 0000:80:00.0: DRM: GPU lockup - switching to
>>> software fbcon
>>> [   54.684000] nouveau 0000:80:00.0: fb0: nouveaufb frame buffer device
>>> [   54.784000] [drm] Initialized nouveau 1.3.1 20120801 for
>>> 0000:80:00.0 on minor 0
>>> 
>>> Looking inside the posts on many developers mailing lists, I see that
>>> most of the efforts have been focused on the video device drivers init
>>> code. I have tried to force the video drivers using the "modeset"
>>> parameter without success. I have tried also to boot without video
>>> driver, then load it manually using "modprobe". No way: the results
>>> are the same.
>>> 
>>> "lsmod" tell me that "radeon"/"nouveau" are used by the "ttm" module
>>> and they cannot be removed (despite the "- r --force" modprobe
>>> parameters).
>>> 
>>> Let suppose for a moment that the issue is NOT inside the video driver
>>> but in the "ttm" module: something is not fully correct in the
>>> initialization of the ZX1 chipset, therefore the video driver code go
>>> crazy because cannot match the video card with the chipset.
>>> 
>>> The only way that I know to investigate this issue is to recompile the
>>> kernel with debug support and execute "single step"/breakpoint the
>>> code that initialize the video card and the chipset near the zone of
>>> the error message.
>>> 
>>> Question: "What are the deb packages that I need to install to
>>> recompile the  4.4.0-1-parisc64-smp kernel (or another kernel version
>>> suitable for this investigation) ?
>>> 
>>> Thanks in advance for you help
>>> 
>>>   Simone Mannori - Italy
>>> 
>>> //**-----------------------------------------------------------------------------------------------------------------
>>> 
>>> ATI FIRE GL T2
>>> [   45.460000] [drm] radeon kernel modesetting enabled.
>>> [   45.576000] radeon 0000:80:00.0: enabling SERR and PARITY (0107 -> 0147)
>>> [   45.660000] [drm] initializing kernel modesetting (RV350
>>> 0x1002:0x4154 0x1002:0x0002).
>>> [   45.812000] [drm] register mmio base: 0xC8020000
>>> [   45.868000] [drm] register mmio size: 65536
>>> [   46.084000] radeon 0000:80:00.0: putting AGP V3 device into 8x mode
>>> [   46.160000] radeon 0000:80:00.0: GTT: 512M 0x60000000 - 0x7FFFFFFF
>>> [   46.236000] [drm] Generation 2 PCI interface, using max accessible memory
>>> [   46.316000] radeon 0000:80:00.0: VRAM: 128M 0xFFFFFFFFC0000000 -
>>> 0xFFFFFFFFC7FFFFFF (128M used)
>>> [   46.420000] [drm] Detected VRAM RAM=128M, BAR=128M
>>> [   46.476000] [drm] RAM width 128bits DDR
>>> [   46.524000] [TTM] Zone  kernel: Available graphics memory: 3077188 kiB
>>> [   46.604000] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
>>> [   46.680000] [TTM] Initializing pool allocator
>>> [   46.732000] [drm] radeon: 128M of VRAM memory ready
>>> [   46.792000] [drm] radeon: 512M of GTT memory ready.
>>> [   46.852000] [drm] radeon: 1 quad pipes, 1 Z pipes initialized.
>>> [   46.944000] radeon 0000:80:00.0: WB disabled
>>> [   46.996000] radeon 0000:80:00.0: fence driver on ring 0 use gpu
>>> addr 0x0000000060000000 and cpu addr 0x0000000011279000
>>> [   47.124000] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>> [   47.204000] [drm] Driver supports precise vblank timestamp query.
>>> [   47.276000] [drm] radeon: irq initialized.
>>> [   47.328000] [drm] Loading R300 Microcode
>>> [   47.468000] radeon 0000:80:00.0: firmware: direct-loading firmware
>>> radeon/R300_cp.bin
>>> [   47.584000] [drm] radeon: ring at 0x0000000060001000
>>> [   47.836000] [drm:r100_ring_test [radeon]] *ERROR* radeon: ring test
>>> failed (scratch(0x15E4)=0xCAFEDEAD)
>>> [   47.948000] [drm:r100_cp_init [radeon]] *ERROR* radeon: cp isn't
>>> working (-22).
>>> [   48.036000] radeon 0000:80:00.0: failed initializing CP (-22).
>>> [   48.036000] radeon 0000:80:00.0: Disabling GPU acceleration
>>> [  OK  ] Found device ST373207LW 2.
>>> [   48.236000] [drm:r100_cp_fini [radeon]] *ERROR* Wait for CP idle
>>> timeout, shutting down CP.
>>> [   48.384000] [drm] radeon: cp finalized
>>> [   48.448000] [drm] radeon: cp finalized
>>> [   48.496000] [TTM] Finalizing pool allocator
>>> [   48.544000] [TTM] Zone  kernel: Used memory at exit: 0 kiB
>>> [   48.612000] [TTM] Zone   dma32: Used memory at exit: 0 kiB
>>> [   48.676000] [drm] radeon: ttm finalized
>>> [   48.724000] [drm] Forcing AGP to PCI mode
>>>         Starting File System Check on /d[   48.872000] [drm]
>>> Generation 2 PCI interface, using max accessible memory
>>> ev/...2-638b-4a0[   48.968000] radeon 0000:80:00.0: VRAM: 128M
>>> 0xFFFFFFFFC0000000 - 0xFFFFFFFFC7FFFFFF (128M used)
>>> c-be55-7444e126d[   49.088000] radeon 0000:80:00.0: GTT: 512M
>>> 0xFFFFFFFFA0000000 - 0xFFFFFFFFBFFFFFFF
>>> 283...
>>> [   49.196000] [drm] Detected VRAM RAM=128M, BAR=128M
>>> [   49.264000] [drm] RAM width 128bits DDR
>>> [   49.328000] [TTM] Zone  kernel: Available graphics memory: 3077188 kiB
>>> [   49412000] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
>>> [   49.492000] [TTM] Initializing pool allocator
>>> [   49.492000] [drm] radeon: 128M of VRAM memory ready
>>> [   49.492000] [drm] radeon: 512M of GTT memory ready.
>>> [   49.492000] [drm] GART: num cpu pages 131072, num gpu pages 131072
>>> [   49.636000] [drm] radeon: 1 quad pipes, 1 Z pipes initialized.
>>> [   49.636000] [drm] PCI GART of 512M enabled (table at 0x0000000043300000).
>>> [   49.636000] radeon 0000:80:00.0: WB enabled
>>> [   49.636000] radeon 0000:80:00.0: fence driver on ring 0 use gpu
>>> addr 0xffffffffa0000000 and cpu addr 0x000000007d239000
>>> [   49.636000] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>> [   49.636000] [drm] Driver supports precise vblank timestamp query.
>>> [   49.636000] [drm] radeon: irq initialized.
>>> [   49.780000] [drm] radeon: ring at 0xFFFFFFFFA0001000
>>> [   49.972000] [drm:r100_ring_test [radeon]] *ERROR* radeon: ring test
>>> failed (scratch(0x15E4)=0xCAFEDEAD)
>>> [   49.976000] [drm:r100_cp_init [radeon]] *ERROR* radeon: cp isn't
>>> working (-22).
>>> [   49.976000] radeon 0000:80:00.0: failed initializing CP (-22).
>>> [   49.976000] radeon 0000:80:00.0: Disabling GPU acceleration
>>> [   50.168000] [drm:r100_cp_fini [radeon]] *ERROR* Wait for CP idle
>>> timeout, shutting down CP.
>>> [   50.280000] [drm] radeon: cp finalized
>>> [   50.592000] [drm] Radeon Display Connectors
>>> [   50.592000] [drm] Connector 0:
>>> [   50.592000] [drm]   VGA-1
>>> [   50.592000] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
>>> [   50.592000] [drm]   Encoders:
>>> [   50.592000] [drm]     CRT1: INTERNAL_DAC1
>>> [   50.592000] [drm] Connector 1:
>>> [   50.592000] [drm]   DVI-I-1
>>> [   50.592000] [drm]   HPD1
>>> [   50.592000] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
>>> [   50.592000] [drm]   Encoders:
>>> [   50.592000] [drm]     CRT2: INTERNAL_DAC2
>>> [   50.592000] [drm]     DFP1: INTERNAL_TMDS1
>>> [   50.608000] radeon 0000:80:00.0: No connectors reported connected with modes
>>> [   50.608000] [drm] Cannot find any crtc or sizes - going 1024x768
>>> [   50.828000] [drm] fb mappable at 0xFFFFFFFFC0040000
>>> [   50.828000] [drm] vram apper at 0xFFFFFFFFC0000000
>>> [   50.828000] [drm] size 3145728
>>> [   50.828000] [drm] fb depth is 24
>>> [   50.828000] [drm]    pitch is 4096
>>> [   51.848000] Console: switching to colour frame buffer device 128x48
>>> [   52.080000] radeon 0000:80:00.0: fb0: radeondrmfb frame buffer device
>>> [   52172000] [drm] Initialized radeon 2.43.0 20080528 for
>>> 0000:80:00.0 on minor 0
>>> 
>>> NVIDIA QUADRO MXR
>>> [   51.880000] nouveau 0000:80:00.0: enabling SERR and PARITY (0007 -> 0147)
>>> [   52.044000] nouveau 0000:80:00.0: NVIDIA NV11 (011300a1)
>>> [   52.364000] nouveau 0000:80:00.0: bios: version 03.11.01.24.00
>>> [   52.488000] nouveau 0000:80:00.0: putting AGP V2 device into 4x mode
>>> [   52.592000] nouveau 0000:80:00.0: putting AGP V2 device into 4x mode
>>> [   52.668000] nouveau 0000:80:00.0: tmr: unknown input clock freq
>>> [   52.740000] nouveau 0000:80:00.0: fb: 32 MiB SDRAM
>>> [   52.844000] [TTM] Zone  kernel: Available graphics memory: 3077188 kiB
>>> [   52.920000] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
>>> [   52.920000] [TTM] Initializing pool allocator
>>> [   52.928000] nouveau 0000:80:00.0: DRM: VRAM: 31 MiB
>>> [   52.928000] nouveau 0000:80:00.0: DRM: GART: 512 MiB
>>> [   52.928000] nouveau 0000:80:00.0: DRM: BMP version 5.20
>>> [   52.928000] nouveau 0000:80:00.0: DRM: No useful DCB data in VBIOS
>>> [   52.928000] nouveau 0000:80:00.0: DRM: Adaptor not initialised,
>>> running VBIOS init tables.
>>> [   53.016000] nouveau 0000:80:00.0: DRM: Saving VGA fonts
>>> [   53.336000] nouveau 0000:80:00.0: DRM: No useful DCB data in VBIOS
>>> [   53.336000] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>> [   53.336000] [drm] Driver supports precise vblank timestamp query.
>>> [   53.336000] nouveau 0000:80:00.0: DRM: 0xABA2: Parsing digital
>>> output script table
>>> [   53.920000] nouveau 0000:80:00.0: DRM: MM: using M2MF for buffer copies
>>> [   54.144000] nouveau 0000:80:00.0: DRM: allocated 1920x1200 fb:
>>> 0x8000, bo 000000007cee1000
>>> [   54.276000] nouveau 0000:80:00.0: DRM: 0xABCE: Parsing digital
>>> output script table
>>> [   54.312000] Console: switching to colour frame buffer device 240x75
>>> [   54.388000] nouveau 0000:80:00.0: DRM: GPU lockup - switching to
>>> software fbcon
>>> [   54.684000] nouveau 0000:80:00.0: fb0: nouveaufb frame buffer device
>>> [   54.784000] [drm] Initialized nouveau 1.3.1 20120801 for
>>> 0000:80:00.0 on minor 0
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
John David Anglin	dave.anglin@bell.net




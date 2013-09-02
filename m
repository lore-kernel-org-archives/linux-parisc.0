From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Mon, 2 Sep 2013 10:10:29 -0400
Message-ID: <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=KOI8-R;
	format=flowed	delsp=yes
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: gnidorah@p0n4ik.tk
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2-Sep-13, at 2:43 AM, gnidorah@p0n4ik.tk wrote:

>
> 01.09.2013, =D7 18:48, John David Anglin <dave.anglin@bell.net> =20
> =CE=C1=D0=C9=D3=C1=CC(=C1):
>
>> I had one boot instance where the initial ring test succeeded:
>>
>> [drm] radeon kernel modesetting enabled.radeon 0000:e0:02.0: =20
>> enabling SERR and PARITY (0187 -> 01c7)
>> [drm] initializing kernel modesetting (RV100 0x1002:0x5159 0x103C:=20
>> 0x1292).
>> [drm] register mmio base: 0xF4040000
>> [drm] register mmio size: 65536
>> [drm] GPU not posted. posting now...
>> radeon 0000:e0:02.0: VRAM: 64M 0xFFFFFFFFF0000000 - =20
>> 0xFFFFFFFFF3FFFFFF (8M used)
>> radeon 0000:e0:02.0: GTT: 512M 0xFFFFFFFFD0000000 - =20
>> 0xFFFFFFFFEFFFFFFF
>> [drm] Detected VRAM RAM=3D64M, BAR=3D64M
>> [drm] RAM width 64bits DDR[TTM] Zone  kernel: Available graphics =20
>> memory: 4117164 kiB
>> [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
>> [TTM] Initializing pool allocator
>> [drm] radeon: 8M of VRAM memory ready
>> [drm] radeon: 512M of GTT memory ready.
>> [drm] GART: num cpu pages 131072, num gpu pages 131072
>> [drm] PCI GART of 512M enabled (table at 0x00000000424C0000).
>> radeon 0000:e0:02.0: WB disabled
>> radeon 0000:e0:02.0: fence driver on ring 0 use gpu addr =20
>> 0xffffffffd0000000 and cpu addr 0x000000007df2b000
>> [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
>> [drm] Driver supports precise vblank timestamp query.
>> [drm] radeon: irq initialized.
>> [drm] Loading R100 Microcode
>> [drm] radeon: ring at 0xFFFFFFFFD0001000
>> [drm] ring test succeeded in 0 usecs
>> radeon 0000:e0:02.0: GPU lockup CP stall for more than 10000msec
>> radeon 0000:e0:02.0: GPU lockup (waiting for 0x0000000000000001 =20
>> last fence id 0x0000000000000000)
>> [drm:r100_ib_test] *ERROR* radeon: fence wait failed (-45).
>> [drm:radeon_ib_ring_tests] *ERROR* radeon: failed testing IB on GFX =
=20
>> ring (-45).
>> [drm:radeon_device_init] *ERROR* ib ring test failed (-45).
>> [drm] No TV DAC info found in BIOS
>> [drm] Radeon Display Connectors
>> [drm] Connector 0:
>> [drm]   VGA-1
>> [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
>> [drm]   Encoders:
>> [drm]     CRT1: INTERNAL_DAC1
>> [drm] Connector 1:
>> [drm]   DVI-I-1
>> [drm]   HPD1
>> [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
>> [drm]   Encoders:
>> [drm]     CRT2: INTERNAL_DAC2
>> [drm]     DFP1: INTERNAL_TMDS1
>> radeon 0000:e0:02.0: No connectors reported connected with modes
>> [drm] Cannot find any crtc or sizes - going 1024x768
>> [drm] fb mappable at 0xFFFFFFFFF0040000
>> [drm] vram apper at 0xFFFFFFFFF0000000
>> [drm] size 786432
>> [drm] fb depth is 8
>> [drm]    pitch is 1024
>> Console: switching to colour frame buffer device 128x48
>> radeon 0000:e0:02.0: fb0: radeondrmfb frame buffer device
>> radeon 0000:e0:02.0: registered panic notifier
>> [drm] Initialized radeon 2.34.0 20080528 for 0000:e0:02.0 on minor 0
>>
>> There may be some kind of timing issue.  I would swear that it =20
>> didn't take 10s for the "GPU
>> lockup CP stall" message to occur.
>
> Dave,
>
> Passed ring test makes no sense there, as CP isn't working. If =20
> you'll just disable ring test function, you'll get
> absolutely same output (aside of 'ring test succeeded').
> I'm feeling these aren't timings but improperly initialized CP.--

You don't think it ran briefly and crashed?

I have a thought.  The code that loads the microcode appears to be =20
trying to load in 32-bit hunks.  Maybe
we have a 64-bit path on the bus and we need to load the firmware in =20
64-bit words.

Dave
--
John David Anglin	dave.anglin@bell.net



--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

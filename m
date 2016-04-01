From: Helge Deller <deller@gmx.de>
Subject: Re: Kernel hangs with ATI video cards
Date: Fri, 1 Apr 2016 23:38:28 +0200
Message-ID: <56FEEA54.8000909@gmx.de>
References: <CACrbsaApY_w3EcCKnvexqij4fDxedYFvcPVaZPm23wrS+i5HPg@mail.gmail.com>
 <CAFk90B_NF6WZrOHii7F+F1Hb1YE8YxpJ+nTxmO5nhsc=1N=6MQ@mail.gmail.com>
 <CACrbsaAdyUQFSJpq9h859LX5z2Kixr2HJLQvWqeDsBgKRVn00A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Simone Mannori <simone.mannori@gmail.com>,
	Graham Gower <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaAdyUQFSJpq9h859LX5z2Kixr2HJLQvWqeDsBgKRVn00A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01.04.2016 15:11, Simone Mannori wrote:
> Success!
> 
> As you have suggested, I have manually downloaded the package
> 
> --> firmware-linux-nonfree_0.36+wheezy.1_all.deb
> 
> from here:
> 
> https://packages.debian.org/wheezy/all/firmware-linux-nonfree/download
> 
> then I have installed it (as root) with "dpkg -i
> firmware-linux-nonfree_0.36+wheezy.1_all.deb"
> 
> During the installation of the deb package, the initramdisk of the
> kernel has been automatically updated with the proprietary firmware.
> 
> As you have correctly point out, both the previously working NVIDIA
> QUADRO MXR 32M and the actual FileG2 T2
> 
> VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
> RV350 GL [FireGL T2] (rev 80)
> 
> have DRI/OpenGL support in software (no hardware acceleration):
> 
> OpenGL vendor string: Mesa Project
> OpenGL renderer string: Software Rasterizer
> OpenGL version string: 2.1 Mesa 11.1.2
> OpenGL shading language version string: 1.20

That was more or less expected.
 
> This is _very_strange because both "nouveau" and "radeon" should
> support OpenGL / DRI in hardware ! Apparently, they run OK (X11 is OK)
> but they switch to software rendering.

Yes, they should work accelerated.
 
> Question: inside X11 drivers, video card register setting is done
> directly OR via VGA BIOS? In the second case, video card BIOS contains
> x86 code that cannot be executed by pa risc processors (this is the
> reason because the c8000 BIOS include an x86 emulator to set-up the
> video card as console). This is a possible clue to find the source of
> this issue.

Right. The problem is probably that the emulated BIOS does not fully
initializes the card how the Linux kernel driver expects it.
Or, maybe we don't initialize the C8000 chipset correctly so that it
can not handle the ATI card as expected. 

This is the part of the syslog regarding the ATI card on my C8000:

[   32.668000] [drm] radeon kernel modesetting enabled.
[   32.760000] radeon 0000:80:00.0: enabling SERR and PARITY (0187 -> 01c7)
[   32.864000] [drm] initializing kernel modesetting (R300 0x1002:0x4E47 0x1002:0x0152).
[   32.968000] [drm] register mmio base: 0xD0030000
[   33.024000] [drm] register mmio size: 65536
[   33.148000] radeon 0000:80:00.0: putting AGP V3 device into 8x mode
[   33.224000] radeon 0000:80:00.0: GTT: 512M 0x60000000 - 0x7FFFFFFF
[   33.300000] [drm] Generation 1 PCI interface in multifunction mode
[   33.372000] [drm] Limiting VRAM to one aperture
[   33.428000] radeon 0000:80:00.0: VRAM: 256M 0xFFFFFFFFC8000000 - 0xFFFFFFFFD7FFFFFF (256M used)
[   33.532000] [drm] Detected VRAM RAM=256M, BAR=128M
[   33.588000] [drm] RAM width 256bits DDR
[   33.636000] [TTM] Zone  kernel: Available graphics memory: 4107304 kiB
[   33.716000] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   33.792000] [TTM] Initializing pool allocator
[   33.844000] [drm] radeon: 256M of VRAM memory ready
[   33.904000] [drm] radeon: 512M of GTT memory ready.
[   33.968000] [drm] radeon: 2 quad pipes, 1 Z pipes initialized.
[   34.052000] radeon 0000:80:00.0: WB disabled
[   34.104000] radeon 0000:80:00.0: fence driver on ring 0 use gpu addr 0x0000000060000000 and cpu addr 0x0000000011302000
[   34.232000] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   34.312000] [drm] Driver supports precise vblank timestamp query.
[   34.384000] [drm] radeon: irq initialized.
[   34.436000] [drm] Loading R300 Microcode
[   34.936000] radeon 0000:80:00.0: firmware: direct-loading firmware radeon/R300_cp.bin
[   35.044000] [drm] radeon: ring at 0x0000000060001000
[   35.296000] [drm:r100_ring_test [radeon]] *ERROR* radeon: ring test failed (scratch(0x15E4)=0xCAFEDEAD)
[   35.412000] [drm:r100_cp_init [radeon]] *ERROR* radeon: cp isn't working (-22).

^^^ HERE is the problem.
We don't know why the ring test fails.
Debugging it is difficult if you don't are an expert on Radeon cards and C8000 chipsets.
If it would succeed, then I assume we would get accelerated graphics/3D.

[   35.500000] radeon 0000:80:00.0: failed initializing CP (-22).
[   35.568000] radeon 0000:80:00.0: Disabling GPU acceleration

^^^
Again, the kernel says it disables acceleration.

[   35.824000] [drm:r100_cp_fini [radeon]] *ERROR* Wait for CP idle timeout, shutting down CP.
[   35.936000] [drm] radeon: cp finalized
[   35.996000] [drm] radeon: cp finalized
[   36.040000] [TTM] Finalizing pool allocator
[   36.092000] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[   36.156000] [TTM] Zone   dma32: Used memory at exit: 0 kiB
[   36.224000] [drm] radeon: ttm finalized
[   36.268000] [drm] Forcing AGP to PCI mode
[   36.376000] [drm] Generation 1 PCI interface in multifunction mode
[   36.452000] [drm] Limiting VRAM to one aperture
[   36.508000] radeon 0000:80:00.0: VRAM: 256M 0xFFFFFFFFC8000000 - 0xFFFFFFFFD7FFFFFF (256M used)
[   36.612000] radeon 0000:80:00.0: GTT: 512M 0xFFFFFFFFA8000000 - 0xFFFFFFFFC7FFFFFF
[   36.700000] [drm] Detected VRAM RAM=256M, BAR=128M
[   36.760000] [drm] RAM width 256bits DDR
[   36.804000] [TTM] Zone  kernel: Available graphics memory: 4107304 kiB
[   36.884000] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   36.960000] [TTM] Initializing pool allocator
[   37.016000] [drm] radeon: 256M of VRAM memory ready
[   37.072000] [drm] radeon: 512M of GTT memory ready.
[   37.132000] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   37.236000] [drm] radeon: 2 quad pipes, 1 Z pipes initialized.
[   37.304000] [drm] PCI GART of 512M enabled (table at 0x0000000042440000).
[   37.388000] radeon 0000:80:00.0: WB enabled
[   37.436000] radeon 0000:80:00.0: fence driver on ring 0 use gpu addr 0xffffffffa8000000 and cpu addr 0x000000007dc21000
[   37.564000] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   37.644000] [drm] Driver supports precise vblank timestamp query.
[   37.720000] [drm] radeon: irq initialized.
[   37.792000] [drm] radeon: ring at 0xFFFFFFFFA8001000
[   38.048000] [drm:r100_ring_test [radeon]] *ERROR* radeon: ring test failed (scratch(0x15E4)=0xCAFEDEAD)
[   38.164000] [drm:r100_cp_init [radeon]] *ERROR* radeon: cp isn't working (-22).
[   38.252000] radeon 0000:80:00.0: failed initializing CP (-22).
[   38.320000] radeon 0000:80:00.0: Disabling GPU acceleration
[   38.580000] [drm:r100_cp_fini [radeon]] *ERROR* Wait for CP idle timeout, shutting down CP.
[   38.708000] [drm] radeon: cp finalized
[   38.784000] [drm] No TV DAC info found in BIOS
[   38.836000] [drm] Radeon Display Connectors
[   38.888000] [drm] Connector 0:
[   38.924000] [drm]   DVI-I-1
[   38.956000] [drm]   HPD1
[   38.988000] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[   39.060000] [drm]   Encoders:
[   39.096000] [drm]     CRT1: INTERNAL_DAC1
[   39.144000] [drm]     DFP1: INTERNAL_TMDS1
[   39.192000] [drm] Connector 1:
[   39.228000] [drm]   DVI-I-2
[   39.260000] [drm]   HPD2
[   39.292000] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
[   39.364000] [drm]   Encoders:
[   39.400000] [drm]     CRT2: INTERNAL_DAC2
[   39.448000] [drm]     DFP2: INTERNAL_DVO1
[   39.508000] radeon 0000:80:00.0: No connectors reported connected with modes
[   39.596000] [drm] Cannot find any crtc or sizes - going 1024x768
[   39.832000] [drm] fb mappable at 0xFFFFFFFFC8040000
[   39.892000] [drm] vram apper at 0xFFFFFFFFC8000000
[   39.948000] [drm] size 3145728
[   39.984000] [drm] fb depth is 24
[   40.024000] [drm]    pitch is 4096
[   40.068000] Console: switching to colour frame buffer device 128x48
[   40.296000] radeon 0000:80:00.0: fb0: radeondrmfb frame buffer device
[   40.376000] [drm] Initialized radeon 2.43.0 20080528 for 0000:80:00.0 on minor 0

Helge

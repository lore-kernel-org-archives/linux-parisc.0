From: John David Anglin <dave.anglin@bell.net>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Mon, 19 Mar 2018 16:46:07 -0400
Message-ID: <115826d6-d506-f41c-b1f0-84e67a9546a9@bell.net>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box>
 <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
 <b2fd86ec-a83a-5133-fa66-29229595851c@bell.net>
 <CA+QBN9DgtjA3vdE7WA36o8P585r8vMbR+s2zPAF+529HuEzzfw@mail.gmail.com>
 <665cf5f2-35e4-f2ca-7b32-3e5f70ba7acd@bell.net>
 <CA+QBN9A6vgzxvDtvKNqenxFCGOksjgcxo_NHaGLRPsFyfDzL1Q@mail.gmail.com>
 <438edd73-e420-e3d9-df03-610e7dbc2e13@bell.net>
 <CA+QBN9CS11tBCOMKyGvjGF+w9bnd-pvUioSJD=o3AT9pJC=OmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Grant Grundler <grantgrundler@gmail.com>,
 linux-parisc List <linux-parisc@vger.kernel.org>,
 debian-hppa@lists.debian.org
To: Carlo Pisani <carlojpisani@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CA+QBN9CS11tBCOMKyGvjGF+w9bnd-pvUioSJD=o3AT9pJC=OmA@mail.gmail.com>
Resent-Message-ID: <OVLuPkpyA-B.A.RtC.iGCsaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/115826d6-d506-f41c-b1f0-84e67a9546a9@bell.net

This is info about PCI devices that Carlo sent me.  It would help if we 
lnew where 0x4046b840
was in the kernel. From the IIR, 0xf3c001c, it seems the timeout 
occurred on a byte operation.

Dave

On 2018-03-17 2:58 PM, Carlo Pisani wrote:
>> Probably, it would be useful to have verbose output from lspci posted to
>> list as well.
>
> c3600 ~ $ lspci -v
> 00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip
> 21142/43 (rev 41)
>          Subsystem: Hewlett-Packard Company DECchip 21142/43
>          Flags: bus master, medium devsel, latency 255, IRQ 17
>          I/O ports at 1000 [size=128]
>          Memory at fffffffff4008000 (32-bit, non-prefetchable) [size=1K]
>          Expansion ROM at fffffffff4040000 [disabled] [size=256K]
>          Kernel driver in use: tulip
> lspci: Unable to load libkmod resources: error -12
>
> 00:0d.0 Multimedia audio controller: Analog Devices Device 1889
>          Subsystem: Analog Devices Device 1889
>          Flags: bus master, medium devsel, latency 255, IRQ 18
>          Memory at fffffffff400c000 (32-bit, prefetchable) [size=512]
>          Memory at fffffffff400b000 (32-bit, prefetchable) [size=16]
>          Memory at fffffffff400a000 (32-bit, prefetchable) [size=16]
>          Memory at fffffffff4009000 (32-bit, prefetchable) [size=16]
>          Capabilities: [dc] Power Management version 1
>          Kernel driver in use: snd_ad1889
>
> 00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560
> IDE (rev 03) (prog-if 8f [Master SecP SecO PriP PriO])
>          Flags: bus master, medium devsel, latency 255, IRQ 7
>          I/O ports at 0f00 [size=8]
>          I/O ports at 0e00 [size=4]
>          I/O ports at 0d00 [size=8]
>          I/O ports at 0b00 [size=4]
>          I/O ports at 0a00 [size=16]
>          Kernel driver in use: NS87415_IDE
>
> 00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev 01)
>          Flags: bus master, medium devsel, latency 255, IRQ 19
>          Kernel driver in use: SuperIO
>
> 00:0e.2 USB controller: National Semiconductor Corporation USB
> Controller (rev 02) (prog-if 10 [OHCI])
>          Flags: bus master, medium devsel, latency 240, IRQ 1
>          Memory at fffffffff4007000 (32-bit, non-prefetchable) [size=4K]
>          Memory at fffffffff4006000 (32-bit, non-prefetchable) [size=4K]
>          Kernel driver in use: ohci-pci
>
> 00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53C896/897 (rev 07)
>          Subsystem: LSI Logic / Symbios Logic LSI53C896/7 PCI to Dual
> Channel Ultra2 SCSI Multifunction Controller
>          Flags: bus master, medium devsel, latency 255, IRQ 20
>          I/O ports at 0900 [size=256]
>          Memory at fffffffff4005000 (64-bit, non-prefetchable) [size=1K]
>          Memory at fffffffff4002000 (64-bit, non-prefetchable) [size=8K]
>          Capabilities: [40] Power Management version 2
>          Kernel driver in use: sym53c8xx
>
> 00:0f.1 SCSI storage controller: LSI Logic / Symbios Logic 53C896/897 (rev 07)
>          Subsystem: LSI Logic / Symbios Logic LSI53C896/7 PCI to Dual
> Channel Ultra2 SCSI Multifunction Controller
>          Flags: bus master, medium devsel, latency 255, IRQ 20
>          I/O ports at 0800 [size=256]
>          Memory at fffffffff4004000 (64-bit, non-prefetchable) [size=1K]
>          Memory at fffffffff4000000 (64-bit, non-prefetchable) [size=8K]
>          Capabilities: [40] Power Management version 2
>          Kernel driver in use: sym53c8xx
>
> 01:05.0 RAID bus controller: VIA Technologies, Inc. VT6421 IDE/SATA
> Controller (rev 50)
>          Subsystem: VIA Technologies, Inc. VT6421 IDE/SATA Controller
>          Flags: bus master, medium devsel, latency 240, IRQ 21
>          I/O ports at 12500 [size=16]
>          I/O ports at 12400 [size=16]
>          I/O ports at 12300 [size=16]
>          I/O ports at 12200 [size=16]
>          I/O ports at 12100 [size=32]
>          I/O ports at 12000 [size=256]
>          Expansion ROM at fffffffff4800000 [disabled] [size=64K]
>          Capabilities: [e0] Power Management version 2
>          Kernel driver in use: sata_via
>

The requesting device was 10/1/5/0.

From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: C8000 / PA8800 64-bit SMP with kernel 3.11.0 - HPMC in
 cpu_startup_entry while setting promiscuous mode on eth
Date: Fri, 13 Sep 2013 09:49:56 -0700
Message-ID: <1379090996.2198.3.camel@dabdike.int.hansenpartnership.com>
References: <20130913182705.6d8471ae@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130913182705.6d8471ae@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-09-13 at 18:27 +0200, Jeroen Roovers wrote:
> Resending since it apparently never got through (binary attachment?)...
> 
> While running tcpdump or wireshark (dumpcap) and setting promiscuous
> mode on eth0, I get an HPMC in cpu_startup_entry.
> 
> Attached are the:
> 
> 1) PDC output for PIM(1) and assorted information
>    gathered from the PDC SER menu and the serial console
> 2) gzipped System.map of the kernel
> 3) .config of the kernel
> 
> 40:01.0 SCSI storage controller: LSI Logic / Symbios Logic 53c1030
> PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 07)
> 40:01.1 SCSI storage controller: LSI Logic / Symbios Logic 53c1030
> PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 07)
> 60:01.0 USB controller: NEC Corporation OHCI USB Controller (rev 41)
> 60:01.1 USB controller: NEC Corporation OHCI USB Controller (rev 41)
> 60:01.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller
> (rev 02)
> 60:02.0 IDE interface: Silicon Image, Inc. PCI0680 Ultra ATA-133 Host
> Controller (rev 02)
> 60:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet
> Controller (rev 02)
> 80:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] RV350 GL [FireGL T2] (rev 80)
> 
> What else to say? 

Translation of the kernel addresses from %rp (0x4018eb0c), and the two
IAOQ entries (0x0, 0x4018eb24).  Since the first IAOQ entry is zero,
whatever is at the second seemed to trigger a jump to a NULL pointer.

James



Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 13 Oct 2003 13:34:43 +0200
Message-ID: <3F8A272E0000052B@ocpmta3.freegates.net>
In-Reply-To: <3F892DC8.30307@tiscali.be>
From: "Joel Soete" <soete.joel@tiscali.be>
To: willy@parisc-linux.org
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 willy
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

Matthew,

2.6.0-test7-pa6 boot well on my b180:
[...]
eth0: Digital DS21143 Tulip rev 65 at 0xff00, 00:10:83:35:2A:A9, IRQ 96.
sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18f
Using anticipatory io scheduler
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:5:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
st: Version 20030811, fixed bufsize 32768, s/g segs 256
sym0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 >
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 sdb10 >
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 6, lun 0,  type 0
[...]

I trust that confirm it well uses 'scsi0 : sym-2.1.18f' :)

I run successfully ssh, multi-gnome-terminal, gkrellm and mainly recompile
this kernel with gcc-3.3.2 (20030908). All seems to work fine: uptime 2h25min
:)

Congratulation,
    Joel

>-- Original Message --
>Date: Sun, 12 Oct 2003 10:32:40 +0000
>From: Joel Soete <soete.joel@tiscali.be>
>To:  willy@parisc-linux.org
>Subject: Re: [parisc-linux-cvs] linux-2.6 willy
>
>
>Matthew Wilcox wrote:

>CVSROOT:	/var/cvs
>Module name:	linux-2.6
>Changes by:	willy	03/10/10 13:59:56
>
>Modified files:
>	.              : Makefile 
>
>Log message:
>2.6.0-test7-pa5:
>2.1.18f of the sym driver.  I want people to test this 
>ne.
>  
>
Ok Matthew, I will test it on my b180 on monday

hth,
    Joel





-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 

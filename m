Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA18120
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Sep 2000 13:03:12 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39BCF7FE.E6E0EA3@uswest.net>
Date: Mon, 11 Sep 2000 09:19:26 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: rstickel@mindspring.com
CC: parisc-linux@thepuffingroup.com
Subject: [Fwd: [parisc-linux] Bug report]
Content-Type: multipart/mixed;
 boundary="------------EF58A87E4F8EE11A82334529"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------EF58A87E4F8EE11A82334529
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hmm...

I sent this message out last friday, but I haven't seen it show up in my email
box.

So.... here goes again :)

- Ryan
Ryan Bradetich wrote:

> Robert,
>
> I have problems booting the 735/755 when the kernel is built with
> lasi/asp option enabled (it is enabled in the default config).  If I diable
> this option, I can boot the 735/755 to a root prompt.
>
> I do not know if the kernel on the CD was built with this option, but
> you could build a newer kernel with this option diabled and try it
> for the 710.
>
> Hope this helps,
>
> -Ryan
>
> P.S. This is on my TODO list to fix after I work on the U2/UTurn
> code.  If someone else is interested in taking a look at it, let me know
> and I'll pass on the little bit of information I have about this problem.
>
> Robert Stickel wrote:
>
> > Hello,
> >
> > The good news: We are really excited about the Puffin project.
> >
> > The bad news: We tried to boot an Apollo 9000/710 on your PA/Linux
> > Developer's
> > Release CD, Version 0.1 - Snapshot 2000/08/04 and never quite got to a
> > root
> > prompt (see transcript below).  Should this be possible or are we
> > missing
> > something?
> >
> > Thanks for any advice,
> >
> > rstickel@mindspring.com
> > sts@minitower.gtri.gatech.edu
> >
> > Transcript of attempt to boot Apollo 9000/710 on Puffin CD.  At the
> > request_irq(259, c01ec76c, 0x0, asp, c3fcd080)
> > line the systems hangs.
> >
> > (c) Copyright.  Hewlett-Packard Company.  1991.
> > All rights reserved.
> >
> > PDC ROM rev. 2.0
> > IODC ROM rev. 2.0
> > 64 MB of memory configured and tested.
> >
> > Selecting a system to boot.
> > To stop selection process, press and hold the ESCAPE key.
> >
> > Selection process stopped.
> >
> > Searching for Potential Boot Devices.
> > To terminate search, press and hold the ESCAPE key.
> >
> > Device Selection      Device Path              Device Type
> > ----------------------------------------------------------------------------
> >
> > P0                    scsi.6.0                 MATSHITACD-ROM CR-8005A
> > P1                    scsi.5.0                 IOMEGA  ZIP 100
> > P2                    scsi.4.0                 iomega  jaz 1GB
> > P3                    scsi.3.0                 SEAGATE ST11200N SUN1.05
> > P4                    scsi.2.0                 SEAGATE ST31230N
> > P5                    scsi.1.0                 IBM     0662
> >
> > b)    Boot from specified device
> > s)    Search for bootable devices
> > a)    Enter Boot Administration mode
> > x)    Exit and continue boot sequence
> > ?)    Help
> >
> > Select from menu: a
> > BOOT_ADMIN> info
> > ----------------------------- Hardware Configuration
> > ------------------------
> >
> > Machine model: 9000/710
> >
> > Processor Frequency        = 50000000 Hz
> > I/O Subsystem Frequency    = 25000000 Hz
> >
> > LAN Jumper Status: Internal ThinLAN Port selected
> >
> > Processor Revision                  = 3
> > System Controller Revision          = 0
> > Floating Point Coprocessor Revision = 3
> >
> > Hardware Version            12288     (0x00003000)
> > Software Version             1153     (0x00000481)
> >
> > BOOT_ADMIN> boot alt
> >
> > Trying scsi.6.0
> > Boot path initialized.
> > Attempting to load IPL.
> >
> > Hard booted.
> > palo ipl bame@noam Fri Aug  4 18:36:35 MDT 2000
> > 0/vmlinux 2349352 bytes @ 0x6e8800
> > 0/palo-cmdline '0/vmlinux TERM=linux HOME=/ root=/dev/scd0'
> > Kernel: partition 0 file /vmlinux
> > ELF32 executable
> >
> > Entry 00100000 first 00100000 n 4
> > Segment 0 load 00100000 size 1511580 mediaptr 0x1000
> > Segment 1 load 00272000 size 132368 mediaptr 0x173000
> > Segment 2 load 00294000 size 86880 mediaptr 0x194000
> > Segment 3 load 002ac000 size 8192 mediaptr 0x1aa000
> > branching to kernel entry point 0x00100000
> > pdc_cons registered !
> > The Kernel has started...
> > Free memory starts at: 0xc02dc000
> > PALO command line: 'TERM=linux HOME=/ root=/dev/scd0'
> > PALO initrd 0-0
> > FP CCR was 0x0, will be set to 0xc0
> > model   00003000 00000481 00000000 00000000 78243572 00000000 00000004
> > 0000000d 00000000
> > vers    00000003
> > CPUID vers 0 rev 0
> > CPU(s): 1 x PA7000 at 50.000000 MHz
> > Searching for devices in PDC firmware...  an older box...
> > Found devices:
> > 1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0,
> > 0x77, 0x0, 0x0
> > 2. Bushmaster Core BA (11) at 0xf082f000, versions 0x6, 0x0, 0x70, 0x0,
> > 0x0
> > 3. Bushmaster Core SCSI (10) at 0xf0825000, versions 0x6, 0x0, 0x71,
> > 0x0, 0x0
> > 4. Bushmaster Core LAN (802.3) (10) at 0xf0826000, versions 0x6, 0x0,
> > 0x72, 0x0, 0x0
> > 5. Bushmaster Core HIL (10) at 0xf0821000, versions 0x6, 0x0, 0x73, 0x0,
> > 0x0
> > 6. Bushmaster Core RS-232 (10) at 0xf0823000, versions 0x6, 0x0, 0x75,
> > 0x0, 0x0
> > 7. Bushmaster Core RS-232 (10) at 0xf0822000, versions 0x6, 0x0, 0x75,
> > 0x0, 0x0
> > 8. Bushmaster Core Centronics (10) at 0xf0824000, versions 0x6, 0x0,
> > 0x74, 0x0, 0x0
> > 9. Bushmaster Audio (10) at 0xf1000000, versions 0x6, 0x0, 0x7a, 0x0,
> > 0x0
> > 10. Bushmaster (710) (0) at 0xfffbe000, versions 0x300, 0x0, 0x4, 0x0,
> > 0x81
> > 11. Bushmaster (1) at 0xfffbf000, versions 0x16, 0x0, 0x9, 0x0, 0x0
> > That's a total of 11 devices.
> > Linux version 2.3.99-pre8 (bame@noam) (gcc version 2.96 20000707
> > (experimental)) #24 Fri Aug 4 18:27:58 MDT 2000
> > initrd: 00000000-00000000
> > pagetable_init
> > On node 0 totalpages: 16384
> > zone(0): 8192 pages.
> > zone(1): 8192 pages.
> > zone(2): 0 pages.
> > trap_init
> > Calibrating delay loop... 46.08 BogoMIPS
> > Memory: 61380k available
> > Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
> > Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
> > Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
> > kmem_create: Poisoning requested, but con given - bdev_cache
> > Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
> > kmem_create: Poisoning requested, but con given - inode_cache
> > POSIX conformance testing by UNIFIX
> > ASP version 1 at 0xf0800000 found.
> > request_irq(259, c01ec76c, 0x0, asp, c3fcd080)
> >
> > ---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.

--------------EF58A87E4F8EE11A82334529
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <39B99ABE.A1E2597F@uswest.net>
Date: Fri, 08 Sep 2000 20:04:47 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
X-Mailer: Mozilla 4.73 [en] (X11; U; Linux 2.4.0-test2 i686)
X-Accept-Language: en
MIME-Version: 1.0
To: Robert Stickel <rstickel@mindspring.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Bug report
References: <39B935EE.EEEC23BE@mindspring.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Robert,

I have problems booting the 735/755 when the kernel is built with
lasi/asp option enabled (it is enabled in the default config).  If I diable
this option, I can boot the 735/755 to a root prompt.

I do not know if the kernel on the CD was built with this option, but
you could build a newer kernel with this option diabled and try it
for the 710.

Hope this helps,

-Ryan

P.S. This is on my TODO list to fix after I work on the U2/UTurn
code.  If someone else is interested in taking a look at it, let me know
and I'll pass on the little bit of information I have about this problem.


Robert Stickel wrote:

> Hello,
>
> The good news: We are really excited about the Puffin project.
>
> The bad news: We tried to boot an Apollo 9000/710 on your PA/Linux
> Developer's
> Release CD, Version 0.1 - Snapshot 2000/08/04 and never quite got to a
> root
> prompt (see transcript below).  Should this be possible or are we
> missing
> something?
>
> Thanks for any advice,
>
> rstickel@mindspring.com
> sts@minitower.gtri.gatech.edu
>
> Transcript of attempt to boot Apollo 9000/710 on Puffin CD.  At the
> request_irq(259, c01ec76c, 0x0, asp, c3fcd080)
> line the systems hangs.
>
> (c) Copyright.  Hewlett-Packard Company.  1991.
> All rights reserved.
>
> PDC ROM rev. 2.0
> IODC ROM rev. 2.0
> 64 MB of memory configured and tested.
>
> Selecting a system to boot.
> To stop selection process, press and hold the ESCAPE key.
>
> Selection process stopped.
>
> Searching for Potential Boot Devices.
> To terminate search, press and hold the ESCAPE key.
>
> Device Selection      Device Path              Device Type
> ----------------------------------------------------------------------------
>
> P0                    scsi.6.0                 MATSHITACD-ROM CR-8005A
> P1                    scsi.5.0                 IOMEGA  ZIP 100
> P2                    scsi.4.0                 iomega  jaz 1GB
> P3                    scsi.3.0                 SEAGATE ST11200N SUN1.05
> P4                    scsi.2.0                 SEAGATE ST31230N
> P5                    scsi.1.0                 IBM     0662
>
> b)    Boot from specified device
> s)    Search for bootable devices
> a)    Enter Boot Administration mode
> x)    Exit and continue boot sequence
> ?)    Help
>
> Select from menu: a
> BOOT_ADMIN> info
> ----------------------------- Hardware Configuration
> ------------------------
>
> Machine model: 9000/710
>
> Processor Frequency        = 50000000 Hz
> I/O Subsystem Frequency    = 25000000 Hz
>
> LAN Jumper Status: Internal ThinLAN Port selected
>
> Processor Revision                  = 3
> System Controller Revision          = 0
> Floating Point Coprocessor Revision = 3
>
> Hardware Version            12288     (0x00003000)
> Software Version             1153     (0x00000481)
>
> BOOT_ADMIN> boot alt
>
> Trying scsi.6.0
> Boot path initialized.
> Attempting to load IPL.
>
> Hard booted.
> palo ipl bame@noam Fri Aug  4 18:36:35 MDT 2000
> 0/vmlinux 2349352 bytes @ 0x6e8800
> 0/palo-cmdline '0/vmlinux TERM=linux HOME=/ root=/dev/scd0'
> Kernel: partition 0 file /vmlinux
> ELF32 executable
>
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 1511580 mediaptr 0x1000
> Segment 1 load 00272000 size 132368 mediaptr 0x173000
> Segment 2 load 00294000 size 86880 mediaptr 0x194000
> Segment 3 load 002ac000 size 8192 mediaptr 0x1aa000
> branching to kernel entry point 0x00100000
> pdc_cons registered !
> The Kernel has started...
> Free memory starts at: 0xc02dc000
> PALO command line: 'TERM=linux HOME=/ root=/dev/scd0'
> PALO initrd 0-0
> FP CCR was 0x0, will be set to 0xc0
> model   00003000 00000481 00000000 00000000 78243572 00000000 00000004
> 0000000d 00000000
> vers    00000003
> CPUID vers 0 rev 0
> CPU(s): 1 x PA7000 at 50.000000 MHz
> Searching for devices in PDC firmware...  an older box...
> Found devices:
> 1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0,
> 0x77, 0x0, 0x0
> 2. Bushmaster Core BA (11) at 0xf082f000, versions 0x6, 0x0, 0x70, 0x0,
> 0x0
> 3. Bushmaster Core SCSI (10) at 0xf0825000, versions 0x6, 0x0, 0x71,
> 0x0, 0x0
> 4. Bushmaster Core LAN (802.3) (10) at 0xf0826000, versions 0x6, 0x0,
> 0x72, 0x0, 0x0
> 5. Bushmaster Core HIL (10) at 0xf0821000, versions 0x6, 0x0, 0x73, 0x0,
> 0x0
> 6. Bushmaster Core RS-232 (10) at 0xf0823000, versions 0x6, 0x0, 0x75,
> 0x0, 0x0
> 7. Bushmaster Core RS-232 (10) at 0xf0822000, versions 0x6, 0x0, 0x75,
> 0x0, 0x0
> 8. Bushmaster Core Centronics (10) at 0xf0824000, versions 0x6, 0x0,
> 0x74, 0x0, 0x0
> 9. Bushmaster Audio (10) at 0xf1000000, versions 0x6, 0x0, 0x7a, 0x0,
> 0x0
> 10. Bushmaster (710) (0) at 0xfffbe000, versions 0x300, 0x0, 0x4, 0x0,
> 0x81
> 11. Bushmaster (1) at 0xfffbf000, versions 0x16, 0x0, 0x9, 0x0, 0x0
> That's a total of 11 devices.
> Linux version 2.3.99-pre8 (bame@noam) (gcc version 2.96 20000707
> (experimental)) #24 Fri Aug 4 18:27:58 MDT 2000
> initrd: 00000000-00000000
> pagetable_init
> On node 0 totalpages: 16384
> zone(0): 8192 pages.
> zone(1): 8192 pages.
> zone(2): 0 pages.
> trap_init
> Calibrating delay loop... 46.08 BogoMIPS
> Memory: 61380k available
> Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
> Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
> kmem_create: Poisoning requested, but con given - bdev_cache
> Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
> kmem_create: Poisoning requested, but con given - inode_cache
> POSIX conformance testing by UNIFIX
> ASP version 1 at 0xf0800000 found.
> request_irq(259, c01ec76c, 0x0, asp, c3fcd080)
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.


--------------EF58A87E4F8EE11A82334529--

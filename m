Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from b101-144c-01.mek.dtu.dk (unknown [130.226.16.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2BBF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 06:56:44 -0600 (MDT)
Sender: boco@b101-144c-01.mek.dtu.dk
Message-ID: <3B9CB844.E657991F@mek.dtu.dk>
Date: Mon, 10 Sep 2001 14:55:32 +0200
From: Boyan Lazarov <bsl@mek.dtu.dk>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installing on Apollo 735
References: <3B9BA35D.9A02DD98@mek.dtu.dk> <20010910083204.P19441@linuxcare.com> <3B9C73CF.412C929@mek.dtu.dk> <20010910103658.T19441@linuxcare.com> <3B9CAC65.E1096C44@mek.dtu.dk> <20010910134134.V19441@linuxcare.com>
Content-Type: text/plain; charset=x-user-defined
List-ID: <linux-parisc.vger.kernel.org>

The same problem as before.
The cd-rom is on the scsi bus , can this be the problem.
At the beginning the kernel gives message for the devices and it
recognizes two scsi 
3. Outfield Core SCSI (10) at 0xf0825000, versions 0x9, 0x0, 0x71, 0x0,
0x04
9. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0,
0x0
but the second one is not configured.

Regards
Boyan

Richard Hirst wrote:
> 
> On Mon, Sep 10, 2001 at 02:04:53PM +0200, Boyan Lazarov wrote:
> > The system just stop
> > The boot parameters are :
> > 0: 0/vmlinux
> >  1: root=/dev/ram
> >  2: initrd=0/ramdisk
> >  3: console=ttyS0
> >  4: TERM=vt102
> >  5: sim700=noneg:0xff,nodisc:0xff
> >  6: isl
> >
> > And the output is:
> > SCSI subsystem driver Revision: 1.00
> > sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
> > scsi0: Revision 0x0
> > scsi0: test 1 completed ok.
> > scsi0 : LASI/Simple 53c7xx
> >   Vendor: PLEXTOR   Model: CD-ROM PX-32TS    Rev: 1.02
> >   Type:   CD-ROM                             ANSI SCSI revision: 02
> > scsi0: Unable to abort command for target 5
> > scsi0: Unable to send Bus Device Reset for target 5
> > scsi0: Unable to do SCSI bus reset
> > scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> > scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
> > scsi0: dsp = 07875060 (script[0x1418]), dsps = 078751f0, target = 0
> > scsi0: Failing command for ID5
> >   Vendor: SEAGATE   Model: ST31200N          Rev: 8714
> >   Type:   Direct-Access                      ANSI SCSI revision: 02
> > Detected scsi disk sda at scsi0, channel 0, id 6, lun 0
> >
> > After this the system just stops
> 
> That's not good.  Can you try with just   sim700=nodisc:0xff
> please.
> 
> Richard

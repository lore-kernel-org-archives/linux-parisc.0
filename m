Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA06603
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 23:03:21 -0700
From: Marko.T.Niskanen@nokia.com
Received: from esvir07nok.ntc.nokia.com (esvir07nok.nokia.com [131.228.20.79])
	by mgw-x3.nokia.com (8.10.2/8.10.2/Nokia) with ESMTP id eBC654B15113
	for <parisc-linux@thepuffingroup.com>; Tue, 12 Dec 2000 08:05:04 +0200 (EET)
Message-ID: <13F0486DB51CD311A0AE0008C7C561380453D431@eseis11nok>
To: parisc-linux@thepuffingroup.com
Cc: adevries@linuxcare.com
Subject: RE: [parisc-linux] 712/60 booting problem
Date: Tue, 12 Dec 2000 08:05:00 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi

Sorry I have no boot log, because linux doesn't start and I have no idea how
to get it an another way.  after text on console "switching from PDC
console", I can read from serial port: 

kmem_create: Forcing size word alignment - nfs_fh VFS: Mounted root (ext2
filesystem) readonly. !!die_if_kernel: init(1): Illegal instruction 8

and after that starts that "loop" 

ORIG_R28: 4001ad7c

handle_interruption() pid=1 command='init'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011000000000000001011
r0-3     00000000 40136c24 400462f7 40136c1c
r4-7     40138c38 2001ff2c 2001ff24 00000001
r8-11    2001ff2c 2001ff24 00000001 4001ada0
r12-15   4001ad7c 00000000 00000000 00000000
r16-19   c3fc4000 c028060c 00000000 40138c38
r20-23   4013d754 4013ac38 400540bc 40136290
r24-27   2001ff2c 2001ff24 00000001 c0145da8
r28-31   40019450 4013a438 20020180 400462f7
sr0-4    00000000 00002000 00000000 00002000
sr4-8    00002000 00002000 00002000 00002000

...and so on..

Marko

> -----Original Message-----
> From: EXT Alex deVries [mailto:adevries@linuxcare.com]
> Sent: 12 December, 2000 6:46
> To: Marko.T.Niskanen@nokia.com; parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] 712/60 booting problem
> 
> 
> Alex deVries wrote:
> > 
> > Marko.T.Niskanen@nokia.com wrote:
> > >
> > > hello
> > >
> > > after installing from palinux-0.5.iso.gz on cd and during 
> booting I can get
> > > this kind error
> > 
> > Okay.  You've got to give us some sort of clue as to what kind of
> > machine that is, because I can't guess.
> 
> What a silly question, since you mentioned it in your subject it was a
> 712/80.
> 
> Where do you get the problem?  Do you have a bootlog for us?
> 
> - Alex
> 
> 
> -- 
> Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
> 613.562.2759 tel
> alex@linuxcare.com, http://www.linuxcare.com/
> Linuxcare, Support for the revolution.
> 
> --------------------------------------------------------------
> -------------
> To unsubscribe: send e-mail to 
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

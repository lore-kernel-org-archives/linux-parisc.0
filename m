Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC5264895
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 07:37:16 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F9@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Status of hp-ux binary compatibility?
Date: Mon, 1 Oct 2001 08:35:52 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

FYI, here's one of the oops:

do_page_fault() pid=481 command='cal' type=6 address=0xc0000007
vm_start = 0x40001000, vm_end = 0x40002000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111
r0-3     00000000 c0000000 0000274f faf00000
r4-7     00000001 faf001e8 faf00194 00000000
r8-11    faf00280 000aa810 000b8910 000b86f0
r12-15   00000000 ffffffff 000b81b0 00000000
r16-19   00000000 00017800 00017800 4024c57c
r20-23   0000000b 401b071c 00000039 00000000
r24-27   00000000 00000000 faf02290 40001448
r28-31   00000000 00000000 faf02300 0000286f
sr0-3    00000725 00000000 00000000 00000725
sr4-7    00000725 00000725 00000725 00000725

IASQ: 00000725 00000725 IAOQ: c0000007 c000000b
 IIR: e02025b2    ISR: 00000725  IOR: faf0226c
 CPU:        0   CR30: 2734c000 CR31: 10388000
 ORIG_R28: 000b8950

do_page_fault() pid=482 command='echo' type=6 address=0xc0000007
vm_start = 0x40001000, vm_end = 0x40002000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111
r0-3     00000000 c0000000 000024df faf00000
r4-7     00000001 faf001ec faf00198 00000000
r8-11    faf00280 000aa810 000b8910 000b8850
r12-15   00000000 ffffffff 000b8370 00000000
r16-19   00000000 00017800 00017800 4024c57c
r20-23   0000000b 401b071c 00000039 00000000
r24-27   00000000 00000000 faf02290 40001150
r28-31   00000000 00000000 faf02300 000025ff
sr0-3    00000004 00000000 00000000 00000004
sr4-7    00000004 00000004 00000004 00000004

IASQ: 00000004 00000004 IAOQ: c0000007 c000000b
 IIR: e02025b2    ISR: 00000004  IOR: faf0226c
 CPU:        0   CR30: 2734c000 CR31: 10388000
 ORIG_R28: 000b84b0

-- Nathan



> -----Original Message-----
> From: Neulinger, Nathan 
> Sent: Monday, October 01, 2001 8:31 AM
> To: 'Matthew Wilcox'
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: RE: [parisc-linux] Status of hp-ux binary compatibility?
> 
> 
> In particular - flexlm. 
> 
> We have a ton of licensed products served off an old 715, and 
> relicensing them to move the license server will be a 
> nightmare. What I'd like to do is run the lmgrd+vendor-daemon 
> on a parisc-linux box and modload a syscall replacement that 
> lies about the hostid to this process.
> 
> But for testing, I've just tried very simple programs - cal, 
> yes, echo, and a staticly linked hello world. All of them 
> segfault right after execution. 
> 
> As far as I know, the only system calls out of the ordinary 
> the flexlm stuff should use are file locking and perhaps some 
> of the ioctl stuff for getting interface address, but I 
> figured on tracing to find out exactly what it's doing. 
> 
> -- Nathan
> 
> > -----Original Message-----
> > From: Matthew Wilcox [mailto:willy@debian.org]
> > Sent: Monday, October 01, 2001 8:26 AM
> > To: Nathan Neulinger
> > Cc: Matthew Wilcox; parisc-linux@lists.parisc-linux.org
> > Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
> > 
> > 
> > On Mon, Oct 01, 2001 at 07:47:45AM -0500, Nathan Neulinger wrote:
> > > Yuck... That'd be most unfortunate since that is the 
> > primary reason I'm
> > > looking at parisc-linux at the moment.
> > 
> > what application specifically are you looking at running?  We 
> > only ever
> > implemented a few of the hundreds of hpux syscalls.
> > 
> > -- 
> > Revolutions do not require corporate support.
> > 
> 

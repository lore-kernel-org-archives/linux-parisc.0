From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Mon, 2 May 2005 16:20:49 -0400 (EDT)
Message-ID: <200505022020.j42KKoGn000593@hiauly1.hia.nrc.ca>
References: <200505021901.j42J1twk000106@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505021901.j42J1twk000106@hiauly1.hia.nrc.ca> from "John David
	Anglin" at May 2, 2005 03:01:55 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > sr0-3   0000000000bc8800 0000000000000000 0000000000000000 0000000000bc8800
> > sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > 
> > IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101b22e4 00000000101b22e8
> >   IIR: 0ed5d240    ISR: 0000000000bc8800  IOR: 000000000002e4fe
> >   CPU:        0   CR30: 000000001f3ec000 CR31: 0000000010584000
> >   ORIG_R28: 000000001010e400
> >   IAOQ[0]: sys_poll+0x274/0x298
> >   IAOQ[1]: sys_poll+0x278/0x298
> >   RP(r2): sys_poll+0x17c/0x298
> > 
> >   # disasm 0ed5d240
> >     0:   0e d5 d2 40     sth r21,0(sr3,r22)
> 
> Where did this address come from?  IAOQ[0] = 0x101b22e4.

Sorry, this is the faulting instruction.  However, this isn't much help.
This isn't GCC code (GCC doesn't generate code using sr3).  It's part of
a syscall asm.  The value in sr3 seems wierd.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

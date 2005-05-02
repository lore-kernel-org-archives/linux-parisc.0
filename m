From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Mon, 2 May 2005 16:46:26 -0400 (EDT)
Message-ID: <200505022046.j42KkQnh000694@hiauly1.hia.nrc.ca>
References: <200505022020.j42KKoGn000593@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505022020.j42KKoGn000593@hiauly1.hia.nrc.ca> from "John David
	Anglin" at May 2, 2005 04:20:49 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > >   IAOQ[0]: sys_poll+0x274/0x298
> > >   IAOQ[1]: sys_poll+0x278/0x298
> > >   RP(r2): sys_poll+0x17c/0x298
> > > 
> > >   # disasm 0ed5d240
> > >     0:   0e d5 d2 40     sth r21,0(sr3,r22)
> > 
> > Where did this address come from?  IAOQ[0] = 0x101b22e4.
> 
> Sorry, this is the faulting instruction.  However, this isn't much help.
> This isn't GCC code (GCC doesn't generate code using sr3).  It's part of
> a syscall asm.  The value in sr3 seems wierd.

The problem code is in fs/select.c:

                for (j=0; j < walk->len; j++, ufds++) {
			if(__put_user(fds[j].revents, &ufds->revents))
				goto out_fds;
		}

The sth is in the __put_user code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Mon, 8 Jan 2007 09:25:48 -0500 (EST)
Message-ID: <200701081425.l08EPnjM001271__21132.8706740916$1416624257$gmane$org@hiauly1.hia.nrc.ca>
References: <7d01f9f00701080531j1f464ebav3b3024beaa814c29@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701080531j1f464ebav3b3024beaa814c29@mail.gmail.com>
	from "Thibaut VARENE" at Jan 8, 2007 02:31:20 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > The console log / short story is here:
> > > http://www.pateam.org/archive/dumps/sshd-code27
> >
> > This appears to be the same problem as I'm having killing hung
> > java processes.

I managed to get gdb backtraces for the hung java processes yesterday.
It looks like the hang could be a result of the clone bug in glibc.
clone is used in thread creation.

Of course, this doesn't explain why killing the processes crashes the
system.

>  IAOQ[1]: sys_poll+0x1f8/0x218
>  RP(r2): sys_poll+0x120/0x218

I've seen an infinite loop in sys_poll as well.

I agree the problem has been around for a long time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

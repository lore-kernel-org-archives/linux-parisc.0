From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] nscd: error while loading shared libraries:
Date: Tue, 27 Dec 2005 13:15:01 -0500 (EST)
Message-ID: <200512271815.jBRIF1rH022390@hiauly1.hia.nrc.ca>
References: <200512270014.45080.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512270014.45080.vapier@gentoo.org> from "Mike Frysinger" at
	Dec 27, 2005 00:14:45 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> this is because Redhat forces all network daemons to be built at PIEs ... thus 
Sometimes I think Redhat enjoys making life difficult for the systems
they don't support.

> glibc will build nscd as a PIE by default ... and since PIE doesnt work on 
> parisc just yet, you see fun errors like the above
> 
> here's the hack patch i wrote Gentoo/hppa:
> http://viewcvs.gentoo.org/sys-libs/glibc/files/2.3.4/hppa-no-pie.patch

As far as GCC goes on the PA, -fpie should be equivalent to -fpic and
this should be ok for executables.  The main issue is the linker -pie
support, and the corresponding libc and kernel (?) support needed for PIE.

A small patch could be done to disable -fpie on the PA in GCC.  PIE is
definitely not supported under hpux, so this seems like a good idea.  I
could also kill the linker flag.  However, it doesn't look like this
will fix all the nscd/Makefile issues.

> good news though, when i mentioned this before:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2005-July/026865.html
> people said it's in the works to be fixed :)

It seems this issue has fallen through the cracks.  I know Carlos has
been busy finishing up his thesis.  The relocation problem is a separate
issue from PIE support as it could arise independently.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

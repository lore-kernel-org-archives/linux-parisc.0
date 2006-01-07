From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: qt-x11-free build fails
Date: Sat, 7 Jan 2006 14:27:15 -0500 (EST)
Message-ID: <200601071927.k07JRGbe020121__47984.4625261196$1416623978$gmane$org@hiauly1.hia.nrc.ca>
References: <200601071849.k07InFlv019952@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: grundler@parisc-linux.org,
 342545@bugs.debian.org,
 jbailey@debian.org,
 lamont@debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 341675@bugs.debian.org,
 tausq@debian.org,
 debian-release@lists.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200601071849.k07InFlv019952@hiauly1.hia.nrc.ca> from "John David Anglin" at Jan 7, 2006 01:49:15 pm
Resent-Message-ID: <3OHSC.A.op.IpBwDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> There isn't a lot of info in #342545.  However, I suspect from the
> following comment
> 
> > It would be nice if somebody fluent with hppa assembly can tell us if 
> 
> >       fldw -10(,sp),fr23
> 
> that this is the same bug as reported here:
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=20754.

Changed my mind based on the discussion in
http://lists.debian.org/debian-hppa/2006/01/msg00001.html.  The only
way that the above instruction can cause an invalid exception is

  The current instruction is a load of the destination register of
  a pending, trapping instruction (see page 10-5 of arch, delayed
  traps).

The instruction can cause the usual memory faults (i.e., check value
in sp).  In either case, the real problem is somewhere else.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

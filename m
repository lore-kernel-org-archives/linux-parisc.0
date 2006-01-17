From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: [RFC] Updated glibc 2.3.5-8.1
Date: Tue, 17 Jan 2006 15:48:51 -0500 (EST)
Message-ID: <200601172048.k0HKmpLC012311@hiauly1.hia.nrc.ca>
References: <20060117202325.GP17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060117202325.GP17559@baldric.uwo.ca> from "Carlos O'Donell" at
	Jan 17, 2006 03:23:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sun, Jan 08, 2006 at 02:13:03PM -0500, John David Anglin wrote:
> > > in fr22 until after the SIGFPE.  It sort of looks like the exception
> > > must be in __ieee754_acos.
> > 
> > Take that back.  The function calls feholdexcept (envp=0xc04fba68)
> > and then fesetround (round=0) before the arithmetic exception.
> > 
> > (gdb) p/x *envp
> > $2 = {__status_word = 0x1, __exception = {0x40000360, 0x1, 0x40000360,
> >     0x4033af90, 0x4084c6b8, 0x4084c6b8, 0x0}}
> 
> There could be problems here. I noted in the release email that the FPU
> stuff is not working well with the new compiler. I need to debug this.
> If you can find a testcase then it would rock e.g. feholdexcept
> and fesetround that doesn't set the right bits.

Randolph has a patch which he sent around a few days ago.  The
problem appears to be a sequencing issue with respect to fr0.
He dropped saving and restoring fr1, fr2 and fr3.  Debian may be
going to roll an hppa libc update in the near future.  It would
be nice to also get your other fixes into this update as well.

As I understand it, the exception bug causes a segmentation fault
in uic.  This blocks building qt-xfree86-free which blocks kde.
Thus, the issue is quite urgent.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

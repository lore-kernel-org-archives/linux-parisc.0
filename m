From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Thu, 5 Jul 2007 08:24:12 -0700
Message-ID: <5b2e36650707050824ud041452reb3c017d85b155dc__3371.94599346748$1416624402$gmane$org@mail.gmail.com>
References: <20070705142222.GA26105@frankengul.org>
	 <200707051518.l65FI56n006476@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: seb@frankengul.org,
 parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net,
 debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200707051518.l65FI56n006476@hiauly1.hia.nrc.ca>
Resent-Message-ID: <DhU3PD.A.KfD.E1QjGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On 05/07/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > > Could you do glibc builds with the gcc trunk before and after the change?
> > > It's best to base the PR on an unmodified version of gcc.
> >
> > The test with the gcc-trunk (Main 4.3.0 head) shows the same error at the same place.
>
> Ok, it would be useful to file a gcc PR to start.  However, it's not
> clear that gcc is a fault.
>
> It may be that glibc isn't using the visibility attribute correctly
> for this symbol (i.e., hiding a symbol that is externally referenced).
> You could try building glibc with the attribute removed.  This might
> be somewhat hppa specific because of the nptl issue.

As long as LinuxThreads isn't built, this problem doesn't come up.  It
seems very likely that it's a glibc problem, then.  The Ubuntu builds
are NPTL-only and don't show this problem.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

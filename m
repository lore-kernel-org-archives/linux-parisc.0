From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Fri, 7 Sep 2007 23:30:54 -0400
Message-ID: <119aab440709072030x242e7373gccad036234907ca7__9615.12853759832$1416624438$gmane$org@mail.gmail.com>
References: <20070907005002.GG27404@parisc-linux.org>
	 <200709070125.l871PD6I007142@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: "Matthew Wilcox" <matthew@wil.cx>,
 varenet@gmail.com,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709070125.l871PD6I007142@hiauly1.hia.nrc.ca>
Resent-Message-ID: <Lqagh.A.oIB.vkh4GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On 9/6/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > On Thu, Sep 06, 2007 at 04:33:00PM -0400, John David Anglin wrote:
> The reality is that a lot of work has been needed to keep up with
> the rapid changes occuring in the middle of GCC and it has been
> difficult to keep things from regressing.  For this to happen,
> somebody else would have to do it.  Personally, I would rather
> see work on the 64-bit linux userspace.

The binutils unification was to give the 64-bit linker the ability to
have multiple stub sections, whose eventual goal waws to aid in the
development of a 64-bit linux userspace.

> I must say though that I find the stability and reliability of
> hppa-linux much better than it was a year or two ago.

Go cow power! Mooooooo!

Cheers,
Carlos.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

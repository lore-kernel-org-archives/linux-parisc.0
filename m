From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-hppa64 compilers
Date: Sat, 7 Jan 2006 12:25:41 -0500 (EST)
Message-ID: <200601071725.k07HPfmg019562__48123.446168802$1416623978$gmane$org@hiauly1.hia.nrc.ca>
References: <7d01f9f00601070727l24ae2c79h75c8a4a4d38b4e89@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <7d01f9f00601070727l24ae2c79h75c8a4a4d38b4e89@mail.gmail.com> from "Thibaut VARENE" at Jan 7, 2006 04:27:24 pm
Resent-Message-ID: <RIjbEB.A.IIF.21_vDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> On 1/7/06, Helge Deller <deller@gmx.de> wrote:
> >
> > BTW, what does it take to drop hppa64-compiler in favour of a "-m64" compiler flag (as on x86_64) to hppa-gcc as well ?
> 
> This is probably impossible for the simple reason that the 64bit
> flavour of hppa gcc can only build kernels: we don't have a 64bit
> userland and thus the 64bit gcc is very limited in its features...
> This is not a full-featured compiler:

That's not true.  Under hpux, it's features are essentially equivalent
to the 32-bit compiler except for the lack of an ada port.  A -m64
option would be immediately useful under hpux.

There's not a lot that needs to be added to GCC for a 64-bit linux runtime.
The problems in creating a 64-bit userland are elsewhere.  Carlos has
made a start.  Maybe this should be in the wiki.

As usual, the main issue is the number of contributors.  Randolph and
Carlos have just about finished TLS support.  Randolph and others in
the gdb project have made numerous fixes to gdb that makes life so much
easier...  When TLS is finished, possibly the next step is to move back
to the 64-bit runtime.

As well as GCC, work needs to be done on binutils for merged 32/64 bit
support.  For example, it would be nice if elf32-hppa.c and elf64-hppa.c 
could be merged to elfxx-hppa.c.  We really need to merge the binutils
tools before doing GCC.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

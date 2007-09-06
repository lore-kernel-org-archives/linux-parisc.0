From: "Thibaut VARENE" <varenet@gmail.com>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 21:15:48 +0200
Message-ID: <7d01f9f00709061215q721df5b4wa7b8a0b96eaf491__7738.68083856559$1416624441$gmane$org@mail.gmail.com>
References: <200709042148.l84LmnE5017739@hiauly1.hia.nrc.ca>
	 <200709061511.38991.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: parisc-linux@lists.parisc-linux.org,
 "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 "Matthias Klose" <doko@cs.tu-berlin.de>,
 debian-hppa@lists.debian.org
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709061511.38991.vapier@gentoo.org>
Resent-Message-ID: <Q8YRND.A.YVB.HeF4GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On 9/6/07, Mike Frysinger <vapier@gentoo.org> wrote:
> On Tuesday 04 September 2007, John David Anglin wrote:

> > Nominally, the first part of the target string represents the
> > architecture of the kernel, and not the userspace architecture.
> > This is not sufficient to configure runtime applications when multiple
> > architectures are supported by one kernel.
>
> i'm not terribly familiar with the breadth of the parisc family, but isnt
> 64bit only available with 2.0 ?  so it'd be pretty clean on Linux to say:
> hppa64-*-linux-* means 64bit userland, everything else is 32bit

Seems you misunderstood jda's above comment. We do not have a 64bit
userland on hppa. the 'hppa64' part of the target string represents
the architecture of the /kernel/. 64bit kernels run a 32bit userland,
hence hppa64-linux should be treated (so far) as hppa-linux.

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Tue, 7 Jul 2009 09:57:41 -0400
Message-ID: <119aab440907070657p17c781cci4e402bd344bf5a1f@mail.gmail.com>
References: <20090706214315.GA3826@bombadil.infradead.org>
	 <20090707014710.EF3975022@hiauly1.hia.nrc.ca>
	 <20090707024342.GB15572@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, Kyle McMartin <kyle@mcmartin.ca>, randolph@tausq.org,
	James.Bottomley@hansenpartnership.com, deller@gmx.de, kurt@roeckx.be,
	pkern@debian.org, debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: dann frazier <dannf@dannf.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20090707024342.GB15572@lackof.org>
Resent-Message-ID: <-WR5pHc-hNB.A.0_G.iR1UKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, Jul 6, 2009 at 10:43 PM, dann frazier<dannf@dannf.org> wrote:
> dannf@penalosa:~$ cat /proc/cpuinfo
> processor =A0 =A0 =A0 =A0 : 0
> cpu family =A0 =A0 =A0 =A0: PA-RISC 2.0
> cpu =A0 =A0 =A0 =A0 =A0 =A0 =A0 : PA8700 (PCX-W2)
> cpu MHz =A0 =A0 =A0 =A0 =A0 =A0 : 750.000000
> model =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 : 9000/785/J6700
> model name =A0 =A0 =A0 =A0 =A0 =A0: Duet W2
> hversion =A0 =A0 =A0 =A0 =A0 =A0 =A0: 0x00005dd0
> sversion =A0 =A0 =A0 =A0 =A0 =A0 =A0: 0x00000491
> I-cache =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 : 768 KB
> D-cache =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 : 1536 KB (WB, direct mapped)
> ITLB entries =A0 =A0 =A0 =A0 =A0 =A0 =A0: 240
> DTLB entries =A0 =A0 =A0 =A0 =A0 =A0 =A0: 240 - shared with ITLB
> bogomips =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: 1495.04
> software id =A0 =A0 =A0 =A0 =A0 =A0 =A0 : 2001606322

This is very similar to my own box. In frustration I've started
installing a buildd on my own a500. I might as well run a buildd to
load the machine and see if any of the reported package FTBS crop up.

Cheers,
Carlos.

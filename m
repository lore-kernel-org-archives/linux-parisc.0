From: LaMont Jones <lamont@mmjgroup.com>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Mon, 10 Sep 2007 13:00:52 -0600
Message-ID: <20070910190052.GA1818__26271.0745133974$1416624439$gmane$org@mix.mmjgroup.com>
References: <200709042148.l84LmnE5017739@hiauly1.hia.nrc.ca> <200709061511.38991.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Matthias Klose <doko@cs.tu-berlin.de>,
 debian-hppa@lists.debian.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709061511.38991.vapier@gentoo.org>
Resent-Message-ID: <uoOJND.A.C_.2hZ5GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Thu, Sep 06, 2007 at 03:11:37PM -0400, Mike Frysinger wrote:
> i'm not terribly familiar with the breadth of the parisc family, but isnt 
> 64bit only available with 2.0 ?  so it'd be pretty clean on Linux to say: 
> hppa64-*-linux-* means 64bit userland, everything else is 32bit

Also, with the current config.guess, personality is totally ignored in
favor of looking at the processor model in /proc/cpuinfo.  Not a good
answer.

lamont


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

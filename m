From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Bug#364562: linux32 "doesn't work" on hppa64 kernels
Date: Mon, 24 Apr 2006 08:19:13 -0400
Message-ID: <20060424121913.GG19550__7975.64960453219$1416624067$gmane$org@quicksilver.road.mcmartin.ca>
References: <17484.38215.530303.856546@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Matthias Klose <doko@cs.tu-berlin.de>,
 364562@bugs.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <17484.38215.530303.856546@gargle.gargle.HOWL>
Resent-Message-ID: <E3hxUD.A.nFG.0aMTEB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, Apr 24, 2006 at 11:07:19AM +0200, Matthias Klose wrote:
> Package: linux32
> Version: 1-3
> 
> $ uname -m
> parisc64
> 
> $ linux32 uname -m
> parisc64
>

I spent some time trying to fix this a while ago at Jeff Bailey's
request, but it required nasty invasive changes that I didn't have
time to debug. (It's not really an improvement when /sbin/init fails
to exec...)

If I have some time this week, I'll dust off the diff and see if I can
finagle it to work.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

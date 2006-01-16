From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Fwd: [patch/hppa] Floating point exception handling patch]
Date: Mon, 16 Jan 2006 15:43:37 -0700
Message-ID: <20060116224337.GC22635__11836.2650428482$1416623993$gmane$org@colo.lackof.org>
References: <43CADCFC.60802@tausq.org> <20060116062212.GC22048@colo.lackof.org> <20060116164050.GA4049@quicksilver.road.mcmartin.ca> <20060116170359.GE29884@tennyson.dodds.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Kyle McMartin <kyle@debian.org>,
 Grant Grundler <grundler@parisc-linux.org>,
 Randolph Chung <randolph@tausq.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 debian-hppa <debian-hppa@lists.debian.org>,
 debian-release <debian-release@lists.debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060116170359.GE29884@tennyson.dodds.net>
Resent-Message-ID: <E-qCUC.A.wOE.r9BzDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, Jan 16, 2006 at 09:03:59AM -0800, Steve Langasek wrote:
> > This is a pretty short list... Would anyone object to binNMUs of the
> > effected packages on hppa, once a fixed glibc is uploaded?
> 
> If the bug is in glibc, why would any of these packages need binNMUs?

Only if they were statically linked - I doubt that's the case.

But the reason for the list was to make it easier for the buildd maintainer
to know which packages with previously failed builds could be requeued.

>   The
> only reason they would need rebuilt after a glibc bug fix would be if the
> glibc ABI changed in the process, and that would be Very Bad<tm>.

Yeah, hopefully that doesn't happen.

thanks,
grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] RE: no login with 2.6 kernel and Mozilla probs on
	712/60
Date: Wed, 26 May 2004 10:11:57 -0600
Message-ID: <20040526161157.GC4087__37247.3986623392$1416623458$gmane$org@colo.lackof.org>
References: <BAY1-F109SYgkkpNnPd0002f227@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: stefano.melchior@fastwebnet.it,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Kenneth Westelinck <kennywest1@hotmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <BAY1-F109SYgkkpNnPd0002f227@hotmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, May 26, 2004 at 09:08:10AM +0000, Kenneth Westelinck wrote:
> >There is no need to use unstable instead of testing!
> Ok, thanks for that.

yeah - testing has usually worked well with occasional minor brokenness.
(wow...see what the internet has done to my english! :^)
I've been running "testing" on my desktop/http/ftp servers for
the past couple of years and only had a few SNAFUs.
(palo was the most recent one).

BTW, if you move forward to testing (recomended), you can add
another source to /etc/apt/sources.list to pick up the
latest kernels (not auto updated). It's documented here:
	http://cvs.parisc-linux.org/download/linux-2.6/

There is a similar web page for 2.4 parisc kernels.

> Ok, I'll try that one, there's nothing broken yet. I successfully rolled 
> back to the old situation ;)
> Is there ongoing parisc support/development for the 2.4.x series, or are 
> you guys only focussing on the 2.6?

That's what the original question was about.
For the past 6-12 monthes, we've mostly focused on 2.6 devel.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

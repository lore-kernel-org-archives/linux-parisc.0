From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Sat, 4 Dec 2004 22:09:17 -0700
Message-ID: <20041205050917.GA8057@colo.lackof.org>
References: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: davidm@hpl.hp.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Dec 04, 2004 at 05:19:47PM -0800, David Mosberger wrote:
...
> At the moment, the PA Linux support is available only via the
> bitkeeper repository at:
> 
> 	bk://unwind.bkbits.net/libunwind/
> 
> If you want to play with this, just be sure to read the README.

I read the README and learned I should be using gcc 3.4.x (and
debian testing default is gcc-3.3.4).

But I ran into a different (trivial) problem during the build:
...
make[1]: Leaving directory `/home/src/libunwind/tests'
Making all in doc
make[1]: Entering directory `/home/src/libunwind/doc'
latex2man -t ./libunwind.trans libunwind.tex libunwind.man
make[1]: latex2man: Command not found
make[1]: *** [libunwind.man] Error 127
make[1]: Leaving directory `/home/src/libunwind/doc'
make: *** [all-recursive] Error 1

apt-cache search latex2man and packages.debian.org didn't help.
Anyone have a clue which package latex2man is in?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

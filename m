From: David Mosberger <davidm@napali.hpl.hp.com>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Sat, 4 Dec 2004 21:15:00 -0800
Message-ID: <16818.39252.802512.48866@napali.hpl.hp.com>
References: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
	<20041205050917.GA8057@colo.lackof.org>
Reply-To: davidm@hpl.hp.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: davidm@hpl.hp.com,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041205050917.GA8057@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>>>>> On Sat, 4 Dec 2004 22:09:17 -0700, Grant Grundler <grundler@parisc-linux.org> said:

  Grant> On Sat, Dec 04, 2004 at 05:19:47PM -0800, David Mosberger
  Grant> wrote: ...
  >> At the moment, the PA Linux support is available only via the
  >> bitkeeper repository at:
  >> 
  >> bk://unwind.bkbits.net/libunwind/
  >> 
  >> If you want to play with this, just be sure to read the README.

  Grant> I read the README and learned I should be using gcc 3.4.x
  Grant> (and debian testing default is gcc-3.3.4).

  Grant> But I ran into a different (trivial) problem during the
  Grant> build: ...  make[1]: Leaving directory
  Grant> `/home/src/libunwind/tests' Making all in doc make[1]:
  Grant> Entering directory `/home/src/libunwind/doc' latex2man -t
  Grant> ./libunwind.trans libunwind.tex libunwind.man make[1]:
  Grant> latex2man: Command not found make[1]: *** [libunwind.man]
  Grant> Error 127 make[1]: Leaving directory
  Grant> `/home/src/libunwind/doc' make: *** [all-recursive] Error 1

  Grant> apt-cache search latex2man and packages.debian.org didn't
  Grant> help.  Anyone have a clue which package latex2man is in?

If the time-stamps are correct, it shouldn't even try to rebuild the
man files, but you can work around the lack of latex2man with

	$ make L2M=cp

  --david
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

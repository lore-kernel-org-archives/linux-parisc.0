From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Problems with Web
Date: Tue, 1 Jun 2004 22:29:05 -0700
Message-ID: <20040602052905.GP3517@tausq.org>
References: <20040531225013.GD26348@colo.lackof.org>
	<200405312258.i4VMwFRM021111@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: nwoods29321@charter.net,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200405312258.i4VMwFRM021111@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Awesome!
> > Any rough estimate when something will be submitted to debian?

gcc-3.3 in Debian already has the java patches, but it doesn't work 
very well there (lots of test failures). Dave and I are still trying to
sort out what is wrong with signal frame unwinding/libjava with gcc-3.5
and 2.4/2.6 kernels....

sablevm is supported on hppa-linux in switched and direct-threaded mode.
There are some issues with the inlined engine that I haven't had time to
investigate and figure out yet. It works quite well otherwise and is
actively being worked on.

kaffe can probably be made to work, at least in interpreter mode,
without too much work. It used to work ~2 years ago, but has probably 
bitrotted since then. If anyone is interested in working on this and
needs help, let me know.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19780482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 12:47:07 -0700 (MST)
Date: Mon, 10 Feb 2003 14:46:50 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pppd, pthread and hppa-linux question?
Message-ID: <20030210194650.GG6139@systemhalted>
References: <3E476CFE000007AD@ocpmta3.freegates.net> <20030210161304.GT11363@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030210161304.GT11363@tausq.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Feb 10, 2003 at 08:13:04AM -0800, Randolph Chung wrote:
> > All seems to work fine, never the less I notice some pppd messages which
> > I do not noticed on my i386 Debian GNU/Linux box:
> > ...
> > Feb 10 17:34:57 fw01 pppd[1543]: read: Resource temporarily unavailable
> > Feb 10 17:34:57 fw01 pppd[1543]: read /dev/ppp: Resource temporarily unavailable
> 
> this probably comes from apps that assume EAGAIN==EWOULDBLOCK. we need
> to probably fix this in glibc.... let's add it to Carlos' todo list! :-)

It's already in my TODO :)

-- snip --
- EWOULDBLOCK emulation
        = Is EWOULDBLOCK emulation required?
        = What happens if we alias EWOULDBLOCK as EAGAIN
        = from the kernel hearders?
        - Break HPUX compat?
-- snip --

As JDA notes we still have broken atomic functions in atomicity. Which
we are planning to fix with a light weight syscall.

c.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2E2D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Dec 2002 22:08:57 -0700 (MST)
Date: Sun, 8 Dec 2002 21:12:14 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Message-ID: <20021209051214.GK21187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021208232601.GH21187@tausq.org> <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Trap handler
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

In reference to a message from John David Anglin, dated Dec 08:
> > > I just happened to notice that the system almost totally stalled running
> > > the test.  The load average jumps from 1 to about 9.  You just have to
> > > compile and run to see the effect.  Line 127 writes to unmapped memory
> > > and causes multiple entries in /var/log/debug.
> > 
> > Dave, can you send the test program and details to the list? i didn't
> > see the beginning of this thread and am not sure which program you are
> > refering to.
> 
> Here it is.

well, something is just very broken, even this simple code triggers the
bug:

int main(int argc, char **argv)
{
        int *p = 0;
        return *p;
}

the kernel goes nuts trying to page fault continuously.

:-(
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

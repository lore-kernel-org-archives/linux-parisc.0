Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F9984837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 09:58:55 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h6HFriI14060;
	Thu, 17 Jul 2003 11:53:44 -0400
Subject: Re: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
From: James Bottomley <James.Bottomley@steeleye.com>
To: Randolph Chung <tausq@debian.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>
In-Reply-To: <20030717155203.GO30257@tausq.org>
References: <20030717001528.GA20610@systemhalted>
	<3F0BEA8300002113@ocpmta1.freegates.net>  <20030717155203.GO30257@tausq.org>
Content-Type: text/plain
Date: 17 Jul 2003 11:53:44 -0400
Message-Id: <1058457224.2646.60.camel@mulgrave>
Mime-Version: 1.0
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

On Thu, 2003-07-17 at 11:52, Randolph Chung wrote:
> > Freeing unused kernel memory: 508k freed
> > Adding 250872k swap on /dev/sda2.  Priority:-1 extents:1
> > 
> > Here it hangs. (just in case, i tried a telnet but no success)
> > 
> > I so do a toc.
> > 
> > Unfortunately the IAOQ = 0x00000000000172b8  is not a relevant value?
> 
> looks like a userspace address....

Actually, I think it's an address in a module.  If it were from
userspace, it would have the bottom two bits set.

Unfortunately, I don't seem to have the email you're replying to, so I
can't tell if that's true or not.  If we could get the 64 bit compile to
do kallsyms, that would tell you definitively.

James

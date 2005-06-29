From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PRINTK_TIME make panicing very early b2k?
Date: Tue, 28 Jun 2005 22:41:05 -0400 (EDT)
Message-ID: <200506290241.j5T2f6xi019650@hiauly1.hia.nrc.ca>
References: <20050627150107.GG5200@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050627150107.GG5200@parcelfarce.linux.theplanet.co.uk> from
	"Matthew Wilcox" at Jun 27, 2005 04:01:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I'm not sure why you say it lacks relevant info.  Seems pretty clear to me:
> 
> > IIA Space                    = 0x0000000000000000
> > IIA Offset                   = 0x0000000000000000
> 
> ... a null pointer dereference, in kernel space.
> 
> > General Registers 0 - 31
> > 00-03   0000000000000000  0000000000000000  000000001012799c  0000000000800327
> 
> called from 1012799c.  Where's that in your System.map?

I had a similar toc dump today with 2.6.10-pa11.  The rp value pointed
to the return from the call to do_poll in sys_poll.  I've seen other
hangs in sys_poll.  The code could be in do_poll or sys_poll.  Does a
null pointer dereference in kernel space cause this?  Off hand, I would
have suspected a stack problem in an ISR.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Mysterious hangs with parisc
Date: Wed, 5 Jul 2006 12:47:34 -0400
Message-ID: <20060705164734.GB30640@athena.road.mcmartin.ca>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 23, 2006 at 10:41:09PM -0400, John David Anglin wrote:
> This is not to say that the locking code can't be improved.  As far
> as I can tell, hpux doesn't spin.  It has pre-abitration, priorities
> for waiters, etc.  When a lock is released, suwaiters is called to
> pass the lock in a fair way to another waiter if there is one.
> 

HPUX spinlocks /do/ spin, afaict. They just keep track of how long
they've been spinning for (and panic after 60 seconds.) On release of
a spinlock, they also donate it to another cpu, which is, I guess, the
arbitration thing. I can back this up with disassembly, but I wouldn't
be comfortable doing it over mail, due to copyright infringement and
blah blah.

Cheers,
	 Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

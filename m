Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83861483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 13:30:27 -0600 (MDT)
Date: Fri, 19 Sep 2003 15:28:13 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] r19 (aka pic-register akak ltp) not restored on
Message-ID: <20030919192813.GL18225@systemhalted>
References: <1063996009.1832.34.camel@mulgrave> <200309191855.h8JItUaf003758@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309191855.h8JItUaf003758@hiauly1.hia.nrc.ca>
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

On Fri, Sep 19, 2003 at 02:55:30PM -0400, John David Anglin wrote:
> > On Fri, 2003-09-19 at 12:51, Carlos O'Donell wrote:
> > > mutex_unlock becomes:
> > > __libc_maybe_call (__pthread_mutex_unlock, (m), (*(int *)(m) = 0))
> > 
> > This seems all to work:
> 
> Yah, the normal code that gcc generates to restore the ltp is very
> extensively tested.  Shared libraries would break almost instantly
> if there were major problems.
> 

If it were major we would have fixed it :)
I'm trying to find the "missed a restore" point.

c.

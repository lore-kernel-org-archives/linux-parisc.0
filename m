Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12505.mail.yahoo.com (web12505.mail.yahoo.com [216.136.173.197])
	by dsl2.external.hp.com (Postfix) with SMTP id 11145482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Sep 2002 01:25:07 -0600 (MDT)
Message-ID: <20020910072505.62218.qmail@web12505.mail.yahoo.com>
Date: Tue, 10 Sep 2002 00:25:05 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Modem communication, HP 730 
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020910052431.8592F482A@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Grant,

That thing you speak of is not the modem...the modem is inside the K. 
That thing is called a LAM.  Local Access Module.  It varied from
country to country so they don't have to change the modem only the LAM.
 The modem acctually plugs into the Core i/o board via a set of about
20 pins that actually come throught the modem board.  Very easy to bend
and get out of alignment.

derek

--- Grant Grundler <grundler@dsl2.external.hp.com> wrote:
> Derek Engelhaupt wrote:
> > I know the internal modem of the K-class is limited to 19200.  All
> of
> > the support modems we install for the systems are slowed down to
> 19200
> > even though they are 56k.  Coincidence?
> 
> Maybe not.  Does the modem connect directly the console manager or
> whatever it's called? That might be the limiting factor.
> 
> Could I cut off the goofy connector for K-class modem, solder on a
> DB-9
> (or DB25) and have a cool external 56k Modem?
> If so, I only need to know what the pinout is since power probably
> comes through the cable as well.
> 
> I've seen so many of those go in the trash here.
> 
> grant


__________________________________________________
Yahoo! - We Remember
9-11: A tribute to the more than 3,000 lives lost
http://dir.remember.yahoo.com/tribute

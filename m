Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from Cantor.suse.de (ns.suse.de [213.95.15.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7B28483E
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 14:48:22 -0700 (MST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org (Matthew Wilcox), parisc-linux@parisc-linux.org,
	gcc@gcc.gnu.org
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
From: Andreas Schwab <schwab@suse.de>
Date: Wed, 26 Feb 2003 22:48:20 +0100
In-Reply-To: <200302262113.h1QLDC05020030@hiauly1.hia.nrc.ca> ("John David
 Anglin"'s message of "Wed, 26 Feb 2003 16:13:11 -0500 (EST)")
Message-ID: <jewujm1zob.fsf@sykes.suse.de>
References: <200302262113.h1QLDC05020030@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

"John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:

|> > I think it was an error to do so.  I do not see how
|> > 
|> > 	(spinlock_t) { 1 }
|> > 
|> > is any more or less constant than
|> > 
|> > 	{ 1 }
|> > 
|> > Removing this extension is a bad idea because it removes the ability to
|> > do typechecking.  For example,
|> > 
|> > 	rwlock_t lock = SPIN_LOCK_INIT;
|> > 
|> > would throw an error with a cast and not without.
|> 
|> GCC allows the above cast.

This is not a cast, it's a compound literal.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux AG, Deutschherrnstr. 15-19, D-90429 Nürnberg
Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

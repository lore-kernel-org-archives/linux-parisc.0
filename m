Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from Cantor.suse.de (ns.suse.de [213.95.15.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BD9C483E
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 14:09:41 -0700 (MST)
To: Matthew Wilcox <willy@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
From: Andreas Schwab <schwab@suse.de>
Date: Wed, 26 Feb 2003 22:09:27 +0100
In-Reply-To: <20030226203722.A16664@parcelfarce.linux.theplanet.co.uk> (Matthew
 Wilcox's message of "Wed, 26 Feb 2003 20:37:22 +0000")
Message-ID: <jed6le3g1k.fsf@sykes.suse.de>
References: <3E5BA2910000087F@ocpmta3.freegates.net>
	<200302261858.h1QIwvSJ019646@hiauly1.hia.nrc.ca>
	<20030226203722.A16664@parcelfarce.linux.theplanet.co.uk>
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

Matthew Wilcox <willy@debian.org> writes:

|> On Wed, Feb 26, 2003 at 01:58:57PM -0500, John David Anglin wrote:
|> > > Would I have to open a bug report near gcc with this one?
|> > 
|> > You mean for the errors:
|> > 
|> > joel.c:19: error: initializer element is not constant
|> > joel.c:19: error: (near initialization for `MyRWLock')
|> > joel.c:19: error: initializer element is not constant
|> > 
|> > No, fix the code.  I don't believe you will win this one.  This
|> > feature (extension) was deliberately removed from GCC.
|> 
|> I think it was an error to do so.  I do not see how
|> 
|> 	(spinlock_t) { 1 }
|> 
|> is any more or less constant than
|> 
|> 	{ 1 }

A compound literal is not a constant, but an unnamed object.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux AG, Deutschherrnstr. 15-19, D-90429 Nürnberg
Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E8BC484A
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 23:37:04 -0700 (MST)
Date: Thu, 27 Feb 2003 07:36:56 +0100
Message-ID: <3E5BA291000009D9@ocpmta3.freegates.net>
In-Reply-To: <jewujm1zob.fsf@sykes.suse.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "Andreas Schwab" <schwab@suse.de>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi all,

>-- Original Message --
>To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: willy@debian.org (Matthew Wilcox), parisc-linux@parisc-linux.org,
>	gcc@gcc.gnu.org
>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>From: Andreas Schwab <schwab@suse.de>
>Date: Wed, 26 Feb 2003 22:48:20 +0100
>
>
>"John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:
>
>|> > I think it was an error to do so.  I do not see how
>|> > 
>|> > 	(spinlock_t) { 1 }
>|> > 
>|> > is any more or less constant than
>|> > 
>|> > 	{ 1 }
>|> > 
>|> > Removing this extension is a bad idea because it removes the ability
>to
>|> > do typechecking.  For example,
>|> > 
>|> > 	rwlock_t lock = SPIN_LOCK_INIT;
>|> > 
>|> > would throw an error with a cast and not without.
>|> 
>|> GCC allows the above cast.
>
>This is not a cast, it's a compound literal.
>
>Andreas.
>
>-- 
>Andreas Schwab, SuSE Labs, schwab@suse.de
>SuSE Linux AG, Deutschherrnstr. 15-19, D-90429 Nürnberg
>Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
>"And now for something completely different."
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Thanks to all for this clarification.

Never the less, I would like to put an additional question:

the mentionned error occurs when this variable is a global one
but when it became local (e.g. when I define it into main() ) the error doesn't
occur anynore (I do not presume of the resulting code).
So what is the conceptual difference?

Thanks in advance for additional help,
   Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

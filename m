Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CE2A483E
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 13:37:23 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18o8Is-0006Fc-00; Wed, 26 Feb 2003 20:37:22 +0000
Date: Wed, 26 Feb 2003 20:37:22 +0000
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
Message-ID: <20030226203722.A16664@parcelfarce.linux.theplanet.co.uk>
References: <3E5BA2910000087F@ocpmta3.freegates.net> <200302261858.h1QIwvSJ019646@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302261858.h1QIwvSJ019646@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Wed, Feb 26, 2003 at 01:58:57PM -0500
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

On Wed, Feb 26, 2003 at 01:58:57PM -0500, John David Anglin wrote:
> > Would I have to open a bug report near gcc with this one?
> 
> You mean for the errors:
> 
> joel.c:19: error: initializer element is not constant
> joel.c:19: error: (near initialization for `MyRWLock')
> joel.c:19: error: initializer element is not constant
> 
> No, fix the code.  I don't believe you will win this one.  This
> feature (extension) was deliberately removed from GCC.

I think it was an error to do so.  I do not see how

	(spinlock_t) { 1 }

is any more or less constant than

	{ 1 }

Removing this extension is a bad idea because it removes the ability to
do typechecking.  For example,

	rwlock_t lock = SPIN_LOCK_INIT;

would throw an error with a cast and not without.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E8A5483E
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 15:50:43 -0700 (MST)
Message-Id: <200302262250.h1QMoeg9020308@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: schwab@suse.de (Andreas Schwab)
Date: Wed, 26 Feb 2003 17:50:40 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
In-Reply-To: <jewujm1zob.fsf@sykes.suse.de> from "Andreas Schwab" at Feb 26, 2003 10:48:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> This is not a cast, it's a compound literal.

You of course are correct.  However, the GCC documentation says:

  ISO C99 supports compound literals.  A compound literal looks like
  a cast containing an initializer.  Its value is an object of the
  type specified in the cast, containing the elements specified in
  the initializer; it is an lvalue.  As an extension, GCC supports
  compound literals in C89 mode and in C++.

  Compound literals for scalar types and union types are is
  also allowed, but then the compound literal is equivalent
  to a cast.

  As a GNU extension, GCC allows initialization of objects with static storage
  duration by compound literals (which is not possible in ISO C99, because
  the initializer is not a constant).
  It is handled as if the object was initialized only with the bracket
  enclosed list if compound literal's and object types match.
  The initializer list of the compound literal must be constant.

So, the basic point is that the nesting of compound literals isn't
allowed because they are not a constant.  Cast operators in the
initializer portion of a compound literal can only convert arithmetic
types to arithmentic types, except as noted for the sizeof operator.

Unless you use the capability of compound literals to coerce to a
pointer to its first element, it doesn't appear that there is much
benefit in using compound literals for non-automatic data.

In Joel's case, the initializer only needs to contain constant
expressions and doesn't require a construction, even when the define
for RW_LOCK_UNLOCKED is done as a compound literal.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

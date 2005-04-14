From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Thu, 14 Apr 2005 10:39:08 -0400 (EDT)
Message-ID: <200504141439.j3EEd9oX018785@hiauly1.hia.nrc.ca>
References: <20050414050727.GA30838@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050414050727.GA30838@colo.lackof.org> from "Grant Grundler" at
	Apr 13, 2005 11:07:27 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > In this case, we are doing a single operation to *addr, and this
> > function is explicitly not atomic, so I am not quite sure why we need
> > volatile at all.
> 
> James Bottomley dug up the original thread:
> 	http://marc.theaimsgroup.com/?t=108826637900003
> 
> If __set_bit() doesn't need volatile, then is the same true
> for __clear_bit and __change_bit?

The above discussion bothers me a lot:

  So the rule has always been (and this has nothing to do with parisc, and 
  parisc DOES NOT GET TO SET THE RULES!) that "test_bit()" acts in a 
  volatile manner, and that you traditionally could write

     while (test_and_set_bit(xxx, field))
       while (test_bit(xx, field)) /* Nothing */;

  to do a lock.

  NOTE! There are no volatile data structures _anywhere_, because as
  mentioned, I think that whole notion is a total piece of crap, and is not
  even a well-defined part of the C language. But the test_bit() function
  has to act as if the data it is passed down can change. To repeat:  
  _codepaths_ may have volatility attributes depending on usage of the data.

I don't believe that a lock can be implemented as shown above on
PA-RISC as we don't have an atomic test_and_set_bit.  The only atomic
ops are ldcw and ldcd (load and clear word/double).  So, if test_and_set_bit
needs locking semantics, it will have to be implemented with spinlocks.

Secondly, I'm not convinced of the concept of volatile code paths
and using the volatile keyword to keep loops from being optimized
away.  I think this approach results in bad code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 23:19:34 -0400 (EDT)
Message-ID: <200606120319.k5C3JZXj004098@hiauly1.hia.nrc.ca>
References: <119aab440606112013s71bc1daen46041756ce843d14@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606112013s71bc1daen46041756ce843d14@mail.gmail.com>
	from "Carlos O'Donell" at Jun 11, 2006 11:13:33 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > #   slow_pthread_self   The synchronization code should try to avoid
> > #                       pthread_self calls by caching thread IDs in a hashtable
> >
> > There's also 'enable_hash_synchronization_default'.
> 
> Reading the thread register is a single mfctl, I don't know if that is
> considered slow?

Looks like it's the later parameter that affects lock caching:

# Should we use hashtable-based synchronization?
# Currently works only for Linux X86/ia64
# Typically faster and more space-efficient
AC_ARG_ENABLE(hash-synchronization,
  AS_HELP_STRING([--enable-hash-synchronization],
		   [use global hash table for monitor locks]))

I'll try turning this off.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

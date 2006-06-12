From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 23:03:57 -0400 (EDT)
Message-ID: <200606120303.k5C33wIi002802@hiauly1.hia.nrc.ca>
References: <119aab440606111942o1be5e11bw6ede4fa941f01778@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606111942o1be5e11bw6ede4fa941f01778@mail.gmail.com>
	from "Carlos O'Donell" at Jun 11, 2006 10:42:09 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> However, the mutex objects look like they are being cached? There
> could be a scenario where an allocated and locked mutex is put back in
> the cache, such a mutex cannot be cleaned without resetting with
> __PTHREAD_MUTEX_INITIALIZER.

Hmmm, that reminds me that there is this config variable in configure.host,
'slow_pthread_self'.

#   slow_pthread_self   The synchronization code should try to avoid
#                       pthread_self calls by caching thread IDs in a hashtable

There's also 'enable_hash_synchronization_default'.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

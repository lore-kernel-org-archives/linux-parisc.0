Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 645024842
	for <parisc-linux@parisc-linux.org>; Thu, 27 Feb 2003 09:00:48 -0700 (MST)
Date: Thu, 27 Feb 2003 17:00:17 +0100
Message-ID: <3E5BA29100000DEB@ocpmta3.freegates.net>
In-Reply-To: <200302261858.h1QIwvSJ019646@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
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

>-- Original Message --
>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>To: jsoe0708@tiscali.be (Joel Soete)
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: willy@debian.org, parisc-linux@parisc-linux.org
>Date: Wed, 26 Feb 2003 13:58:57 -0500 (EST)
>
>
>> Would I have to open a bug report near gcc with this one?
>
>You mean for the errors:
>
>joel.c:19: error: initializer element is not constant
>joel.c:19: error: (near initialization for `MyRWLock')
>joel.c:19: error: initializer element is not constant
>
>No, fix the code.  I don't believe you will win this one.  This
>feature (extension) was deliberately removed from GCC.
>
Well I first choose the facility:

I remove the cast so that in asm-parisc/spinclok_t.h
...
#ifndef CONFIG_DEBUG_SPINLOCK
#define SPIN_LOCK_UNLOCKED { 1 }
...
#else

#define SPIN_LOCK_UNLOCKED { 1, 0L, 0L }
...

but it breacks many code else where fork.c, raid1.c, raid5.c,...
where it is easy to recast.

Any better idea?

Joel
 

---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

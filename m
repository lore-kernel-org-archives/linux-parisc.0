Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7AE84842
	for <parisc-linux@parisc-linux.org>; Thu, 27 Feb 2003 11:38:08 -0700 (MST)
Date: Thu, 27 Feb 2003 19:37:55 +0100
Message-ID: <3E5BA29100000EB6@ocpmta3.freegates.net>
In-Reply-To: <200302271717.h1RHHJM1021638@hiauly1.hia.nrc.ca>
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
>Date: Thu, 27 Feb 2003 12:17:18 -0500 (EST)
>
>
>> I remove the cast so that in asm-parisc/spinclok_t.h
>> ...
>> #ifndef CONFIG_DEBUG_SPINLOCK
>> #define SPIN_LOCK_UNLOCKED { 1 }
>> ...
>> #else
>> 
>> #define SPIN_LOCK_UNLOCKED { 1, 0L, 0L }
>
>You probably don't need the 0's.  When there a fewer initializers in a brace
>enclosed list than there are elements or members of an aggregate, they are
>implicitly initialized the same as objects that have static storage duration.
>
>> but it breacks many code else where fork.c, raid1.c, raid5.c,...
>> where it is easy to recast.
>
>Glibc linuxthreads defines two initializers in the pthread code, one
>using compound literals and the other using standard initializer lists.
>
I will have a look (it will just have to wait two weeks because of Sun course
about 6800)

Thanks a lot,
    Joel

>Dave
>-- 
>J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
>National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

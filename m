Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A9EF483E
	for <parisc-linux@parisc-linux.org>; Tue, 25 Feb 2003 05:38:07 -0700 (MST)
Date: Tue, 25 Feb 2003 13:38:00 +0100
Message-ID: <3E5A202B000002E2@ocpmta6.freegates.net>
In-Reply-To: <20030224175013.L2938@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
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
>From: Matthew Wilcox <willy@debian.org>
>To: Joel Soete <jsoe0708@tiscali.be>
>Cc: parisc-linux@parisc-linux.org
>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>Date: Mon, 24 Feb 2003 17:50:13 +0000
>
>
>On Mon, Feb 24, 2003 at 06:42:39PM +0100, Joel Soete wrote:
>> sched.c:93: initializer element is not constant
>> sched.c:93: (near initialization for `tasklist_lock')
>> sched.c:93: initializer element is not constant
>[...]
>> which is precompile as:
>> rwlock_t tasklist_lock __attribute__((__aligned__(64))) = (rwlock_t) {
>(spinlock_t)
>> {1}, 0 };
>> 
>> What's wrong?
>
>looks like gcc broke this again.  for the moment, you can try taking
>out the casts.
>
Yes :(( 

This errors also occurs with 32bits gcc-3.2 as well as for gcc-3.3 (gcc-snapshot)
(but was not with gcc-3.0)

Thanks,
    Joel

PS: daya think a bg is required?

>-- 
>"It's not Hollywood.  War is real, war is primarily not about defeat or
>victory, it is about death.  I've seen thousands and thousands of dead bodies.
>Do you think I want to have an academic debate on this subject?" -- Robert
>Fisk
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CFA0487A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 01:15:53 -0600 (MDT)
Date: Wed, 30 Apr 2003 09:15:41 +0200
Message-ID: <3EA9466400001A95@ocpmta7.freegates.net>
In-Reply-To: <20030430003106.GC12492@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Grant Grundler" <grundler@parisc-linux.org>
Cc: "Boehm, Hans" <hans_boehm@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
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

Hi,

>
>> ii  libc6          2.3.1-16       GNU C Library: Shared libraries and
Timezone
>> ii  libc6-dev      2.3.1-16       GNU C Library: Development Libraries
>and Hea
>
>Perfect.
>
>> I'm ok with updating to -17 if you promise it won't do evil things
>> to my box. ;^)
>
>Don't touch -17, the _Unwind_Find_FDE code broke and it's doing damage
>to things like 'vi' ... *sigh* I haven't even looked into this (looks
>like gcc/glibc clashes again).
>
Umm could this be why that my b2k crashed when compiling a kernel to test
a patch?

I just come back to libc6 2.3.1-16: the pb didn't occurs anymore. 
(I was a bit confused because just did it on a test 2.4.21-rc1 :) )

Thanks,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be

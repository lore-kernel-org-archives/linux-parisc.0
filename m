Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50A27498A
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 10:29:59 -0600 (MDT)
Date: Wed, 28 Apr 2004 18:29:55 +0200
Message-ID: <408D436000001CFC@ocpmta2.freegates.net>
In-Reply-To: <20040428155451.GE6936@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20RE=3A=20=5BPATCH=5D=20glibc=2D2=2E3=2E3=20error=20with=20debian=20unstable=09compiler=2E=2E=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>
> It does help, we have a padding problem in siginfo, I never had enough
> test cases to prove the __SI_RT parts were in the right place. This goes
> to show that what you can't test is probably wrong.
> 
> I have to work on this today...

I trust it is not related but btw I encounter another strange pb with this
kernel:
I launch a find on a big disk and get severall messages:
find: /a/dir/of/mine: Input/Output error
...

the same when ls -l /a/dir/of/mine (I/O error)

well this is a merge of our 2.6.6-rc1-pa6 and upsteam 2.6.6-rc3 64bits.
if i reboot with 2.6.6-rc1-pa0 32bits no pb.

So i will try to rebuild 2.6.6-rc1-pa6 alone in 64bit and see if the pb is
there or in my merge?

Cheers,
    Joel



----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr

Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC503489E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 07:42:54 -0700 (MST)
Date: Wed, 18 Feb 2004 15:42:39 +0100
Message-ID: <402A42A10000541C@ocpmta1.freegates.net>
In-Reply-To: <Pine.GSO.4.44.0402180830260.14838-100000@keymaster>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Elliott Potter" <epotter@eep.burdell.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Elliot,

>Interesting -- I'm getting a similar crash in a program when it calls
>getopt_long() -- this do_page_fault thing.  I'm wondering if the two are
>somehow related because it's only this one program that crashes, and
>only on the line where getopt_long() is called.  The output in dmesg:

For the moment I can just confirm that it's not a kernel pb: I just reboot
a 2.6.3-rc4-pa0 built with gcc-hppa64-3.0.4ds3-8 (a N required a 64bits kernel)
and the same Seg fault occurs.

But in my case, as mentioned sw are still in developement, i suspect more
a mistack in my hack ?)

Cheers,
    Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr

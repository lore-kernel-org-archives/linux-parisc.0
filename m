Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4998D482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 10:38:08 -0600 (MDT)
Date: Wed, 13 Aug 2003 18:38:06 +0200
Message-ID: <3F28D766000037C3@ocpmta4.freegates.net>
In-Reply-To: <20030813155754.GC18794@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
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

>I also pulled bits from sf.net for ia64 testing:
>    http://umn.dl.sourceforge.net/sourceforge/re-aim-7/reaim-0.1.8.tar.gz

I will also catch it


>I was told to run with:
>iota:/mnt# reaim -f /mnt/usr/local/share/reaim/workfile.new_dbase -s100
-e 500 > -i 100

>You might need to pick -s and -e values that are more appropriate for
>the machine under test. This
> was for dual CPU 900Mz rx2600 with 2GB RAM.

That is also what I just read on a bench on lwn :) 

I will adapt

Thanks,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9402E482D
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 11:25:15 -0600 (MDT)
Date: Fri, 1 Aug 2003 19:25:05 +0200
Message-ID: <3F29178A0000050C@ocpmta7.freegates.net>
In-Reply-To: <20030801171426.GA18508@security.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] backport bitops.h stuff
To: lamont@hp.com
Cc: "James Bottomley" <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org, lamont@hp.com
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

>Here's a more optimal ffs() routine for hppa, along with the
>output from the test program...  Should run in ~15 states on
>just about
> anything [yes, it's that lock-stepped that it'll
>take about 15 states on PA-8000's as well.. :-(]
>
>Freshly coded, since the hp-ux version (which I can't find
>anymore) looked for most significant set bit, not least.

Thanks, I will test it on next week,

Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 

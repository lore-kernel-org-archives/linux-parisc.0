Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBBDE482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Aug 2003 11:06:52 -0600 (MDT)
Date: Tue, 12 Aug 2003 19:06:44 +0200
Message-ID: <3F29178A00002DBE@ocpmta7.freegates.net>
In-Reply-To: <20030812160612.GF20514@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, "LaMont Jones" <lamont@hp.com>
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

>
>osdl-aim-7 benchmark probably stresses both itlb and dtlb.
>(available from osdl.org - URL is in linux-ia64 archive)

Ok I finaly find it as re-aim-7 sf.net project. Just launch (alltest) with
kernel-64bits+ C.patch . I will let run for the night and relaunch it with
 tommorrow morning with original kernel-64bits.

Thanks,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 

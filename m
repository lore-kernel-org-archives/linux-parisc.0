Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D52A4856
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 10:08:30 -0600 (MDT)
Date: Fri, 26 Sep 2003 18:08:29 +0200
Message-ID: <3F704CAF00001DEB@ocpmta2.freegates.net>
In-Reply-To: <3F704CAF00001DCF@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
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

>
>That is allowing me to notice severall call to kmem_tune_cpucache() (7 exactly)
>(and not other) but don't get any more 'SMP CALL FUNCTION TIMED OUT (CPU=1)'
>:(
>(i presume that, as previously, the system crash before having the opportun
>ty to flush its buffer?)

btw: does it exists some tips to flush buffer before all (or not buffering
console ouput)?


-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 

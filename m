Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D92A84830
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 02:55:31 -0600 (MDT)
Date: Thu, 19 Jun 2003 10:55:28 +0200
Message-ID: <3ED70CF1000076E9@ocpmta2.freegates.net>
In-Reply-To: <3EF1353C.8030705@bluehash.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Some 2.5-testing
To: =?ISO-8859-1?Q?R=FCdiger=20Scholz?= <r.scholz@bluehash.de>,
	parisc-linux@lists.parisc-linux.org
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

I do not yet tested 2.5 (or so faraway) but this message:
>     md: linear personality registered as nr 1
>    Badness in local_bh_enable at at kernel/softirq.c:109

seems to point out md support (ie raid support).
Do you already try to rebuild and re-try a kernel without this support?

Joel



---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be

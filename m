Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0EDA4829
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 08:58:46 -0600 (MDT)
Date: Tue, 27 Apr 2004 10:57:41 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian
	unstable	compiler...
Message-ID: <20040427145741.GD14937@baldric.uwo.ca>
References: <20040421115522.GH28094@baldric.uwo.ca>
	<408D43600000049A@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <408D43600000049A@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Here is my weekly test: cvs 20040426.
> Nothing new to mention: always well known errors collected after make -k
> check. I just build a 2.6.6-_rc2_-pa2 (for the fun) without pb (which boot
> fine on my b180)

You aren't seeing a failure in tst-timer4?
Can you verify this by running tst-timer4 by hand and sending the output
ot the list?

c.

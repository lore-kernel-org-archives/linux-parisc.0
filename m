Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web21206.mail.yahoo.com (web21206.mail.yahoo.com [216.136.175.8])
	by dsl2.external.hp.com (Postfix) with SMTP id EBD7E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 00:35:40 -0700 (MST)
Message-ID: <20020102073539.99280.qmail@web21206.mail.yahoo.com>
Date: Wed, 2 Jan 2002 08:35:39 +0100 (CET)
From: =?iso-8859-1?q?Hinrich=20Aue?= <hinrich_aue@yahoo.de>
Subject: [parisc-linux] DSL on a 715/80 with rp-pppoe
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020101233834.GA2872@sleepie.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

Ok, thats what i did.

Girst I had to make the ne2000 run. With pa27-Version
of the kernel the driver loaded without problems, and
I started.
The first big Problem was the missing /sbin/hotplug
script. That caused a massive trap15.
I first inserted a dummy script, but something else
was wrong, and I thought it was the dummy-script. So I
made apt-get install hotplug, which installed another
/sbin/hotplug script, but nothing changed of course.
Than I found an excellent howto (german one) 
http://www.adsl4linux.de
that helped me alot to configure stuff.

I think rp-pppoe performs better than pppoed, and is
much more stable.

I think the main Problem lies between my ears, because
I never installed debian, and it's hard to configure.

If somebody has questions, My email is H_Aue@t-online.de

__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Ihre E-Mail noch individueller? - http://domains.yahoo.de

Return-Path: <paul@doorslam.net>
Received: from ns.lucifier.net (ns.lucifier.net [66.114.66.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C1BE484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 19 Dec 2003 02:29:06 -0700 (MST)
Received: from doorslam.net (port-212-202-169-196.reverse.qdsl-home.de
	[212.202.169.196])
	by ns.lucifier.net (8.12.9/8.12.9) with ESMTP id hBJ9SlqQ004867
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 19 Dec 2003 04:28:49 -0500 (EST)
Received: from blinder.doorslam.net (paul@localhost [127.0.0.1])
	by doorslam.net (8.12.10/8.12.2) with ESMTP id hBJ9SEei012323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 19 Dec 2003 10:28:30 +0100 (CET)
Received: (from paul@localhost)
	by blinder.doorslam.net (8.12.10/8.12.1/Submit) id hBJ9SEZr010519
	for parisc-linux@lists.parisc-linux.org;
	Fri, 19 Dec 2003 10:28:14 +0100 (CET)
Date: Fri, 19 Dec 2003 10:28:14 +0100
From: Paul Weissmann <paul@doorslam.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031219092814.GA1094@blinder.doorslam.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Maximum RAM sizes on B1xxL, C1xx/C2xx
Reply-To: paul@doorslam.net
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,
	I'm confused on the maximum RAM sizes systems like e.g.
B132L, C110, C200 can faciliate.

The C110 for example has eight SIMM slots, official HP manuals for
this system state that the maximum amount of RAM is 512MB, ie 8x64MB.
Other documents I found on the web state that this machine maxes out
at 2GB, ie 8x256MB.

There are HP 50/60ns EDO ECC SIMMs which would fit these machines in
sizes up to 256MB easily available to buy.

I suspect at the time of printing of the user/tech manuals, certain SIMM
sizes just weren't available.

So, concluding, does anyone here knows if there is a hard, tested
limit of RAM one can put and use in one of the following models:

 o B1xxL (6 slots),
 o C100/C110 (8 slots),
 o C132L/C160L (12 slots),
 o C160/C180 (12 slots),
 o C200/C240/C360 (12 slots).

Or, better, what would speak against populating all available slots
with 256MB SIMMs?

Thanks.

        - paul

-- 
   zwei jaeger treffen sich. beide tot.

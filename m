Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D44CA494E
	for <parisc-linux@parisc-linux.org>; Tue, 26 Aug 2003 10:00:41 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19rgFM-0002k1-Lj
	for parisc-linux@parisc-linux.org; Tue, 26 Aug 2003 17:00:40 +0100
Date: Tue, 26 Aug 2003 17:00:40 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030826160040.GM22294@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] linux -> linux-2.4 transition
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

Earlier today I moved linux to linux-2.4 and set a compatibility symlink
so everything will work for the moment.  I've updated the web pages
with instructions to use linux-2.4 instead.  In the build-tools module,
you'll now find a little shell script that moves your checkout from linux
to linux-2.4.  Please run it as soon as convenient.

I intend to remove the `linux' symlink in a week's time.  At that point
any unconverted repositories will stop working.

Any problems, let me know.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

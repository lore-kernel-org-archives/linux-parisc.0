Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07A2C4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 07:16:31 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18YRrh-0002FZ-00; Tue, 14 Jan 2003 14:16:29 +0000
Date: Tue, 14 Jan 2003 14:16:29 +0000
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-snapshot problem [was: new gcc-default for hppa]
Message-ID: <20030114141629.U26554@parcelfarce.linux.theplanet.co.uk>
References: <3DED9A66000057DD@ocpmta3.freegates.net> <200301141354.h0EDsNjn028670@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301141354.h0EDsNjn028670@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Tue, Jan 14, 2003 at 08:54:22AM -0500
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

On Tue, Jan 14, 2003 at 08:54:22AM -0500, John David Anglin wrote:
> > I have a look and in drivers/ide/ide-cd.h line 440 I found well:
> >     __u8 short slot_tabelen;
> > 
> > Any idea?
> 
> Look at the code after preprocessing with "-E" option.  This will
> show you the actual code where the fault occurs.

well, yeah, but the actual error's pretty clear.  you can't specify
two types for the same variable (__u8 is typedeffed to unsigned char).
unfortunately, gcc used to not even warn about this ;-(

the question is, what size is really wanted here?  i dunno, ask the
maintainer of that file.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

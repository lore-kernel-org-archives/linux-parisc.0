Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72EF94841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 22:04:15 -0700 (MST)
Date: Sun, 9 Nov 2003 21:07:32 -0800
From: Randolph Chung <tausq@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Joel Soete <soete.joel@tiscali.be>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
Message-ID: <20031110050732.GZ28967@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org> <3FAD6B1A.6060605@tiscali.be> <3FAE4639.6030200@tiscali.be> <20031109175735.GE2014@parcelfarce.linux.theplanet.co.uk> <3FAE8EA4.3050208@tiscali.be> <20031110044556.GB16478@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031110044556.GB16478@colo.lackof.org>
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

> What is "%R2" intended to be?
> Randolph pointed out this is broken before and I was wrong
> to commit this chunk to the 2.4 tree (I'm working on
> removing it now).

Just a clarification:

%R2 is not *wrong* -- it points to the right side of argument register 
2 (jda explained this in an earlier thread), but I am not 100% sure 
%R2 will do the right thing for a 32-bit build though -- if you are 
running on a pa1.1 machine and the register is only 32-bit, does %R2 
automatically do the right thing with 64-bit arguments?  I guess it's 
easy enough to tell by looking at the code gcc generates...

anyway, i think we should stick with the inline version of the code
too....

thx
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

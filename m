Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE458482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 05:21:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19dTIr-00024V-40; Fri, 18 Jul 2003 12:21:33 +0100
Date: Fri, 18 Jul 2003 12:21:33 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs [login aborted]?
Message-ID: <20030718112133.GO23808@parcelfarce.linux.theplanet.co.uk>
References: <3F056E95000037F7@ocpmta4.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F056E95000037F7@ocpmta4.freegates.net>
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

On Fri, Jul 18, 2003 at 07:27:43AM +0200, Joel Soete wrote:
> Hi pa,
> 
> Is it an actual cvs server pb or a local pb I could have:
> those last two days cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs
> "failed: Connection timed out"?

Hm, it's not working for me either:

willy@honeydew:~/kernel/pci-2.5$ cvs up Makefile 
cvs [update aborted]: connect to cvs.parisc-linux.org(192.25.206.14):2401 failed: Connection timed out
willy@honeydew:~/kernel/pci-2.5$ cat CVS/Root 
:pserver:anonymous@cvs.parisc-linux.org:/var/cvs

I think someone must have changed the firewall config because I can
reach port 2401 from localhost, but not from any other machine.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7FF4482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 06:25:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18sjlT-00014N-00; Tue, 11 Mar 2003 13:25:55 +0000
Date: Tue, 11 Mar 2003 13:25:55 +0000
From: Matthew Wilcox <willy@debian.org>
To: Morten Sickel <Morten.Sickel@nrpa.no>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] newbie which HP-UX binaries
Message-ID: <20030311132555.GE21234@parcelfarce.linux.theplanet.co.uk>
References: <54DE9A561AD20C4D9FF88B116965420E4E5EA9@postix.nrpa.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <54DE9A561AD20C4D9FF88B116965420E4E5EA9@postix.nrpa.no>
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

On Tue, Mar 11, 2003 at 01:10:28PM +0100, Morten Sickel wrote:
> I have an old HP712/80 box running 10.20 that I am thinking about running
> linux on. The only problem is that I have to run an old (7.1) Esri arc/info
> on the machine. I have seen in the faq that:
> 
> "We intend to support 4 binary formats: 
> HP/UX SOM 32 bit
> Linux ELF 32 bit
> HP/UX ELF 64 bit
> Linux ELF 64 bit
> " 

Sorry about that.  grant linuxcared up the FAQ and i didn't notice.
i just fixed it and the new entry reads as follows:

	# What binaries will PA-RISC Linux support?

	We currently only support 32-bit ELF executables. Initial bringup
	work was accomplished using HP-UX emulation, but that emulation
	has not been maintained. Eventually, we hope to have support for
	HP-UX 32-bit SOM executables working again, and add support for
	64-bit ELF executables, both Linux & HP-UX.

	We're not promising to get all HP-UX binaries running on Linux. In
	particular those which are multithreaded are unlikely to ever
	be supported.

Does that answer all your questions?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

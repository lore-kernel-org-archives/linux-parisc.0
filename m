Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8827A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 08:19:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Va2z-000405-00; Tue, 29 Jan 2002 15:19:45 +0000
Date: Tue, 29 Jan 2002 15:19:45 +0000
From: Matthew Wilcox <willy@debian.org>
To: HEISERER DANIEL <Daniel.Heiserer@bmw.de>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20020129151945.B3850@parcelfarce.linux.theplanet.co.uk>
References: <3C5676D9.E4B26D93@bmw.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C5676D9.E4B26D93@bmw.de>; from Daniel.Heiserer@bmw.de on Tue, Jan 29, 2002 at 11:18:01AM +0100
Subject: [parisc-linux] Re: octave2.1_2.1.35-6_hppa
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

On Tue, Jan 29, 2002 at 11:18:01AM +0100, HEISERER DANIEL wrote:
> Hi,
> a buddy pointed me to the debian build archive,
> because I had problems building a 64-bit octave executable
> on AP-RISC-2 HP-UX-11.11.

Unfortunately, we don't support 64-bit userspace on PA/Linux yet.

> Honestly I have no idea what the difference between ELF-64 and PA-RISC-2
> is.
> Are both 64 bit.

No.  PA-RISC 2.0 introduced some new instructions, but does not have to be
64-bit.  64-bit can be useful, but it can also slow down applications.  So
it's a tradeoff.

> Do you build this octave for 
> o linux on PA-Risc or also for
> o HP-UX-11.11 ????

We don't build binaries for HP-UX.  Some people have suggested starting a
new port to build binaries for proprietary unices sch as Solaris and HP-UX,
but nobody has actually done so yet.

-- 
Revolutions do not require corporate support.

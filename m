Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 516A6482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 12:54:52 -0600 (MDT)
Received: from dyn-33.linux.theplanet.co.uk ([195.92.244.33] helo=caramon.arm.linux.org.uk)
	by www.linux.org.uk with esmtp (Exim 3.13 #1)
	id 14qfyo-0001W1-00; Fri, 20 Apr 2001 19:50:06 +0100
Received: from flint.arm.linux.org.uk (IDENT:root@flint.arm.linux.org.uk [192.168.0.4])
	by caramon.arm.linux.org.uk (8.11.0/8.11.0) with ESMTP id f3KIo5b01850;
	Fri, 20 Apr 2001 19:50:05 +0100
Received: (from rmk@localhost)
	by flint.arm.linux.org.uk (8.11.0/8.11.0) id f3KIo4s06295;
	Fri, 20 Apr 2001 19:50:04 +0100
Date: Fri, 20 Apr 2001 19:50:04 +0100
From: Russell King <rmk@arm.linux.org.uk>
To: "Eric S. Raymond" <esr@thyrsus.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420195004.A5510@flint.arm.linux.org.uk>
References: <20010420101951.A6011@thyrsus.com> <E14qc9E-0001PW-00@the-village.bc.nu> <20010420105934.A6668@thyrsus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010420105934.A6668@thyrsus.com>; from esr@thyrsus.com on Fri, Apr 20, 2001 at 10:59:34AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 20, 2001 at 10:59:34AM -0400, Eric S. Raymond wrote:
> All right then.  I'm going to send you a bunch of dead-symbol cleanup
> patches.  I'll try to stay in the mainline code and out of the port
> trees.  Would you please do me the kindness of telling me which ones
> can go in and which ones you think have to go through maintainers?

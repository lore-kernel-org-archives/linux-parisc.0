Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E63C4856
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 10:50:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 195q7U-00041h-DS; Wed, 16 Apr 2003 17:50:48 +0100
Date: Wed, 16 Apr 2003 17:50:48 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030416165048.GC1505@parcelfarce.linux.theplanet.co.uk>
References: <3E9BA3A600000DC1@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E9BA3A600000DC1@ocpmta2.freegates.net>
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

On Wed, Apr 16, 2003 at 06:44:11PM +0200, Joel Soete wrote:
> Well I already create:
> a chunck containing debian-configs (I call it 00_parisc_debian-configs.patch)
> [about 140k] (would it be submited?)

No, I don't think this should be submitted.  No other architecture does this.

> another chunk containing all parisc specific (named 01_parisc.patch) containing
> arch/parisc, include/asm-parisc and another noticed "parisc specific" [about
> 160k]

sounds good.  be sure this applies to alan's/marcelo's tree as they've
taken updates since 2.4.20 was released.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

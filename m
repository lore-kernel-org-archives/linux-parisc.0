Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C9A24841
	for <parisc-linux@parisc-linux.org>; Sat,  8 Nov 2003 15:33:05 -0700 (MST)
Date: Sat, 8 Nov 2003 15:33:04 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was: do_page_fault?]
Message-ID: <20031108223304.GB28929@colo.lackof.org>
References: <3F969FFE00005DB3@ocpmta2.freegates.net> <3FACE5A4.7070003@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FACE5A4.7070003@tiscali.be>
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

On Sat, Nov 08, 2003 at 12:46:28PM +0000, Joel Soete wrote:
> But if I launch it a second time no more pb???
> Very strange isn't it?

Sounds like a cache coherency/aliasing problem.
Once you start looking at code, watch out for module loading
and shared memory maps type stuff.

grant

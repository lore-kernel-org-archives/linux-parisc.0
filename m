Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A33548CC
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 12:55:11 -0700 (MST)
Date: Fri, 30 Jan 2004 12:55:09 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE progress
Message-ID: <20040130195509.GA15482@colo.lackof.org>
References: <4015311000001F53@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4015311000001F53@ocpmta2.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Jan 28, 2004 at 07:05:14PM +0100, Joel Soete wrote:
> Well, i made some small progress: i reach to figure out that PAGE0 status
> changes between pdc_console_init() and pdc_io_getc():
....
> Is somebody have a small idea when this change could occurs?

PDC messes with page0 as well.
You have the read the PDC ERS for each PDC call to determine
what "side effects" it has. Consider Page Zero "shared mem"
for the guest OS (HPUX or Linux) and PDC.

grant

Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D8F7484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 09:13:18 -0700 (MST)
Date: Mon, 26 Jan 2004 09:13:16 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Reinhold Flecke CCF <reinhold.flecke@ccf-consulting.de>
Subject: Re: [parisc-linux] help installation failed on C240 (fx4) workstation
Message-ID: <20040126161316.GC12175@colo.lackof.org>
References: <LBEMKLBEFDGDOGGAOGIKOEJPCCAA.reinhold.flecke@ccf-consulting.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <LBEMKLBEFDGDOGGAOGIKOEJPCCAA.reinhold.flecke@ccf-consulting.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 26, 2004 at 12:13:22PM +0100, Reinhold Flecke CCF wrote:
> I downloaded the "debian-30r2-hppa-binary-1.iso" and burned it to CD. 
> If I start the installation on my C240 (fx4) workstation  with the command:
> bo sescsi.2.0

FX-4 graphics is not supported.
Either use serial console or replace the FX4 with PCI FX-E.

sorry,
grant

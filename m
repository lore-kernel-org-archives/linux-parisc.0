Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC5A6482A
	for <parisc-linux@parisc-linux.org>; Tue, 22 Jan 2002 13:09:31 -0700 (MST)
Date: Tue, 22 Jan 2002 19:59:09 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Trouble installing 0.9.3 on 735/99
Message-ID: <20020122195909.GD25314@sleepie.demon.co.uk>
References: <A8566E157F5FD411BCFB00D0B7816D51C72CD9@ntexchange.cat.csiro.au> <20020122141253.GB25314@sleepie.demon.co.uk> <20020122120548.M19637@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020122120548.M19637@systemhalted>
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

On Tue, Jan 22, 2002 at 12:05:48PM -0500, Carlos O'Donell Jr. wrote:
> I can't get any of the 715/50's to run stably with the newer
> SCSI driver. And after testing I can almost pinpoint with 95%
> accuracy tha it's the new driver.

Have you tried hacking the driver to disable tagged commands, or at
least to limit the maximum tagged cmds per device to something small?

Richard

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 14 Jul 2003 13:48:24 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.21-paX on an rp2430
Message-ID: <20030714194824.GD23545@dsl2.external.hp.com>
References: <20030714182347.GC14114@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030714182347.GC14114@systemhalted>
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

On Mon, Jul 14, 2003 at 02:23:47PM -0400, Carlos O'Donell wrote:
> Has anyone tried testing the prebuilt kernels on newer machines?

sorry - I still build my own to test my own changes.

> I also tried a newer vmlinux-2.4.20-pa10-UP and the kernel oopses :(

i've uploaded a *PRE-RELEASE* 2.4.21-pa5.tgz to:
	ftp://ftp.parisc-linux.org/kernels/a500/2.4.21-pa5.tgz

This boots and runs on my a500-65 and recent rp2430s.

FYI, I used lifimage-2.4.20-pa35-20030513 which I think
came from the ESIEE web site. Should be available from ftp.p-l.o
as well.

grant

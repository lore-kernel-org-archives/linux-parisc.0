Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 4 Jul 2003 13:10:42 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030704191042.GB7885@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] binutils_2.14.90 bug
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

Hi binutils lovers,

I can't build a 32-bit parisc kernel with binutils*2.14.90.0.4-0.1_hppa.deb
packages.  It dies with an error in arch/parisc/kernel/real2.S:

real2.S:126: Error: too many positional arguments

The offending line reads:
        load32  PA(save_cr_space + (N_SAVED_REGS * REG_SZ)), %r26

this gets reduced to:
        load32  ((save_cr_space + (9 * 4))-(0x10000000)), %r26


Older binutils*_2.12.90.0.1-4_hppa.deb works.

grant

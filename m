From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] glibc 2.3.2 hppa - Requires Rminkernel patch to catch < 2.4.17 users.
Date: Wed, 22 Oct 2003 00:32:27 -0400
Message-ID: <20031022043227.GD20912__28225.1240140342$1416622899$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: Jeff Bailey <jbailey@nisa.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Jeff,

glibc-package/debian/patches/glibc23-hppa-Rminkernel.dpatch

Has to go back into the list of patches, since it will keep users
running their boxes with 2.4.17 or later based kernels instead of
2.4.19. Developer testing didn't catch this since we all run >2.4.19.

Please and thank you!

I'm doing the patches for the -rnptl branch right now, if I had paid
attention I would have tried harder to queue this up earlier so it could
have gone out on the recent release.

c.

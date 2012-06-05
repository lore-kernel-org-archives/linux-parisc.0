From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 0/3] fix recent parisc build breakages
Date: Tue, 05 Jun 2012 13:47:59 +0900
Message-ID: <1338871679.5176.7.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I was hoping that 3.5-rc1 would allow us to build perfectly.
Unfortunately, there were three compile breakages introduced in the last
few days of the merge window, so these are the three fixes

James Bottomley (3):
      fix missing TAINT_WARN problem
      fix compile break in use of lib/strncopy_from_user.c
      fix code to find libgcc

 arch/parisc/Makefile           |    3 ++-
 arch/parisc/include/asm/Kbuild |    1 +
 arch/parisc/include/asm/bug.h  |    2 ++
 3 files changed, 5 insertions(+), 1 deletions(-)


James



From: Babu Moger <babu.moger@oracle.com>
Subject: [PATCH 0/2] Fix duplicates and change default endian for microblaze
Date: Mon, 18 Sep 2017 10:53:27 -0600
Message-ID: <1505753609-602923-1-git-send-email-babu.moger@oracle.com>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org, babu.moger@oracle.com
To: monstr@monstr.eu, jejb@parisc-linux.org, deller@gmx.de,
        davem@davemloft.net, akpm@linux-foundation.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This series fixes few Kconfig issues.

Babu Moger (2):
  arch: Fix duplicates in Kconfig for parisc and sparc
  arch: change default endian for microblaze

 arch/microblaze/Kconfig |    2 +-
 arch/parisc/Kconfig     |    3 ---
 arch/sparc/Kconfig      |    3 ---
 3 files changed, 1 insertions(+), 7 deletions(-)

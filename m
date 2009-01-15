From: dann frazier <dannf@hp.com>
Subject: [PATCH 7/9] remove unnecessary ret variable
Date: Thu, 15 Jan 2009 16:46:54 -0700
Message-ID: <55691aea931c081791b3daa370e1eb961748cf78.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
 <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
 <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
 <9b29163437fb37dc4996b17bcdb41192dbc79e9a.1231983599.git.dannf@hp.com>
 <a1d5a8a954f9c5e9f014bb0ff3285b04d9aa96e4.1231983599.git.dannf@hp.com>
 <8c4b31bbd7552995774e6b94db365d1f4b04f226.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <8c4b31bbd7552995774e6b94db365d1f4b04f226.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Signed-off-by: dann frazier <dannf@hp.com>
---
 arch/parisc/kernel/time.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index a479d08..e75cae6 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -223,10 +223,7 @@ static struct platform_device rtc_parisc_dev = {
 
 static int __init rtc_init(void)
 {
-	int ret;

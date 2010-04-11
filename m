From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] Delete unnecessary nop's in entry.S
Date: Sun, 11 Apr 2010 13:08:51 -0400
Message-ID: <20100411170851.GB7756@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="oC1+HKm2/end4ao3"
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 09 Apr 2010, Carlos O'Donell wrote:

> We need to start splitting up your giant "stability" patch into
> manageable chunks.

Here's the third chunk.  It removes some unnecessary nop's.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="entry.S.d.1"

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..a7e9472 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -997,13 +978,6 @@ intr_restore:
 
 	rfi
 	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
 
 #ifndef CONFIG_PREEMPT
 # define intr_do_preempt	intr_restore

--oC1+HKm2/end4ao3--

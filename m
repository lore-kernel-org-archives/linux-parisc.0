From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] Avoid interruption in critical region in entry.S
Date: Sun, 11 Apr 2010 13:12:56 -0400
Message-ID: <20100411171255.GC7756@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ghzN8eJ9Qlbqn3iT"
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 09 Apr 2010, Carlos O'Donell wrote:

> We need to start splitting up your giant "stability" patch into
> manageable chunks.

Here's the fourth chunk.  Am I being paranoid?

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="entry.S.d.2"

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..a7e9472 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2076,9 +2051,10 @@ syscall_restore:
 	LDREG	TASK_PT_GR31(%r1),%r31	   /* restore syscall rp */
 
 	/* NOTE: We use rsm/ssm pair to make this operation atomic */
+	LDREG   TASK_PT_GR30(%r1),%r1              /* Get user sp */
 	rsm     PSW_SM_I, %r0
-	LDREG   TASK_PT_GR30(%r1),%r30             /* restore user sp */
-	mfsp	%sr3,%r1			   /* Get users space id */
+	copy    %r1,%r30                           /* Restore user sp */
+	mfsp    %sr3,%r1                           /* Get user space id */
 	mtsp    %r1,%sr7                           /* Restore sr7 */
 	ssm     PSW_SM_I, %r0
 

--ghzN8eJ9Qlbqn3iT--

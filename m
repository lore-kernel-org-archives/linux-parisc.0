From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] ALSA Harmony bugfixes
Date: Fri, 27 Aug 2004 13:54:14 +0100
Message-ID: <20040827125414.GA5515@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Two patches for the ALSA Harmony driver:

   One fixes a crash when reloading the ALSA Harmony driver.
   The other is a minor cleanup for formats/rates.

--- linux-2.6/sound/parisc/harmony.c	2004-08-26 07:36:02.066664310 +0100
+++ linux-2.6/sound/parisc/harmony.c	2004-08-26 07:46:34.221250320 +0100
@@ -1111,11 +1111,13 @@
 		{	
 			DPRINTK(KERN_INFO PFX "Freeing card %d\n", idx);
 			harmony = snd_harmony_cards[idx]->private_data;
-			free_irq(harmony->irq, snd_card_harmony_interrupt);
+			free_irq(harmony->irq, harmony);
 			printk(KERN_INFO PFX "Card unloaded %d, irq=%d\n", idx, harmony->irq);
 			snd_card_free(snd_harmony_cards[idx]);
 		}
 	}	
+	if (unregister_parisc_driver(&snd_card_harmony_driver) < 0)
+		printk(KERN_ERR "Failed to unregister Harmony driver\n");
 }
 
 module_init(alsa_card_harmony_init)


--- linux-2.6/sound/parisc/harmony.c	2004-08-26 07:36:02.066664310 +0100
+++ linux-2.6/sound/parisc/harmony.c	2004-08-26 07:41:26.158761888 +0100
@@ -283,7 +283,7 @@
 {
 	unsigned int idx;
 	
-	for (idx = 0; idx <= RATES; idx++)
+	for (idx = 0; idx < RATES; idx++)
 		if (snd_card_harmony_rates[idx] == rate)
 			return rate_bits[idx];
 	return HARMONY_SR_44KHZ; /* fallback */
@@ -648,10 +648,10 @@
 					SNDRV_PCM_INFO_JOINT_DUPLEX | 
 					SNDRV_PCM_INFO_MMAP_VALID |
 					SNDRV_PCM_INFO_BLOCK_TRANSFER),
-	.formats =		(SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S16_BE | 
-					SNDRV_PCM_FMTBIT_A_LAW | SNDRV_PCM_FMTBIT_MU_LAW),
+	.formats =		(SNDRV_PCM_FMTBIT_MU_LAW | SNDRV_PCM_FMTBIT_A_LAW |
+					SNDRV_PCM_FMTBIT_S16_BE),
 	.rates =		SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_48000,
-	.rate_min =		5500,
+	.rate_min =		5125,
 	.rate_max =		48000,
 	.channels_min =		1,
 	.channels_max =		2,

-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

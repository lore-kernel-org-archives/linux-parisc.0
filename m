From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Subject: [parisc-linux] [PATCH] Harmony Driver
Date: Sat, 15 May 2004 10:42:44 +0200
Message-ID: <40A5D804.6060003@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------000509060400010703070606"
To: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------000509060400010703070606
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

here is a patch to bring the driver for harmony up to the current state 
of the ALSA CVS. It compiles cleanly and also didn't crash my 715/100 
when built-in (I haven't tried to built it as module. )  During boot-up 
harmony is detected correctly (means no error messages), but much more 
didn't work. It's not possible change the volume setting, and playback 
also didn't work.
But I think, these failures are easier to solve if the driver can be 
compiled and tested. So please can s.o. with higher knowledge of linux 
and parisc than me check this patch and commit it to CVS?

Thanks,
Ruediger

--------------000509060400010703070606
Content-Type: text/plain;
 name="harmony.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="harmony.diff"

Index: linux-2.6/sound/parisc/harmony.c
===================================================================
RCS file: /var/cvs/linux-2.6/sound/parisc/harmony.c,v
retrieving revision 1.6
diff -u -p -r1.6 harmony.c
--- a/linux-2.6/sound/parisc/harmony.c	4 Apr 2004 15:30:21 -0000	1.6
+++ b/linux-2.6/sound/parisc/harmony.c	15 May 2004 08:25:56 -0000
@@ -56,11 +56,7 @@
  * also controls for enabling/disabling internal speaker and line
  * input.
  *
- * Buffers used by this driver are all DMA consistent. Since harmony is
- * not "real" pci device, we use a fake struct pci_dev for
- * pci_alloc_consistent().
- * (note that some machines -712 for ex.- don't implement DMA consistent
- * memory, so we will need to use kmalloc instead)
+ * Buffers used by this driver are all DMA consistent.
  */
 
 #include <linux/delay.h>
@@ -70,11 +66,11 @@
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <linux/wait.h>
+#include <linux/moduleparam.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/pcm.h>
 #include <sound/rawmidi.h>
-#define SNDRV_GET_ID
 #include <sound/initval.h>
 #include <sound/info.h>
 #include <asm/hardware.h>
@@ -100,16 +96,14 @@ MODULE_DEVICES("{{ALSA,Harmony soundcard
 #define MAX_PCM_SUBSTREAMS	4
 #define MAX_MIDI_DEVICES	0
 
-#define BUFFER_SIZE			4096
-#define MAX_BUFS			10
+#define HARMONY_BUF_SIZE	4096
+#define MAX_BUFS		10
+#define MAX_BUFFER_SIZE		(MAX_BUFS * HARMONY_BUF_SIZE)
 
 /* number of silence & graveyard buffers */
 #define GRAVEYARD_BUFS		3
 #define SILENCE_BUFS		3
 
-#define MAX_BUFFER_SIZE		(MAX_BUFS * BUFFER_SIZE)
-#define HARMONY_BUF_SIZE	BUFFER_SIZE
-
 #define HARMONY_CNTL_C		0x80000000
 
 #define HARMONY_DSTATUS_PN	0x00000200
@@ -140,6 +134,17 @@ MODULE_DEVICES("{{ALSA,Harmony soundcard
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
 static int enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE;
+static int boot_devs;
+
+module_param_array(index, int, boot_devs, 0444);
+MODULE_PARM_DESC(index, "Index value for Sun CS4231 soundcard.");
+MODULE_PARM_SYNTAX(index, SNDRV_INDEX_DESC);
+module_param_array(id, charp, boot_devs, 0444);
+MODULE_PARM_DESC(id, "ID string for Sun CS4231 soundcard.");
+MODULE_PARM_SYNTAX(id, SNDRV_ID_DESC);
+module_param_array(enable, bool, boot_devs, 0444);
+MODULE_PARM_DESC(enable, "Enable Sun CS4231 soundcard.");
+MODULE_PARM_SYNTAX(enable, SNDRV_ENABLE_DESC);
 
 /* Register offset (from base hpa) */
 #define REG_ID		0x00
@@ -191,21 +196,18 @@ typedef struct snd_card_harmony {
 	int cap_stopped;
 	int cap_total;
 
-	struct pci_dev *fake_pci_dev; /* The fake pci_dev needed for 
-					pci_* functions under ccio. */
+	struct parisc_device *pa_dev;
+
+	struct snd_dma_device dma_dev;
 
 	/* the graveyard buffer is used as recording buffer when playback, 
 	 * because harmony always want a buffer to put recorded data */
-
-	unsigned char *graveyard_addr;
-	dma_addr_t graveyard_dma;
+	struct snd_dma_buffer graveyard_dma;
 	int graveyard_count;
 	
 	/* same thing for silence buffer */
-	unsigned char *silence_addr;
-	dma_addr_t silence_dma;
+	struct snd_dma_buffer silence_dma;
 	int silence_count;
-	struct snd_dma_device dma_dev;
 
 	/* alsa stuff */
 	snd_card_t *card;
@@ -264,6 +266,15 @@ static snd_pcm_hw_constraint_list_t hw_c
 #define HARMONY_SR_33KHZ	0x16
 #define HARMONY_SR_6KHZ		0x17
 
+/* bits corresponding to the entries of snd_card_harmony_rates */
+static unsigned int rate_bits[14] = {
+	HARMONY_SR_5KHZ, HARMONY_SR_6KHZ, HARMONY_SR_8KHZ,
+	HARMONY_SR_9KHZ, HARMONY_SR_11KHZ, HARMONY_SR_16KHZ,
+	HARMONY_SR_18KHZ, HARMONY_SR_22KHZ, HARMONY_SR_27KHZ,
+	HARMONY_SR_32KHZ, HARMONY_SR_33KHZ, HARMONY_SR_37KHZ,
+	HARMONY_SR_44KHZ, HARMONY_SR_48KHZ
+};
+
 /* snd_card_harmony_rate_bits
  * @rate:	index of current data rate in list
  * returns: harmony hex code for registers
@@ -273,26 +284,9 @@ static unsigned int snd_card_harmony_rat
 	unsigned int idx;
 	
 	for (idx = 0; idx <= RATES; idx++)
-		if (snd_card_harmony_rates[idx] == rate) break;
-	
-	switch (idx) {
-		case 0: return HARMONY_SR_5KHZ;
-		case 1: return HARMONY_SR_6KHZ;
-		case 2: return HARMONY_SR_8KHZ;
-		case 3: return HARMONY_SR_9KHZ;
-		case 4: return HARMONY_SR_11KHZ;
-		case 5: return HARMONY_SR_16KHZ;
-		case 6: return HARMONY_SR_18KHZ;
-		case 7: return HARMONY_SR_22KHZ;
-		case 8: return HARMONY_SR_27KHZ;
-		case 9: return HARMONY_SR_32KHZ;
-		case 10: return HARMONY_SR_33KHZ;
-		case 11: return HARMONY_SR_37KHZ;
-		case 12: return HARMONY_SR_44KHZ;
-		case 13: return HARMONY_SR_48KHZ;
-		default:  /* fallback */
-				return HARMONY_SR_44KHZ;
-	}
+		if (snd_card_harmony_rates[idx] == rate)
+			return rate_bits[idx];
+	return HARMONY_SR_44KHZ; /* fallback */
 }
 
 /*
@@ -317,27 +311,6 @@ void snd_harmony_update_control(snd_card
 }
 
 /*
- * silence a buffer
- * XXX: alsa could probably do this by itself
- * XXX: memset hpmc, commented.
- */
-
-void snd_harmony_silence(snd_card_harmony_t *harmony,
-		void *addr, int length)
-{
-	u8 silence_char;
-	
-	switch(harmony->data_format) {
-			case HARMONY_DF_8BIT_ULAW: silence_char = 0x55; break;
-			case HARMONY_DF_8BIT_ALAW: silence_char = 0xff; break;
-			case HARMONY_DF_16BIT_LINEAR:
-			default:
-									   silence_char = 0;
-	}
-	//memset(addr, silence_char, length);
-}
-
-/*
  * interruption controls routines
  */
 
@@ -385,9 +358,9 @@ static int snd_card_harmony_interrupt(in
 			snd_pcm_period_elapsed(harmony->playback_substream);
 			harmony->ply_total++;
 		} else {
-			gsc_writel(harmony->silence_dma + 
-					(HARMONY_BUF_SIZE*harmony->silence_count),
-					hpa+REG_PNXTADD);
+			gsc_writel(harmony->silence_dma.addr + 
+				   (HARMONY_BUF_SIZE*harmony->silence_count),
+				   hpa+REG_PNXTADD);
 			harmony->silence_count++;
 			harmony->silence_count %= SILENCE_BUFS;
 		}
@@ -406,9 +379,9 @@ static int snd_card_harmony_interrupt(in
 			harmony->cap_total++;
 		} else {
 			/* graveyard buffer */
-			gsc_writel(harmony->graveyard_dma +
-						(HARMONY_BUF_SIZE*harmony->graveyard_count),
-						hpa+REG_RNXTADD);
+			gsc_writel(harmony->graveyard_dma.addr +
+				   (HARMONY_BUF_SIZE*harmony->graveyard_count),
+				   hpa+REG_RNXTADD);
 			harmony->graveyard_count++;
 			harmony->graveyard_count %= GRAVEYARD_BUFS;
 		}
@@ -465,26 +438,8 @@ static void __devinit snd_harmony_proc_i
 {
 	snd_info_entry_t *entry;
 	
-	if ((entry = snd_info_create_card_entry(harmony->card, "harmony", harmony->card->proc_root)) != NULL) {
-		entry->content = SNDRV_INFO_CONTENT_TEXT;
-		entry->private_data = harmony;
-		entry->mode = S_IFREG | S_IRUGO | S_IWUSR;
-		entry->c.text.read_size = 2048;	 /* should be enough */
-		entry->c.text.read = snd_harmony_proc_read;
-		if (snd_info_register(entry) < 0) {
-			snd_info_free_entry(entry);
-			entry = NULL;
-		}
-	}
-	harmony->proc_entry = entry;
-}
-
-static void snd_harmony_proc_done(snd_card_harmony_t *harmony)
-{
-	if (harmony->proc_entry) {
-		snd_info_unregister(harmony->proc_entry);
-		harmony->proc_entry = NULL;
-	}
+	if (! snd_card_proc_new(harmony->card, "harmony", &entry))
+		snd_info_set_text_ops(entry, harmony, 2048, snd_harmony_proc_read);
 }
 
 /* 
@@ -563,6 +518,30 @@ static int snd_card_harmony_capture_trig
 	return 0;
 }
 
+/* set data format */
+static int snd_harmony_set_data_format(snd_card_harmony_t *harmony, int pcm_format)
+{
+	int old_format = harmony->data_format;
+	int new_format = old_format;
+	switch (pcm_format) {
+	case SNDRV_PCM_FORMAT_S16_BE:
+		new_format = HARMONY_DF_16BIT_LINEAR;
+		break;
+	case SNDRV_PCM_FORMAT_A_LAW:
+		new_format = HARMONY_DF_8BIT_ALAW;
+		break;
+	case SNDRV_PCM_FORMAT_MU_LAW:
+		new_format = HARMONY_DF_8BIT_ULAW;
+		break;
+	}
+	/* re-initialize silence buffer if needed */
+	if (old_format != new_format)
+		snd_pcm_format_set_silence(pcm_format, harmony->silence_dma.area,
+					   (HARMONY_BUF_SIZE * SILENCE_BUFS * 8) / snd_pcm_format_width(pcm_format));
+
+	return new_format;
+}
+
 static int snd_card_harmony_playback_prepare(snd_pcm_substream_t * substream)
 {
 	snd_card_harmony_t *harmony = snd_pcm_substream_chip(substream);
@@ -577,12 +556,13 @@ static int snd_card_harmony_playback_pre
 	harmony->sample_rate = snd_card_harmony_rate_bits(runtime->rate);
 
 	/* data format */
-	if (snd_pcm_format_width(runtime->format) == 16) harmony->data_format = HARMONY_DF_16BIT_LINEAR;
-	else harmony->data_format = HARMONY_DF_8BIT_ULAW;
-	
+	harmony->data_format = snd_harmony_set_data_format(haromny, runtime->format);
+
 	/* number of channels */
-	if (runtime->channels == 2) harmony->stereo_select = HARMONY_SS_STEREO;
-	else harmony->stereo_select = HARMONY_SS_MONO;
+	if (runtime->channels == 2)
+		harmony->stereo_select = HARMONY_SS_STEREO;
+	else
+		harmony->stereo_select = HARMONY_SS_MONO;
 	
 	DPRINTK(KERN_INFO PFX "Playback_prepare, sr=%d(%x), df=%x, ss=%x hpa=%lx\n", runtime->rate,
 				harmony->sample_rate, harmony->data_format, harmony->stereo_select, harmony->hpa);
@@ -607,12 +587,13 @@ static int snd_card_harmony_capture_prep
 	harmony->sample_rate = snd_card_harmony_rate_bits(runtime->rate);
 	
 	/* data format */
-	if (snd_pcm_format_width(runtime->format) == 16) harmony->data_format = HARMONY_DF_16BIT_LINEAR;
-	else harmony->data_format = HARMONY_DF_8BIT_ULAW;
+	harmony->data_format = snd_harmony_set_data_format(haromny, runtime->format);
 	
 	/* number of channels */
-	if (runtime->channels == 1) harmony->stereo_select = HARMONY_SS_MONO;
-	else if (runtime->channels == 2) harmony->stereo_select = HARMONY_SS_STEREO;
+	if (runtime->channels == 1)
+		harmony->stereo_select = HARMONY_SS_MONO;
+	else if (runtime->channels == 2)
+		harmony->stereo_select = HARMONY_SS_STEREO;
 		
 	snd_harmony_update_control(harmony);
 	harmony->format_initialized = 1;
@@ -709,13 +690,6 @@ static int snd_card_harmony_playback_ope
 	snd_pcm_runtime_t *runtime = substream->runtime;
 	int err;
 	
-	/*
-	 * harmony is not "real" pci, but we need a pci_dev
-	 * to alloc PCI DMA pages
-	 */
-	substream->runtime->dma_private = harmony->fake_pci_dev;
-//	substream->dma_type = SNDRV_PCM_DMA_TYPE_PCI;
-	
 	harmony->playback_substream = substream;
 	runtime->hw = snd_card_harmony_playback;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraint_rates);
@@ -732,14 +706,6 @@ static int snd_card_harmony_capture_open
 	snd_pcm_runtime_t *runtime = substream->runtime;
 	int err;
 	
-	
-	/*
-	 * harmony is not "real" pci, but we need a pci_dev
-	 * to alloc PCI DMA pages
-	 */
-	substream->runtime->dma_private = harmony->fake_pci_dev;
-//	substream->dma_type = SNDRV_PCM_DMA_TYPE_PCI;
-
 	harmony->capture_substream = substream;
 	runtime->hw = snd_card_harmony_capture;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraint_rates);
@@ -752,7 +718,6 @@ static int snd_card_harmony_capture_open
 static int snd_card_harmony_playback_close(snd_pcm_substream_t * substream)
 {
 	snd_card_harmony_t *harmony = snd_pcm_substream_chip(substream);
-	snd_pcm_lib_free_pages(substream);
 	
 	harmony->playback_substream = NULL;
 	harmony->ply_size 			= 0;
@@ -769,8 +734,6 @@ static int snd_card_harmony_capture_clos
 {
 	snd_card_harmony_t *harmony = snd_pcm_substream_chip(substream);
 	
-	snd_pcm_lib_free_pages(substream);
-	
 	harmony->capture_substream = NULL;
 	harmony->cap_size 			= 0;
 	harmony->cap_buf			= 0;
@@ -785,12 +748,11 @@ static int snd_card_harmony_capture_clos
 static int snd_card_harmony_hw_params(snd_pcm_substream_t *substream, 
 	                   snd_pcm_hw_params_t * hw_params)
 {
-	snd_pcm_runtime_t *runtime = substream->runtime;
 	int err;
 	
 	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	DPRINTK(KERN_INFO PFX "HW Params returned %d, dma_addr %lx\n", err,
-			(unsigned long)runtime->dma_addr);
+			(unsigned long)substream->runtime->dma_addr);
 	return err;
 }
 
@@ -847,15 +809,19 @@ static int snd_card_harmony_pcm_init(snd
 	harmony->pcm = pcm;
 	
 	/* initialize graveyard buffer */
-	harmony->dma_dev.type = SNDRV_DMA_TYPE_PCI;
-	harmony->dma_dev.dev = snd_dma_pci_data(harmony->fake_pci_dev); 
-	harmony->graveyard_addr = snd_dma_alloc_pages(&chip->dma_dev,
-			HARMONY_BUF_SIZE*GRAVEYARD_BUFS, &harmony->graveyard_dma);
+	harmony->dma_dev.type = SNDRV_DMA_TYPE_DEV;
+	harmony->dma_dev.dev = &harmony->pa_dev->dev;
+	err = snd_dma_alloc_pages(&harmony->dma_dev, HARMONY_BUF_SIZE*GRAVEYARD_BUFS,
+				  &harmony->graveyard_dma);
+	if (err < 0)
+		return err;
 	harmony->graveyard_count = 0;
 	
 	/* initialize silence buffers */
-	harmony->silence_addr = snd_dma_alloc_pages(&chip->dma_dev,
-			HARMONY_BUF_SIZE*SILENCE_BUFS, &harmony->silence_dma);
+	err = snd_dma_alloc_pages(&harmony->dma_dev, HARMONY_BUF_SIZE*SILENCE_BUFS,
+				  &harmony->silence_dma);
+	if (err < 0)
+		return err;
 	harmony->silence_count = 0;
 
 	harmony->ply_stopped = harmony->cap_stopped = 1;
@@ -865,8 +831,8 @@ static int snd_card_harmony_pcm_init(snd
 	harmony->graveyard_count = 0;
 	
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(harmony->fake_pci_dev),
-					      64 * 1024, 128 * 1024);
+					      &harmony->pa_dev->dev,
+					      MAX_BUFFER_SIZE, MAX_BUFFER_SIZE);
 
 	return 0;
 }
@@ -963,7 +929,7 @@ HARMONY_VOLUME("Master Volume", 20, 20, 
 HARMONY_VOLUME("PCM Playback Volume", 6, 0, 0x3f, 1),
 };
 
-static void snd_harmony_reset_codec(snd_card_harmony_t *harmony)
+static void __init snd_harmony_reset_codec(snd_card_harmony_t *harmony)
 {
  	snd_harmony_wait_cntl(harmony);
 	gsc_writel(1, harmony->hpa+REG_RESET);
@@ -985,7 +951,7 @@ static void __init snd_harmony_mixer_res
 }
 
 
-int __init snd_card_harmony_mixer_init(snd_card_harmony_t *harmony)
+static int __init snd_card_harmony_mixer_init(snd_card_harmony_t *harmony)
 {
 	snd_card_t *card = harmony->card;
 	int idx, err;
@@ -1009,10 +975,11 @@ static int snd_card_harmony_create(snd_c
 	
 	harmony->card = card;
 	
+	harmony->pa_dev = pa_dev;
+
 	/* Set the HPA of harmony */
 	harmony->hpa = pa_dev->hpa;
 	
-
 	harmony->irq = pa_dev->irq;
 	if (!harmony->irq) {
 		printk(KERN_ERR PFX "no irq found\n");
@@ -1038,8 +1005,6 @@ static int snd_card_harmony_create(snd_c
 		return -EBUSY;
 	}
 	
-	/* a fake pci_dev is needed for pci_* functions under ccio */
-	harmony->fake_pci_dev = ccio_get_fake(pa_dev);
 	return 0;
 }
 	
@@ -1050,7 +1015,7 @@ static int __init snd_card_harmony_probe
 	snd_card_t *card;
 	int err;
 	
-    if (dev >= SNDRV_CARDS)
+	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
 	if (!enable[dev]) {
 		dev++;
@@ -1064,6 +1029,8 @@ static int __init snd_card_harmony_probe
 	if (card == NULL)
 		return -ENOMEM;
 	chip = (struct snd_card_harmony *)card->private_data;
+	spin_lock_init(&chip->control_lock);
+	spin_lock_init(&chip->mixer_lock);
 	
 	if ((err = snd_card_harmony_create(card, pa_dev, chip)) < 0) {
 		printk(KERN_ERR PFX "Creation failed\n");
@@ -1144,7 +1111,6 @@ static void __exit alsa_card_harmony_exi
 		{	
 			DPRINTK(KERN_INFO PFX "Freeing card %d\n", idx);
 			harmony = snd_harmony_cards[idx]->private_data;
-			snd_harmony_proc_done(harmony);
 			free_irq(harmony->irq, snd_card_harmony_interrupt);
 			printk(KERN_INFO PFX "Card unloaded %d, irq=%d\n", idx, harmony->irq);
 			snd_card_free(snd_harmony_cards[idx]);

--------------000509060400010703070606
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------000509060400010703070606--

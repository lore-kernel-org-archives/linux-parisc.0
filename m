From: Helge Deller <deller@gmx.de>
Subject: Re: commit mail stuff
Date: Fri, 30 Jan 2009 21:27:50 +0100
Message-ID: <498362C6.5060309@gmx.de>
References: <20090121143130.GC27998@bombadil.infradead.org> <7d01f9f00901220323u2898ae25hf149c65956fc2a4e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Thibaut VARENE <varenet@parisc-linux.org>,
	Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00901220323u2898ae25hf149c65956fc2a4e@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thibaut VARENE wrote:
> On Wed, Jan 21, 2009 at 3:31 PM, Kyle McMartin <kyle@infradead.org> wrote:
> 
>> commit 1890e15142aa1318bb9775c4ea021aa022c506dc
>> Author: Helge Deller <deller@gmx.de>
>> Date:   Tue Jan 6 14:23:13 2009 +0100
>>
>>    parisc: blink loadavg LEDs on Oops
>>
> 
> I thought we agreed this was a bad idea and that this patch should be
> left aside?
> Helge?

Yes, that was an idea.
But we can easily detect which kind of machine it is, and then
either blink all LEDs or just the loadavg. LEDs. The patch below
does this and should be then fine for you?

Kyle, could you apply the patch below as well?

Helge
------------------------------------------------------------
parisc: blink all or loadavg. LEDs on Oops depending on machine type.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 6d8753e..d6026d4 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -463,12 +463,19 @@ static void led_work_func (struct work_struct *unused)
 	if (likely(led_lanrxtx))  currentleds |= led_get_net_activity();
 	if (likely(led_diskio))   currentleds |= led_get_diskio_activity();
 
-	/* blink loadavg LEDs twice per second if we got an Oops (HPMC) */
+	/* blink LEDs if we got an Oops (HPMC) */
 	if (unlikely(oops_in_progress)) {
-		if (count_HZ <= (HZ/2))
-			currentleds &= ~(LED4|LED5|LED6|LED7);
-		else
-			currentleds |= (LED4|LED5|LED6|LED7);
+		if (boot_cpu_data.cpu_type >= pcxl2) {
+			/* newer machines don't have loadavg. LEDs, so we
+			 * let all LEDs blink twice per second instead */
+			currentleds = (count_HZ <= (HZ/2)) ? 0 : 0xff;
+		} else {
+			/* old machines: blink loadavg. LEDs twice per second */
+			if (count_HZ <= (HZ/2))
+				currentleds &= ~(LED4|LED5|LED6|LED7);
+			else
+				currentleds |= (LED4|LED5|LED6|LED7);
+		}
 	}
 
 	if (currentleds != lastleds)

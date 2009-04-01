From: Meelis Roos <mroos@linux.ee>
Subject: compile failure with LEDs
Date: Wed, 1 Apr 2009 11:07:27 +0300 (EEST)
Message-ID: <Pine.SOC.4.64.0904011105510.26377@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

FYI - todays 2.6.29+git:

  CC      drivers/parisc/led.o
drivers/parisc/led.c: In function 'led_create_procfs':
drivers/parisc/led.c:246: error: 'struct proc_dir_entry' has no member named 'owner'
drivers/parisc/led.c:252: error: 'struct proc_dir_entry' has no member named 'owner'
drivers/parisc/led.c:261: error: 'struct proc_dir_entry' has no member named 'owner'
make[3]: *** [drivers/parisc/led.o] Error 1

-- 
Meelis Roos (mroos@linux.ee)

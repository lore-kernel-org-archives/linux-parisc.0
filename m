Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Message-ID: <3F803C14.4030900@tiscali.be>
Date: Sun, 05 Oct 2003 15:43:16 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sched_clock implementation
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk> <3F6B2199.8050402@tiscali.be> <20030919160035.GG18225@systemhalted> <3F6C9622.60402@tiscali.be> <20030921000447.GC31268@dsl2.external.hp.com>
In-Reply-To: <20030921000447.GC31268@dsl2.external.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant Grundler wrote:

>On Sat, Sep 20, 2003 at 06:02:10PM +0000, Joel Soete wrote:
>  
>
>>a quick look into paxx.pdf which about CR16 speak of "peak instruction 
>>rate" but do not define anywhere?
>>I presume that is the cpu clock but would like somebody confirm.
>>    
>>
>
>Read about "Interval Timer" (cr16) in the PA 2.0 Arch book.
>PDC provides the exact rate that CR16 is changing.
>Looks like PDC_TOD_ITIMER is the call but I'm not sure offhand.
>In any case, I've only seen it used as CPU cycle counter.
>(ie 1:1 with CPU clock).
>
>hth,
>grant
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>  
>
Much more for remind, here is a proposed implementation of a pdc_tod_itimer:
diff -Naur linux-2.6.0-test6-pa6.orig/arch/parisc/kernel/firmware.c 
linux-2.6.0-test6-pa6.test/arch/parisc/kernel/firmware.c
--- linux-2.6.0-test6-pa6.orig/arch/parisc/kernel/firmware.c    
2003-10-05 17:14:13.000000000 +0200
+++ linux-2.6.0-test6-pa6.test/arch/parisc/kernel/firmware.c    
2003-10-05 17:09:14.000000000 +0200
@@ -682,6 +682,26 @@
 }
 EXPORT_SYMBOL(pdc_tod_set);

+/**
+ * pdc_tod_Calibrate_timers - Read "Calibrate timers" data
+ * @tod_calib: The return buffer:
+ *
+ * Calibrate the Interval Timer (CR16).
+ */
+int pdc_tod_itimer(struct pdc_tod_calib *tod_calib)
+{
+        int retval;
+
+        spin_lock_irq(&pdc_lock);
+        retval = mem_pdc_call(PDC_TOD, PDC_TOD_ITIMER, 
__pa(pdc_result), 0);
+        convert_to_wide(pdc_result);
+        memcpy(tod_calib, pdc_result, sizeof(tod_calib));
+        spin_unlock_irq(&pdc_lock);
+
+        return retval;
+}
+EXPORT_SYMBOL(pdc_tod_itimer);
+
 #ifdef __LP64__
 int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr,
                struct pdc_memory_table *tbl, unsigned long entries)
diff -Naur linux-2.6.0-test6-pa6.orig/include/asm-parisc/pdc.h 
linux-2.6.0-test6-pa6.test/include/asm-parisc/pdc.h
--- linux-2.6.0-test6-pa6.orig/include/asm-parisc/pdc.h 2003-10-05 
17:15:09.000000000 +0200
+++ linux-2.6.0-test6-pa6.test/include/asm-parisc/pdc.h 2003-10-05 
17:11:26.000000000 +0200
@@ -670,6 +670,13 @@
        unsigned long tod_usec;
 };

+struct pdc_tod_calib {
+       unsigned long calib_0;
+       unsigned long calib_1;
+       unsigned long TOD_acc;
+       unsigned long CR_acc;
+};
+
 #ifdef __LP64__
 struct pdc_pat_cell_num {
        unsigned long cell_num;
@@ -943,6 +950,7 @@
 int pdc_get_initiator(struct hardware_path *hwpath, unsigned char 
*scsi_id, unsigned long *period, char *width, char *mode);
 int pdc_tod_read(struct pdc_tod *tod);
 int pdc_tod_set(unsigned long sec, unsigned long usec);
+int pdc_tod_itimer(struct pdc_tod_calib *tod_calib);

 #ifdef __LP64__
 int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr,

Well I don't know yet if it would help for a better sched_clock() because:
a) I already found some get_jiffies_64() which seems to be a good candidate?

b) I don't yet find how jiffies and jiffies_64 are continuously updated. 
I presume that we take advantage of an 'external interupt request' by 
CR16 (interval timer) but don't reach to find neither where this one is 
initialised (just to determine if get_jiffies_64 is enough (theoriticaly 
1/100s ?) or request more) nor where it is updated?

Thanks in advance for comments and idea,
    Joel

PS:
I added some test on my c110 and got some:
Oct  5 15:57:51 hpalin kernel: Calib_0 =  0x405e0000
Oct  5 15:57:51 hpalin kernel: Calib_1 =  0x00000000
Oct  5 15:57:51 hpalin kernel: TOD_acc =  0x00000000
Oct  5 15:57:51 hpalin kernel: CR_acc  =  0x00000000

merging Calib_1, Calib_0 in a union retrun me a frequency of 120Mhz 
(exactly) when "Oct  5 15:57:51 hpalin kernel: Calibrating delay loop... 
119.60 BogoMIPS" (but printk don't print float :( )

but it is curious that TOD_acc and CR_acc are 0 any idea?

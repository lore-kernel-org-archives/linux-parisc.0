Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA29626
	for <parisc-linux@puffin.external.hp.com>; Sat, 10 Jul 1999 17:18:31 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id BAA10903
	for <parisc-linux@thepuffingroup.com>; Sun, 11 Jul 1999 01:18:59 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id BAA4036687
	for <parisc-linux@thepuffingroup.com>; Sun, 11 Jul 1999 01:18:58 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m1136OS-00025eC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 11 Jul 1999 01:18:52 +0200 (CEST)
Date: Sun, 11 Jul 1999 01:18:52 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990711011852.A25925@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PDC woes
List-ID: <linux-parisc.vger.kernel.org>


Philipp asked me to write a function to calculate the frequency of the
interval timer.  However, the PDC doesn't want to cooperate.  I see
`hello' printed on the screen, but not `world'.  So somehow this PDC
call is going wrong.  Anyone have any clues?  pim_info is not very
revealing.  If it helps anyone, the blinkenlights on my 715/33 are at:

10110010

Is there a document somewhere describing what the blinkenlights mean?

Here's the function:

/*
 * Find the interval timer frequency.
 */
static long calculate_interval_timer_frequency(void)
{
        long exponent, mantissa, result;
        long buf[4] __attribute__ ((aligned (8)));
printk("hello\n");
        (*pdc) (PDC_TOD, PDC_TOD_ITIMER, buf, 0);
printk("world\n");
        exponent = (buf[0] >> 20) & 0x7ff;
        mantissa = (buf[0] & 0xfffff) | 0x100000;
        result = (mantissa >> (1038 - exponent)) * 625 * 625;
printk("exponent = %ld mantissa = %ld result = %ld\n", exponent, mantissa, resul
t);
        return result;
}


-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

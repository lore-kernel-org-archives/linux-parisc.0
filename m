Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop3.phnx.uswest.net (phnxpop3.phnx.uswest.net [206.80.192.3])
	by dsl2.external.hp.com (Postfix) with SMTP id 51FA94A19
	for <parisc-linux@parisc-linux.org>; Fri,  2 Mar 2001 19:10:20 -0700 (MST)
Date: Fri, 2 Mar 2001 19:08:48 -0700
Message-ID: <20010302190848.U27829@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] confused about kernel printk behavior...
List-ID: <linux-parisc.vger.kernel.org>

I have a function like this in a char driver:

static ssize_t stabledev_read(struct file *file, char *buf, size_t count,
	loff_t *ppos)
{
	char *kbuf;
	unsigned int size = 0;

	printk("stabledev_read: pos = %ld, count = %d\n", *ppos, count);
	printk("stabledev_read: pos = %ld\n", *ppos);
	printk("stabledev_read: count = %d\n", count);
	/* ... */
}

for some reason, the output i get from the above is:
stabledev_read: pos = 20536, count = 0
stabledev_read: pos = 1
stabledev_read: count = 4096

why is that?  this is a 32-bit kernel built using xc-20010215

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

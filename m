From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: RFC arch/sh/kernel/traps_64.c - unclear if/else construct
Date: Tue, 3 Feb 2015 10:37:58 +0100
Message-ID: <20150203093758.GA27963@opentech.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi !

 scanning for  if STATEMENT else STATEMENT  triggered here - and it does look
like it needs a fix-up or at least some comments.

<snip?
int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
{
	 int fstype;
	 ...
		  /* String could be altered by userspace after strlen_user() */
		  fsname[len - 1] = '\0';

		  printk(KERN_DEBUG "that is '%s' as (char *)\n", fsname);
		  if ( !strcmp(fsname, "hfs") ) {
			   fstype = 0;
		  } else {
			   fstype = 0;
		  }  
		     
		  kfree(fsname);

		  printk(KERN_DEBUG "returning fstype=%d\n", fstype);
		  return fstype; /* something other than default */
<snip>

 The if-else here has no effect and the printk will not convey any information
as its always fstype==0, finally the return statement comment indicates that it
should not be the default...

 Can't come up with a reasonable cleanup patch here - but this looks like it
needs a review.

thx!
hofrat

From: Helge Deller <deller@gmx.de>
Subject: Re: [Security] [PATCH] bug in led_proc_write()
Date: Mon, 2 Aug 2010 22:46:41 +0200
Message-ID: <20100802204641.GA2907@p100.box>
References: <52a11dc3cc92b1e13c028304d9a7beaa@81.11.193.46>
 <20100710170458.96dc8a65.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Ilja <ilja@netric.org>, security@kernel.org,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100710170458.96dc8a65.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Andrew Morton <akpm@linux-foundation.org>:
> On Sat, 10 Nov 2007 23:50:29 +0100 Ilja <ilja@netric.org> wrote:
> > When reading some of the parisc driver code I stumbled on a bug in
> > led_proc_write() in drivers/parisc/led.c
> > the code looks like:
> > 
> > 182 static int led_proc_write(struct file *file, const char *buf, 
> > 183         unsigned long count, void *data)
> > 184 {
> > 185         char *cur, lbuf[count + 1];
> > 186         int d;
> > 187
> > 188         if (!capable(CAP_SYS_ADMIN))
> > 189                 return -EACCES;
> > ....
> > 235 }
> > 
> > the problem being that the stack is limited and count is not (except for the
> > MAX_INT check done in sys_write() I guess). this could lead to stack
> > corruption (when for example calling capable()). 
> 
> yes, and the bug's still there.  It allows a writer to /proc/pdc/led(?)
> to cause the kernel to consume an unbounded amount of stack. 

Ilja, Andrew,

Thanks for the bug report.
Below is a patch to fix this issue.

Kyle, please apply to the parisc git tree.

Helge

-----------
[PARISC] led.c - fix potential stack overflow in led_proc_write()

avoid potential stack overflow by correctly checking count parameter

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 188bc84..d02be78 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -176,16 +176,18 @@ static ssize_t led_proc_write(struct file *file, const char *buf,
 	size_t count, loff_t *pos)
 {
 	void *data = PDE(file->f_path.dentry->d_inode)->data;
-	char *cur, lbuf[count + 1];
+	char *cur, lbuf[32];
 	int d;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 
-	memset(lbuf, 0, count + 1);
+	if (count >= sizeof(lbuf))
+		count = sizeof(lbuf)-1;
 
 	if (copy_from_user(lbuf, buf, count))
 		return -EFAULT;
+	lbuf[count] = 0;
 
 	cur = lbuf;
 



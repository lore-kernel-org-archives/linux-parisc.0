Return-Path: <gmsoft@gentoo.org>
Received: from stargate.da-kot (unknown [212.88.229.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 667ED48AA
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 10:20:21 -0700 (MST)
Received: from gmsoft.lln.tuxicoman.be ([2001:6f8:204:aa00:210:a7ff:fe10:1a3e]
	helo=gmsoft) by stargate.da-kot with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.22) id 1AdYOL-0001Vv-Hd
	for parisc-linux@lists.parisc-linux.org; Mon, 05 Jan 2004 18:19:49 +0100
Date: Mon, 5 Jan 2004 18:19:43 +0100
From: Guy Martin <gmsoft@gentoo.org>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20040105181943.0b72576a.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Multipart_Mon__5_Jan_2004_18:19:43_+0100_0880e6d0"
Subject: [parisc-linux] [PATCH] Missing ioctl translations
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This is a multi-part message in MIME format.

--Multipart_Mon__5_Jan_2004_18:19:43_+0100_0880e6d0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello all,

This patch adds missing ioctl translations for 2.4.23-pa4.
I tried to include everything which was missing.
There are usbdevfs, nbd, watchdog, bluetooth, mtd and blocks ioctl.

It's just a 'smart' copy/paste from arch/ppc64/ioctl32.c.

I'm sure it needs review by more skilled guys than me :)
Btw it compiled fine and runs fine here.

-- 
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)

--Multipart_Mon__5_Jan_2004_18:19:43_+0100_0880e6d0
Content-Type: text/plain;
	name="parisc-2.4.23-pa4-missing-ioctl-translations.patch"
Content-Disposition: attachment;
	filename="parisc-2.4.23-pa4-missing-ioctl-translations.patch"
Content-Transfer-Encoding: quoted-printable

diff -uNrX /root/dontdiff linux-2.4.23-pa4.orig/arch/parisc/kernel/ioctl32.=
c linux-2.4.23-pa4/arch/parisc/kernel/ioctl32.c
--- linux-2.4.23-pa4.orig/arch/parisc/kernel/ioctl32.c	2004-01-05 12:01:14.=
000000000 +0000
+++ linux-2.4.23-pa4/arch/parisc/kernel/ioctl32.c	2004-01-05 13:45:40.00000=
0000 +0000
@@ -48,6 +48,7 @@
 #include <linux/blk.h>
 #include <linux/elevator.h>
 #include <linux/rtc.h>
+#include <linux/pci.h>
 #include <linux/serial.h>
 #if defined(CONFIG_BLK_DEV_LVM) || defined(CONFIG_BLK_DEV_LVM_MODULE)
 /* Ugh. This header really is not clean */
@@ -67,6 +68,7 @@
 #include <asm/uaccess.h>
 #include <asm/perf.h>
 #include <linux/ethtool.h>
+#include <linux/watchdog.h>
 #include <linux/soundcard.h>
=20
 #include <linux/atm.h>
@@ -81,6 +83,15 @@
 #include <linux/sonet.h>
 #include <linux/atm_suni.h>
=20
+#include <linux/mtd/mtd.h>
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci.h>
+
+#include <linux/usb.h>
+#include <linux/usbdevice_fs.h>
+#include <linux/nbd.h>
+
 #include <asm/module.h>	/* get #define module_map() */
=20
 /* Use this to get at 32-bit user passed pointers.=20
@@ -2810,6 +2821,488 @@
 	return rw_long(fd, AUTOFS_IOC_SETTIMEOUT, arg);
 }
=20
+struct usbdevfs_ctrltransfer32 {
+	__u8 requesttype;
+	__u8 request;
+	__u16 value;
+	__u16 index;
+	__u16 length;
+	__u32 timeout;  /* in milliseconds */
+	__u32 data;
+};
+
+#define USBDEVFS_CONTROL32           _IOWR('U', 0, struct usbdevfs_ctrltra=
nsfer32)
+
+static int do_usbdevfs_control(unsigned int fd, unsigned int cmd, unsigned=
 long arg)
+{
+	struct usbdevfs_ctrltransfer kctrl;
+	struct usbdevfs_ctrltransfer32 *uctrl;
+	mm_segment_t old_fs;
+	__u32 udata;
+	void *uptr, *kptr;
+	int err;
+
+	uctrl =3D (struct usbdevfs_ctrltransfer32 *) arg;
+
+	if (copy_from_user(&kctrl, uctrl,
+			   (sizeof(struct usbdevfs_ctrltransfer) -
+			    sizeof(void *))))
+		return -EFAULT;
+
+	if (get_user(udata, &uctrl->data))
+		return -EFAULT;
+	uptr =3D (void *) A(udata);
+
+	/* In usbdevice_fs, it limits the control buffer to a page,
+	 * for simplicity so do we.
+	 */
+	if (!uptr || kctrl.length > PAGE_SIZE)
+		return -EINVAL;
+
+	kptr =3D (void *)__get_free_page(GFP_KERNEL);
+
+	if ((kctrl.requesttype & 0x80) =3D=3D 0) {
+		err =3D -EFAULT;
+		if (copy_from_user(kptr, uptr, kctrl.length))
+			goto out;
+	}
+
+	kctrl.data =3D kptr;
+
+	old_fs =3D get_fs();
+	set_fs(KERNEL_DS);
+	err =3D sys_ioctl(fd, USBDEVFS_CONTROL, (unsigned long)&kctrl);
+	set_fs(old_fs);
+
+	if (err >=3D 0 &&
+	    ((kctrl.requesttype & 0x80) !=3D 0)) {
+		if (copy_to_user(uptr, kptr, kctrl.length))
+			err =3D -EFAULT;
+	}
+
+out:
+	free_page((unsigned long) kptr);
+	return err;
+}
+
+struct usbdevfs_bulktransfer32 {
+	unsigned int ep;
+	unsigned int len;
+	unsigned int timeout; /* in milliseconds */
+	__u32 data;
+};
+
+#define USBDEVFS_BULK32              _IOWR('U', 2, struct usbdevfs_bulktra=
nsfer32)
+
+static int do_usbdevfs_bulk(unsigned int fd, unsigned int cmd, unsigned lo=
ng arg)
+{
+	struct usbdevfs_bulktransfer kbulk;
+	struct usbdevfs_bulktransfer32 *ubulk;
+	mm_segment_t old_fs;
+	__u32 udata;
+	void *uptr, *kptr;
+	int err;
+
+	ubulk =3D (struct usbdevfs_bulktransfer32 *) arg;
+
+	if (get_user(kbulk.ep, &ubulk->ep) ||
+	    get_user(kbulk.len, &ubulk->len) ||
+	    get_user(kbulk.timeout, &ubulk->timeout) ||
+	    get_user(udata, &ubulk->data))
+		return -EFAULT;
+
+	uptr =3D (void *) A(udata);
+
+	/* In usbdevice_fs, it limits the control buffer to a page,
+	 * for simplicity so do we.
+	 */
+	if (!uptr || kbulk.len > PAGE_SIZE)
+		return -EINVAL;
+
+	kptr =3D (void *) __get_free_page(GFP_KERNEL);
+
+	if ((kbulk.ep & 0x80) =3D=3D 0) {
+		err =3D -EFAULT;
+		if (copy_from_user(kptr, uptr, kbulk.len))
+			goto out;
+	}
+
+	kbulk.data =3D kptr;
+
+	old_fs =3D get_fs();
+	set_fs(KERNEL_DS);
+	err =3D sys_ioctl(fd, USBDEVFS_BULK, (unsigned long) &kbulk);
+	set_fs(old_fs);
+
+	if (err >=3D 0 &&
+	    ((kbulk.ep & 0x80) !=3D 0)) {
+		if (copy_to_user(uptr, kptr, kbulk.len))
+			err =3D -EFAULT;
+	}
+
+out:
+	free_page((unsigned long) kptr);
+	return err;
+}
+
+/* This needs more work before we can enable it.  Unfortunately
+ * because of the fancy asynchronous way URB status/error is written
+ * back to userspace, we'll need to fiddle with USB devio internals
+ * and/or reimplement entirely the frontend of it ourselves. -DaveM
+ *
+ * The issue is:
+ *
+ *	When an URB is submitted via usbdevicefs it is put onto an
+ *	asynchronous queue.  When the URB completes, it may be reaped
+ *	via another ioctl.  During this reaping the status is written
+ *	back to userspace along with the length of the transfer.
+ *
+ *	We must translate into 64-bit kernel types so we pass in a kernel
+ *	space copy of the usbdevfs_urb structure.  This would mean that we
+ *	must do something to deal with the async entry reaping.  First we
+ *	have to deal somehow with this transitory memory we've allocated.
+ *	This is problematic since there are many call sites from which the
+ *	async entries can be destroyed (and thus when we'd need to free up
+ *	this kernel memory).  One of which is the close() op of usbdevicefs.
+ *	To handle that we'd need to make our own file_operations struct which
+ *	overrides usbdevicefs's release op with our own which runs usbdevicefs's
+ *	real release op then frees up the kernel memory.
+ *
+ *	But how to keep track of these kernel buffers?  We'd need to either
+ *	keep track of them in some table _or_ know about usbdevicefs internals
+ *	(ie. the exact layout of it's file private, which is actually defined
+ *	in linux/usbdevice_fs.h, the layout of the async queues are private to
+ *	devio.c)
+ *
+ * There is one possible other solution I considered, also involving knowl=
edge
+ * of usbdevicefs internals:
+ *
+ *	After an URB is submitted, we "fix up" the address back to the user
+ *	space one.  This would work if the status/length fields written back
+ *	by the async URB completion lines up perfectly in the 32-bit type with
+ *	the 64-bit kernel type.  Unfortunately, it does not because the iso
+ *	frame descriptors, at the end of the struct, can be written back.
+ *
+ * I think we'll just need to simply duplicate the devio URB engine here.
+ */
+#if 0
+struct usbdevfs_urb32 {
+	__u8 type;
+	__u8 endpoint;
+	__s32 status;
+	__u32 flags;
+	__u32 buffer;
+	__s32 buffer_length;
+	__s32 actual_length;
+	__s32 start_frame;
+	__s32 number_of_packets;
+	__s32 error_count;
+	__u32 signr;
+	__u32 usercontext; /* unused */
+	struct usbdevfs_iso_packet_desc iso_frame_desc[0];
+};
+
+#define USBDEVFS_SUBMITURB32       _IOR('U', 10, struct usbdevfs_urb32)
+
+static int get_urb32(struct usbdevfs_urb *kurb,
+		     struct usbdevfs_urb32 *uurb)
+{
+	if (get_user(kurb->type, &uurb->type) ||
+	    __get_user(kurb->endpoint, &uurb->endpoint) ||
+	    __get_user(kurb->status, &uurb->status) ||
+	    __get_user(kurb->flags, &uurb->flags) ||
+	    __get_user(kurb->buffer_length, &uurb->buffer_length) ||
+	    __get_user(kurb->actual_length, &uurb->actual_length) ||
+	    __get_user(kurb->start_frame, &uurb->start_frame) ||
+	    __get_user(kurb->number_of_packets, &uurb->number_of_packets) ||
+	    __get_user(kurb->error_count, &uurb->error_count) ||
+	    __get_user(kurb->signr, &uurb->signr))
+		return -EFAULT;
+
+	kurb->usercontext =3D 0; /* unused currently */
+
+	return 0;
+}
+
+/* Just put back the values which usbdevfs actually changes. */
+static int put_urb32(struct usbdevfs_urb *kurb,
+		     struct usbdevfs_urb32 *uurb)
+{
+	if (put_user(kurb->status, &uurb->status) ||
+	    __put_user(kurb->actual_length, &uurb->actual_length) ||
+	    __put_user(kurb->error_count, &uurb->error_count))
+		return -EFAULT;
+
+	if (kurb->number_of_packets !=3D 0) {
+		int i;
+
+		for (i =3D 0; i < kurb->number_of_packets; i++) {
+			if (__put_user(kurb->iso_frame_desc[i].actual_length,
+				       &uurb->iso_frame_desc[i].actual_length) ||
+			    __put_user(kurb->iso_frame_desc[i].status,
+				       &uurb->iso_frame_desc[i].status))
+				return -EFAULT;
+		}
+	}
+
+	return 0;
+}
+
+static int get_urb32_isoframes(struct usbdevfs_urb *kurb,
+			       struct usbdevfs_urb32 *uurb)
+{
+	unsigned int totlen;
+	int i;
+
+	if (kurb->type !=3D USBDEVFS_URB_TYPE_ISO) {
+		kurb->number_of_packets =3D 0;
+		return 0;
+	}
+
+	if (kurb->number_of_packets < 1 ||
+	    kurb->number_of_packets > 128)
+		return -EINVAL;
+
+	if (copy_from_user(&kurb->iso_frame_desc[0],
+			   &uurb->iso_frame_desc[0],
+			   sizeof(struct usbdevfs_iso_packet_desc) *
+			   kurb->number_of_packets))
+		return -EFAULT;
+
+	totlen =3D 0;
+	for (i =3D 0; i < kurb->number_of_packets; i++) {
+		unsigned int this_len;
+
+		this_len =3D kurb->iso_frame_desc[i].length;
+		if (this_len > 1023)
+			return -EINVAL;
+
+		totlen +=3D this_len;
+	}
+
+	if (totlen > 32768)
+		return -EINVAL;
+
+	kurb->buffer_length =3D totlen;
+
+	return 0;
+}
+
+static int do_usbdevfs_urb(unsigned int fd, unsigned int cmd, unsigned lon=
g arg)
+{
+	struct usbdevfs_urb *kurb;
+	struct usbdevfs_urb32 *uurb;
+	mm_segment_t old_fs;
+	__u32 udata;
+	void *uptr, *kptr;
+	unsigned int buflen;
+	int err;
+
+	uurb =3D (struct usbdevfs_urb32 *) arg;
+
+	err =3D -ENOMEM;
+	kurb =3D kmalloc(sizeof(struct usbdevfs_urb) +
+		       (sizeof(struct usbdevfs_iso_packet_desc) * 128),
+		       GFP_KERNEL);
+	if (!kurb)
+		goto out;
+
+	err =3D -EFAULT;
+	if (get_urb32(kurb, uurb))
+		goto out;
+
+	err =3D get_urb32_isoframes(kurb, uurb);
+	if (err)
+		goto out;
+
+	err =3D -EFAULT;
+	if (__get_user(udata, &uurb->buffer))
+		goto out;
+	uptr =3D (void *) A(udata);
+
+	err =3D -ENOMEM;
+	buflen =3D kurb->buffer_length;
+	kptr =3D kmalloc(buflen, GFP_KERNEL);
+	if (!kptr)
+		goto out;
+
+	kurb->buffer =3D kptr;
+
+	err =3D -EFAULT;
+	if (copy_from_user(kptr, uptr, buflen))
+		goto out_kptr;
+
+	old_fs =3D get_fs();
+	set_fs(KERNEL_DS);
+	err =3D sys_ioctl(fd, USBDEVFS_SUBMITURB, (unsigned long) kurb);
+	set_fs(old_fs);
+
+	if (err >=3D 0) {
+		/* XXX Shit, this doesn't work for async URBs :-( XXX */
+		if (put_urb32(kurb, uurb)) {
+			err =3D -EFAULT;
+		} else if ((kurb->endpoint & USB_DIR_IN) !=3D 0) {
+			if (copy_to_user(uptr, kptr, buflen))
+				err =3D -EFAULT;
+		}
+	}
+
+out_kptr:
+	kfree(kptr);
+
+out:
+	kfree(kurb);
+	return err;
+}
+#endif
+
+#define USBDEVFS_REAPURB32         _IOW('U', 12, u32)
+#define USBDEVFS_REAPURBNDELAY32   _IOW('U', 13, u32)
+
+static int do_usbdevfs_reapurb(unsigned int fd, unsigned int cmd, unsigned=
 long arg)
+{
+	mm_segment_t old_fs;
+	void *kptr;
+	int err;
+
+	old_fs =3D get_fs();
+	set_fs(KERNEL_DS);
+	err =3D sys_ioctl(fd,
+			(cmd =3D=3D USBDEVFS_REAPURB32 ?
+			 USBDEVFS_REAPURB :
+			 USBDEVFS_REAPURBNDELAY),
+			(unsigned long) &kptr);
+	set_fs(old_fs);
+
+	if (err >=3D 0 &&
+	    put_user(((u32)(long)kptr), (u32 *) A(arg)))
+		err =3D -EFAULT;
+
+	return err;
+}
+
+struct usbdevfs_disconnectsignal32 {
+	unsigned int signr;
+	u32 context;
+};
+
+#define USBDEVFS_DISCSIGNAL32      _IOR('U', 14, struct usbdevfs_disconnec=
tsignal32)
+
+static int do_usbdevfs_discsignal(unsigned int fd, unsigned int cmd, unsig=
ned long arg)
+{
+	struct usbdevfs_disconnectsignal kdis;
+	struct usbdevfs_disconnectsignal32 *udis;
+	mm_segment_t old_fs;
+	u32 uctx;
+	int err;
+
+	udis =3D (struct usbdevfs_disconnectsignal32 *) arg;
+
+	if (get_user(kdis.signr, &udis->signr) ||
+	    __get_user(uctx, &udis->context))
+		return -EFAULT;
+
+	kdis.context =3D (void *) (long)uctx;
+
+	old_fs =3D get_fs();
+	set_fs(KERNEL_DS);
+	err =3D sys_ioctl(fd, USBDEVFS_DISCSIGNAL, (unsigned long) &kdis);
+	set_fs(old_fs);
+
+	return err;
+}
+
+
+struct mtd_oob_buf32 {
+	u32 start;
+	u32 length;
+	u32 ptr;	/* unsigned char* */
+};
+
+#define MEMWRITEOOB32 	_IOWR('M',3,struct mtd_oob_buf32)
+#define MEMREADOOB32 	_IOWR('M',4,struct mtd_oob_buf32)
+
+static inline int=20
+mtd_rw_oob(unsigned int fd, unsigned int cmd, unsigned long arg)
+{
+	mm_segment_t 			old_fs 	=3D get_fs();
+	struct mtd_oob_buf32	*uarg 	=3D (struct mtd_oob_buf32 *)arg;
+	struct mtd_oob_buf		karg;
+	u32 tmp;
+	char *ptr;
+	int ret;
+
+	if (get_user(karg.start, &uarg->start) 		||
+	    get_user(karg.length, &uarg->length)	||
+	    get_user(tmp, &uarg->ptr))
+		return -EFAULT;
+
+	ptr =3D (char *)A(tmp);
+	if (0 >=3D karg.length)=20
+		return -EINVAL;
+
+	karg.ptr =3D kmalloc(karg.length, GFP_KERNEL);
+	if (NULL =3D=3D karg.ptr)
+		return -ENOMEM;
+
+	if (copy_from_user(karg.ptr, ptr, karg.length)) {
+		kfree(karg.ptr);
+		return -EFAULT;
+	}
+
+	set_fs(KERNEL_DS);
+	if (MEMREADOOB32 =3D=3D cmd)=20
+		ret =3D sys_ioctl(fd, MEMREADOOB, (unsigned long)&karg);
+	else if (MEMWRITEOOB32 =3D=3D cmd)
+		ret =3D sys_ioctl(fd, MEMWRITEOOB, (unsigned long)&karg);
+	else
+		ret =3D -EINVAL;
+	set_fs(old_fs);
+
+	if (0 =3D=3D ret && cmd =3D=3D MEMREADOOB32) {
+		ret =3D copy_to_user(ptr, karg.ptr, karg.length);
+		ret |=3D put_user(karg.start, &uarg->start);
+		ret |=3D put_user(karg.length, &uarg->length);
+	}
+
+	kfree(karg.ptr);
+	return ((0 =3D=3D ret) ? 0 : -EFAULT);
+}=09
+
+/* Fix sizeof(sizeof()) breakage */
+#define BLKELVGET_32	_IOR(0x12,106,int)
+#define BLKELVSET_32	_IOW(0x12,107,int)
+#define BLKBSZGET_32	_IOR(0x12,112,int)
+#define BLKBSZSET_32	_IOW(0x12,113,int)
+#define BLKGETSIZE64_32	_IOR(0x12,114,int)
+
+static int do_blkelvget(unsigned int fd, unsigned int cmd, unsigned long a=
rg)
+{
+	return sys_ioctl(fd, BLKELVGET, arg);
+}
+
+static int do_blkelvset(unsigned int fd, unsigned int cmd, unsigned long a=
rg)
+{
+	return sys_ioctl(fd, BLKELVSET, arg);
+}
+
+static int do_blkbszget(unsigned int fd, unsigned int cmd, unsigned long a=
rg)
+{
+	return sys_ioctl(fd, BLKBSZGET, arg);
+}
+
+static int do_blkbszset(unsigned int fd, unsigned int cmd, unsigned long a=
rg)
+{
+	return sys_ioctl(fd, BLKBSZSET, arg);
+}
+
+static int do_blkgetsize64(unsigned int fd, unsigned int cmd,
+			   unsigned long arg)
+{
+	return sys_ioctl(fd, BLKGETSIZE64, arg);
+}
+
+
=20
 struct serial_struct32 {
 	int	type;
@@ -3446,8 +3939,75 @@
 /* elevator */
 COMPATIBLE_IOCTL(BLKELVGET)
 COMPATIBLE_IOCTL(BLKELVSET)
+//* Big W */
+/* WIOC_GETSUPPORT not yet implemented -E */
+COMPATIBLE_IOCTL(WDIOC_GETSTATUS)
+COMPATIBLE_IOCTL(WDIOC_GETBOOTSTATUS)
+COMPATIBLE_IOCTL(WDIOC_GETTEMP)
+COMPATIBLE_IOCTL(WDIOC_SETOPTIONS)
+COMPATIBLE_IOCTL(WDIOC_KEEPALIVE)
+/* Big R */
+COMPATIBLE_IOCTL(RNDGETENTCNT)
+COMPATIBLE_IOCTL(RNDADDTOENTCNT)
+COMPATIBLE_IOCTL(RNDGETPOOL)
+COMPATIBLE_IOCTL(RNDADDENTROPY)
+COMPATIBLE_IOCTL(RNDZAPENTCNT)
+COMPATIBLE_IOCTL(RNDCLEARPOOL)
+/* Bluetooth ioctls */
+COMPATIBLE_IOCTL(HCIDEVUP)
+COMPATIBLE_IOCTL(HCIDEVDOWN)
+COMPATIBLE_IOCTL(HCIDEVRESET)
+COMPATIBLE_IOCTL(HCIDEVRESTAT)
+COMPATIBLE_IOCTL(HCIGETDEVINFO)
+COMPATIBLE_IOCTL(HCIGETDEVLIST)
+COMPATIBLE_IOCTL(HCISETRAW)
+COMPATIBLE_IOCTL(HCISETSCAN)
+COMPATIBLE_IOCTL(HCISETAUTH)
+COMPATIBLE_IOCTL(HCIINQUIRY)
+COMPATIBLE_IOCTL(PCIIOC_CONTROLLER)
+COMPATIBLE_IOCTL(PCIIOC_MMAP_IS_IO)
+COMPATIBLE_IOCTL(PCIIOC_MMAP_IS_MEM)
+COMPATIBLE_IOCTL(PCIIOC_WRITE_COMBINE)
+/* USB */
+COMPATIBLE_IOCTL(USBDEVFS_RESETEP)
+COMPATIBLE_IOCTL(USBDEVFS_SETINTERFACE)
+COMPATIBLE_IOCTL(USBDEVFS_SETCONFIGURATION)
+COMPATIBLE_IOCTL(USBDEVFS_GETDRIVER)
+COMPATIBLE_IOCTL(USBDEVFS_DISCARDURB)
+COMPATIBLE_IOCTL(USBDEVFS_CLAIMINTERFACE)
+COMPATIBLE_IOCTL(USBDEVFS_RELEASEINTERFACE)
+COMPATIBLE_IOCTL(USBDEVFS_CONNECTINFO)
+COMPATIBLE_IOCTL(USBDEVFS_HUB_PORTINFO)
+COMPATIBLE_IOCTL(USBDEVFS_RESET)
+COMPATIBLE_IOCTL(USBDEVFS_CLEAR_HALT)
+/* MTD */
+COMPATIBLE_IOCTL(MEMGETINFO)
+COMPATIBLE_IOCTL(MEMERASE)
+COMPATIBLE_IOCTL(MEMLOCK)
+COMPATIBLE_IOCTL(MEMUNLOCK)
+COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
+COMPATIBLE_IOCTL(MEMGETREGIONINFO)
+/* NBD */
+COMPATIBLE_IOCTL(NBD_SET_SOCK)
+COMPATIBLE_IOCTL(NBD_SET_BLKSIZE)
+COMPATIBLE_IOCTL(NBD_SET_SIZE)
+COMPATIBLE_IOCTL(NBD_DO_IT)
+COMPATIBLE_IOCTL(NBD_CLEAR_SOCK)
+COMPATIBLE_IOCTL(NBD_CLEAR_QUE)
+COMPATIBLE_IOCTL(NBD_PRINT_DEBUG)
+COMPATIBLE_IOCTL(NBD_SET_SIZE_BLOCKS)
+COMPATIBLE_IOCTL(NBD_DISCONNECT)
+/* Remove *PRIVATE in 2.5 */
+COMPATIBLE_IOCTL(SIOCDEVPRIVATE)
+COMPATIBLE_IOCTL(SIOCDEVPRIVATE+1)
+COMPATIBLE_IOCTL(SIOCDEVPRIVATE+2)
+COMPATIBLE_IOCTL(SIOCGMIIPHY)
+COMPATIBLE_IOCTL(SIOCGMIIREG)
+COMPATIBLE_IOCTL(SIOCSMIIREG)
 /* And these ioctls need translation */
 HANDLE_IOCTL(TIOCGSERIAL, do_tiocgserial)
+HANDLE_IOCTL(MEMREADOOB32, mtd_rw_oob)
+HANDLE_IOCTL(MEMWRITEOOB32, mtd_rw_oob)
 HANDLE_IOCTL(SIOCGIFNAME, dev_ifname32)
 HANDLE_IOCTL(SIOCGIFCONF, dev_ifconf)
 HANDLE_IOCTL(SIOCGIFFLAGS, dev_ifsioc)
@@ -3606,16 +4166,30 @@
 COMPATIBLE_IOCTL(RTC_EPOCH_SET)
 #endif
 #if defined(CONFIG_DRM) || defined(CONFIG_DRM_MODULE)
-HANDLE_IOCTL(DRM32_IOCTL_VERSION, drm32_version);
-HANDLE_IOCTL(DRM32_IOCTL_GET_UNIQUE, drm32_getsetunique);
-HANDLE_IOCTL(DRM32_IOCTL_SET_UNIQUE, drm32_getsetunique);
-HANDLE_IOCTL(DRM32_IOCTL_ADD_MAP, drm32_addmap);
-HANDLE_IOCTL(DRM32_IOCTL_INFO_BUFS, drm32_info_bufs);
-HANDLE_IOCTL(DRM32_IOCTL_FREE_BUFS, drm32_free_bufs);
-HANDLE_IOCTL(DRM32_IOCTL_MAP_BUFS, drm32_map_bufs);
-HANDLE_IOCTL(DRM32_IOCTL_DMA, drm32_dma);
-HANDLE_IOCTL(DRM32_IOCTL_RES_CTX, drm32_res_ctx);
+HANDLE_IOCTL(DRM32_IOCTL_VERSION, drm32_version)
+HANDLE_IOCTL(DRM32_IOCTL_GET_UNIQUE, drm32_getsetunique)
+HANDLE_IOCTL(DRM32_IOCTL_SET_UNIQUE, drm32_getsetunique)
+HANDLE_IOCTL(DRM32_IOCTL_ADD_MAP, drm32_addmap)
+HANDLE_IOCTL(DRM32_IOCTL_INFO_BUFS, drm32_info_bufs)
+HANDLE_IOCTL(DRM32_IOCTL_FREE_BUFS, drm32_free_bufs)
+HANDLE_IOCTL(DRM32_IOCTL_MAP_BUFS, drm32_map_bufs)
+HANDLE_IOCTL(DRM32_IOCTL_DMA, drm32_dma)
+HANDLE_IOCTL(DRM32_IOCTL_RES_CTX, drm32_res_ctx)
 #endif /* DRM */
+HANDLE_IOCTL(USBDEVFS_CONTROL32, do_usbdevfs_control)
+HANDLE_IOCTL(USBDEVFS_BULK32, do_usbdevfs_bulk)
+/*HANDLE_IOCTL(USBDEVFS_SUBMITURB32, do_usbdevfs_urb)*/
+HANDLE_IOCTL(USBDEVFS_REAPURB32, do_usbdevfs_reapurb)
+HANDLE_IOCTL(USBDEVFS_REAPURBNDELAY32, do_usbdevfs_reapurb)
+HANDLE_IOCTL(USBDEVFS_DISCSIGNAL32, do_usbdevfs_discsignal)
+/* take care of sizeof(sizeof()) breakage */
+/* elevator */
+HANDLE_IOCTL(BLKELVGET_32, do_blkelvget)
+HANDLE_IOCTL(BLKELVSET_32, do_blkelvset)
+/* block stuff */ =20
+HANDLE_IOCTL(BLKBSZGET_32, do_blkbszget)
+HANDLE_IOCTL(BLKBSZSET_32, do_blkbszset)
+HANDLE_IOCTL(BLKGETSIZE64_32, do_blkgetsize64)
 COMPATIBLE_IOCTL(PA_PERF_ON)
 COMPATIBLE_IOCTL(PA_PERF_OFF)
 COMPATIBLE_IOCTL(PA_PERF_VERSION)

--Multipart_Mon__5_Jan_2004_18:19:43_+0100_0880e6d0--

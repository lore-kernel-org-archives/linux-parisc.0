From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Kernel panic building polyml
Date: Sun, 20 Aug 2017 14:13:29 -0400
Message-ID: <887D24D5-832C-409A-83AF-646E4937E87E@bell.net>
References: <E754A6C6-AA72-43F1-A799-E48A2146BF17@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-12-959599694
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <E754A6C6-AA72-43F1-A799-E48A2146BF17@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-12-959599694
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2017-08-19, at 8:56 AM, John David Anglin wrote:

> mx3210 login: systemd-logind[4461]: New seat seat0.
> systemd-logind[4461]: Failed to start user service, ignoring: Unknown =
unit: user@0.service
> systemd-logind[4461]: Failed to start user service, ignoring: Unknown =
unit: user@110.service
> Backtrace:
> [<00000000402f316c>] compat_get_fd_set+0x5c/0x78
> [<00000000402f3cac>] compat_core_sys_select+0x1cc/0x300
> [<00000000402f52dc>] compat_SyS_select+0x144/0x1a0
> [<0000000040155fe4>] syscall_exit+0x0/0x14
>=20
>=20
> Kernel Fault: Code=3D26 (Data memory access rights trap) =
regs=3D00000002234b84e0 (Addr=3D0000000000000000)
> CPU: 1 PID: 21167 Comm: polyimport Not tainted 4.13.0-rc5+ #1
> task: 0000000223d74b50 task.stack: 00000002234b8000
>=20
> YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001101111111100001111 Not tainted
> r00-03 000000ff0806ff0f 00000002234b8420 00000000402f316c =
00000002234b84a0
> r04-07 000000004071c960 00000002234b82b8 00000002234b8218 =
0000000000000100
> r08-11 0000000000000004 0000000000000100 00000000f3780588 =
0000000000000000
> r12-15 0000000000000000 00000002234b8148 0000000000000000 =
00000002234b8218
> r16-19 0000000000000000 000000000002f03c 000000000002f030 =
0000000000000000
> r20-23 0000000000000100 0000000000000000 00000002234b8148 =
0000000000000000
> r24-27 0000000000000100 0000000000000000 0000000000000000 =
000000004071c960
> r28-31 0000000000000000 00000002234b8470 00000002234b84e0 =
0000000000000000
> sr00-03 0000000003f15000 0000000003f15000 0000000003f15000 =
0000000003f15000
> sr04-07 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
>=20
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000406a4718 =
00000000406a471c
> IIR: 0ff312c0 ISR: 0000000000000000 IOR: 0000000000000000
> CPU: 1 CR30: 00000002234b8000 CR31: b33e06ff0008e07f
> ORIG_R28: 0000000000000040
> IAOQ[0]: memset+0x68/0xd8
> IAOQ[1]: memset+0x6c/0xd8
> RP(r2): compat_get_fd_set+0x5c/0x78
> Backtrace:
> [<00000000402f316c>] compat_get_fd_set+0x5c/0x78
> [<00000000402f3cac>] compat_core_sys_select+0x1cc/0x300
> [<00000000402f52dc>] compat_SyS_select+0x144/0x1a0
> [<0000000040155fe4>] syscall_exit+0x0/0x14
>=20
> Kernel panic - not syncing: Kernel Fault
> ---[ end Kernel panic - not syncing: Kernel Fault


The attached patch is probably not the real fix but it should prevent =
the panic.



--Apple-Mail-12-959599694
Content-Disposition: attachment;
	filename=select.d.txt
Content-Type: text/plain;
	name="select.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/fs/select.c b/fs/select.c
index d6c652a31e99..8790c0a0bd3c 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -1181,6 +1181,8 @@ int compat_get_fd_set(unsigned long nr, =
compat_ulong_t __user *ufdset,
 		if (odd && __get_user(*fdset, ufdset))
 			return -EFAULT;
 	} else {
+		if (!fdset)
+			return -EFAULT;
 		/* Tricky, must clear full unsigned long in the
 		 * kernel fdset at the end, this makes sure that
 		 * actually happens.

--Apple-Mail-12-959599694
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

PS: the above crash is what broke the dsa-puppet git archive on mx3210.
--Apple-Mail-12-959599694--

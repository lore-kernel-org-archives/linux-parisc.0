From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux-Vserver?
Date: Sat, 10 Dec 2005 22:06:58 +0000
Message-ID: <439B5182.2010306@tiscali.be>
References: <IQVT5V$E9AC9B07E4AC628ABC4B6531981DFB7F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IQVT5V$E9AC9B07E4AC628ABC4B6531981DFB7F@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

Just a small update, till now:

	o latest patch-2.6.14.3-vs2.1.0-rc10.diff against our latest 2.6.14
	  (cvs dated 20051111) merged with upstream patch-2.6.14.3.bz2 boot
	  fine on c110, d380 (32bit up).
	o and preliminary testme.sh-0.14 finaly passed with success on the c110
	  (just need a small patch of util-vserver_0.30.209)
# ./testme.sh-0.14
Linux-VServer Test [V0.14] Copyright (C) 2003-2005 H.Poetzl
chcontext is working.
chbind is working.
Linux 2.6.14.3-vs2.1.0-rc10-pa0-c110 parisc/0.30.209/0.30.209 [Ea] (0)
VCI:  0002:0001 263 03000116
---
[000]# succeeded.
[001]# succeeded.
[011]# succeeded.
[031]# succeeded.
[101]# succeeded.
[102]# succeeded.
[201]# succeeded.
[202]# succeeded.

;-)

Hope now to be able to go further next week.

Joel Soete wrote:
[...]

Matthew,

(don't know if you're still the maintainer of this stuff)
but any way have you some good advise about following:
> 
> PS: btw I just read:
> --- linux-2.6.14.2/arch/parisc/kernel/sys_parisc32.c    2005-06-22 02:37:56 +0200
> +++ linux-2.6.14.2-vs2.1.0-rc8/arch/parisc/kernel/sys_parisc32.c       
> 2005-10-29 04:06:52 +0200
> @@ -657,6 +657,7 @@ asmlinkage int sys32_sysinfo(struct sysi
> 
>         do {
>                 seq = read_seqbegin(&xtime_lock);
> +               /* FIXME requires vx virtualization */
>                 val.uptime = jiffies / HZ;
> 
>                 val.loads[0] = avenrun[0] << (SI_LOAD_SHIFT - FSHIFT);
> ====<>====
> 
> according to the comment:
> /* We used to call sys_sysinfo and translate the result.  But sys_sysinfo
>  * undoes the good work done elsewhere, and rather than undoing the
>  * damage, I decided to just duplicate the code from sys_sysinfo here.
>  */
> 
> could it be look like as in kernel/timer.c:
> @@ -1263,6 +1273,8 @@ asmlinkage long sys_sysinfo(struct sysin
>                         tp.tv_nsec = tp.tv_nsec - NSEC_PER_SEC;
>                         tp.tv_sec++;
>                 }
> +               if (vx_flags(VXF_VIRT_UPTIME, 0))
> +                       vx_vsi_uptime(&tp, NULL);
>                 val.uptime = tp.tv_sec + (tp.tv_nsec ? 1 : 0);
> 
>                 val.loads[0] = avenrun[0] << (SI_LOAD_SHIFT - FSHIFT);
> ====<>====
> 

Tia,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

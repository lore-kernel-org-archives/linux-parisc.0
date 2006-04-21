From: "E." =?iso-8859-2?Q?Pavleti=E8?= <pavletic@gmail.com>
Subject: [parisc-linux] Soft power switch
Date: Fri, 21 Apr 2006 20:28:42 +0200
Message-ID: <1145644122.9676.10.camel__27552.87215482$1416624063$gmane$org@rupa.go.net>
Mime-Version: 1.0
Content-Type: text/plain
To: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

I've a problem with the power switch on a HP 9000 D220 machine. Actually
I'm not able to shutdown the system cleanly when the power switch is
turned off.
It seems that the kernel is properly configured because dmesg outputs
the message "Soft power switch enabled, polling @ 0xf0140000" and in the
procfs file system there's an entry "soft-power"
(/proc/sys/kernel/soft-power) containing the value 1. When I turn the
switch off, the function deferred_poweroff(void *dummy) in
drivers/parisc/power.c is (correctly) called and on the console appears
the following message:

Broadcast message from root (pts/1) (Fri Apr 21 17:12:50 2006):
The system is going down for reboot NOW!

but immediately after that the power turns off. 
I've tried it both with a precompiled kernel
(kernel-image-2.6.8-3-32_2.6.8-6sarge2_hppa.deb) as with a kernel I've
compiled myself (kernel-source-2.6.8_2.6.8-16sarge2_all.deb). The result
is the same.

I've searched several mailing lists, but so far I've not found anything
helpful around. Has anyone already experienced something like this?

Thanks in advance.
Enzo

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA30683
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 17:35:38 -0600
Received: from user48-198.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.198)
  by mailserv2.iuinc.com with SMTP; 12 Jul 2000 23:37:04 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AC852B007; Thu, 13 Jul 2000 00:35:33 +0100 (BST)
Date: Thu, 13 Jul 2000 00:35:33 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000713003533.Y9568@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Non-bootable kernel problems
List-ID: <linux-parisc.vger.kernel.org>

Current cvs kernel source doesn't boot.  Looks like a linker problem
or bits of the kernel loaded in the wrong place to me...

I added the following to the end of net/ipv4/devinet.c:

void check_devinet(void)
{
        printk("**  devinet_sysctl.devinet_root_dir = %p\n", devinet_sysctl.devinet_root_dir);
        printk("**  devinet_sysctl.devinet_root_dir[0].procname = %p\n", devinet_sysctl.devinet_root_dir[0].procname);
        printk("**  devinet_sysctl.devinet_root_dir[0].procname = %s\n", devinet_sysctl.devinet_root_dir[0].procname);
}


and then added a call to check_devinet() to init/main.c() just after
printk(linux_banner).  It should report procname as "net" from the table
in net/ipv4/devinet.c, but:

Linux version 2.3.99-pre8 (rhirst@rhirst.linuxcare.com) (gcc version 2.96.0614) #660 Thu Jul 13 00:21:59 BST 2000
**  devinet_sysctl.devinet_root_dir = c0279814
**  devinet_sysctl.devinet_root_dir[0].procname = c0143228
**  devinet_sysctl.devinet_root_dir[0].procname = Multiply assigned logical unit
pagetable_init


Someone else can pick it up now while I sleep ;-)

Richard

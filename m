Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Jun 2003 10:55:50 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.21-pa0 problems with ifconfig?
Message-ID: <20030630165550.GG14971@dsl2.external.hp.com>
References: <20030630151704.GA24413@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030630151704.GA24413@nikita.ath.cx>
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

On Mon, Jun 30, 2003 at 05:17:04PM +0200, Alexander Gabert wrote:
> hi, has anyone of you experience problems with 2.4.21-pa0 and the
> ifconfig command?

works for me (tm).

grundler@ios:~$ /sbin/ifconfig
eth0      Link encap:Ethernet  HWaddr 00:30:6E:03:79:9F  
          inet addr:192.168.0.20  Bcast:192.168.0.255
Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2566 errors:1 dropped:0 overruns:0 frame:0
          TX packets:1499 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100 
          RX bytes:291959 (285.1 KiB)  TX bytes:523183 (510.9 KiB)
          Interrupt:128 Base address:0x6000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:560 (560.0 b)  TX bytes:560 (560.0 b)

grundler@ios:~$ uname -a
Linux ios 2.4.21-pa1 #5 Sun Jun 29 12:11:52 PDT 2003 parisc64 unknown unknown GNU/Linux

> it heavily dumps when i boot this kernel on my C200.

Can you send output?

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ltitlout.lntinfotech.com (unknown [203.199.54.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5BC24829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Mar 2003 04:57:56 -0700 (MST)
To: linux-net@vger.kernel.org, linux-net-owner@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <OFC9ADC329.AC7F62D7-ON65256CEA.003FA868@lntinfotech.com>
From: "Mahesh Pujara" <Mahesh.Pujara@lntinfotech.com>
Date: Sat, 15 Mar 2003 17:22:26 +0530
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Accessing the FIB tables
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

HI,
      I have Linux machine acting as a router and Zebra Daemon  is running
on that. Currently
RIP is configured which is  receiving routes from another gateway. The
routes are updated in FIB
tables.
      I want to read This FIB table , which is declared  as a
struct fib_table *main_table .
I am able to access  and read this table.  i want  to read certain
information from this FIB table and want
to build my own forwarding  table. from this table i am reading NetID,
Netmask, and IP address of  Next Hop gateway.

IP address of  Next Hope gateway is available in fib_nh->nh_gw.  Apart from
this i also want the Mac  address of  Next Hope gateway.   so how  can i
get the MAC address for  Next Hop gateway ??

I  am able to get the pointer to Next hop device that is ,
 #define fib_dev        fib_nh[0].nh_dev

in net_device structure definition ,

#ifdef CONFIG_NET_FASTROUTE
#define NETDEV_FASTROUTE_HMASK 0xF
      /* Semi-private data. Keep it at the end of device struct. */
      rwlock_t          fastpath_lock;
      struct dst_entry  *fastpath[NETDEV_FASTROUTE_HMASK+1];
#endif

 There is a dst_entry in which the hh_cache * is stored .
But the  struct dst_entry     *fastpath[NETDEV_FASTROUTE_HMASK+1];  is null
.
even  CONFIG_NET_FASTROUTE is configured.

So what could be the reason for that??


or  is there any other way to get the MAC address for  Next Hop gateway ??
I know one way is to Do
ARP. But doing ARP would slow down the process.

Any help or link on this is Appreciated.







Cheers,
Mahesh Pujara

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA07599
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 Jan 2001 03:27:45 -0700
Received: (from andyh@localhost)
	by shell.cyberus.ca (8.9.3/666/Cyberus Online Inc.) id FAA07151
	for parisc-linux@thepuffingroup.com; Fri, 12 Jan 2001 05:30:39 -0500 (EST)
From: Andrew Hollbach <andyh@shell.cyberus.ca>
Message-Id: <200101121030.FAA07151@shell.cyberus.ca>
To: parisc-linux@thepuffingroup.com
Date: Fri, 12 Jan 2001 05:30:39 -0500 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] netlink ?
List-ID: <linux-parisc.vger.kernel.org>

Have got a very recent CVS kernel up and running on a 712/60
and want to use it for messing with the Linux IP advanced router
capabilities.

kernel .config has netlink and rtlink set, but ls -l /proc/net shows
no sign of netlink (compared to i386 which does) and iproute2 ip
reports:

ip a l
Cannot open netlink socket: Address family not supported by protocol

/var/log contents are not much use.

Can anyone help me understand why this doesn't just work right out
of the box :)

thanks much, Andy


extract of .config  ...

# Networking options
# 
CONFIG_PACKET=y
# CONFIG_PACKET_MMAP is not set
CONFIG_NETLINK=y
CONFIG_RTNETLINK=y
CONFIG_NETLINK_DEV=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_DEBUG is not set
CONFIG_FILTER=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_RTNETLINK=y
CONFIG_NETLINK=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_FWMARK=y
CONFIG_IP_ROUTE_NAT=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_TOS=y
CONFIG_IP_ROUTE_VERBOSE=y

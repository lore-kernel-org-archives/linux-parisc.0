From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] PPPOE with BL180
Date: Mon, 10 Jan 2005 07:36:13 -0600
Message-ID: <200501100736.13937.mszick@wolfbutter.com>
References: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun January 9 2005 17:00, Dany Joly wrote:
>
Which ethernet port is the modem connected to?
Is the modem setup as a bridge or is it also doing PPPoE?

Note:

> Nov  9 03:16:38 mammoth pppd[392]: local  IP address 67.70.77.230
> Nov  9 03:16:38 mammoth pppd[392]: remote IP address 64.230.254.187
> Nov  9 03:16:38 mammoth pppd[392]: primary   DNS address 206.47.244.89
> Nov  9 03:16:38 mammoth pppd[392]: secondary DNS address 206.47.244.133
>
- - - -
> mammoth:/home/dany# ifconfig
> eth0      Link encap:Ethernet  HWaddr 00:60:B0:D0:45:CD
>           inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
- - - -
> 
> eth1      Link encap:Ethernet  HWaddr 00:20:18:55:97:37
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
- - - -
> 
> ppp0      Link encap:Point-to-Point Protocol
>           inet addr:67.70.77.230  P-t-P:64.230.254.187  Mask:255.255.255.255
>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
- - - -
>
> mammoth:/tmp# route -n -F
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use 
> Iface
> 64.230.254.187  0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
> 192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
> 0.0.0.0         64.230.254.187  0.0.0.0         UG    0      0        0 ppp0
> 
- - - - 
> /usr/sbin/pppd call dsl-provider
> root       393  0.0  0.0  1548  560 ?        S    03:16   0:00 
> /usr/sbin/pppoe -I eth1 -T 80 -m 1452
- - - -

eth1 ?  
Some modems expect the interface to have an address assigned.

Modem must be on eth1 - since PPPoE is up and running.
ppp is up and running - since it got the addresses and DNS.
Default route is to ppp0 - which is as expected.

Can you ping the nameservers?

In addition to trying a newer (fixed) ppp - check for the
modem still configured to do PPPoE.

The above outputs presume that the modem is configured
as a bridge.  
(a)dsl modems usually ship with PPPoE enabled.
If you are using a modem supplied by Bell Canada, it probably
also shipped with PPPoE enabled.

(a)dsl supports multiple sessions - the far end may be only listening
to the PPPoE session setup by the modem.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

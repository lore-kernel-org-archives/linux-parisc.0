Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id E033C4855
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 10:17:04 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1AWIoh-0005Qb-00
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 18:17:03 +0100
Date: Tue, 16 Dec 2003 18:17:02 +0100
Message-ID: <3FB265EC00015040@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.6.0-test11-pa6: 2d nic tulip pb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I recompile 2.6.0-test11-pa6 in 32bit with gcc-3.3 (lastest unstable debian
available today) and the .config from 'make defconfig'.

It boot fine on b180 and b2k but on this last one there is an additonal nic
of tulip model:
# lspci
00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43
(rev 41)
00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560 IDE
(rev 03)
00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev
01)
00:0e.2 USB Controller: National Semiconductor Corporation USB Controller
(rev 02)
00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a (rev 01)
01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
01:01.0 VGA compatible controller: ATI Technologies Inc Rage XL (rev 27)
01:02.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43
(rev 41)
01:03.0 SCSI storage controller: LSI Logic / Symbios Logic 53c875 (rev 26)
01:04.0 Network controller: Eicon Technology Corporation EiconCard P92

but failled to configure (it was well when runing 2.4)
# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:30:D3:01:5A:3B  
          inet addr:172.16.248.45  Bcast:172.16.248.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:185 errors:1 dropped:0 overruns:0 frame:0
          TX packets:74 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:15144 (14.7 KiB)  TX bytes:9785 (9.5 KiB)
          Interrupt:66 Base address:0xf00 

eth1      Link encap:Ethernet  HWaddr 00:30:6E:06:23:D0  
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:130 Base address:0x2100 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:68 errors:0 dropped:0 overruns:0 frame:0
          TX packets:68 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:4720 (4.6 KiB)  TX bytes:4720 (4.6 KiB)

Any idea?

Thanks,
    Joel

PS: Just in case here is my /etc/network/interfaces
# The loopback interface
auto lo
iface lo inet loopback

# The first network card - this entry was created during the Debian installation
# (network, broadcast and gateway are optional)
#auto eth0 eth1
auto eth0
iface eth0 inet static
        address 172.16.248.45
        netmask 255.255.255.0
        network 172.16.248.0
        broadcast 172.16.248.255
        gateway 172.16.248.240

iface eth1 inet static
        address 172.16.250.47
        netmask 255.255.255.0
        network 172.16.250.0
        broadcast 172.16.250.255




-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr

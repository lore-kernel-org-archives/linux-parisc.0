Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id A41854838
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Mar 2004 16:46:00 -0700 (MST)
Message-ID: <405CD7B7.6090007@tiscali.be>
Date: Sat, 20 Mar 2004 23:45:59 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] 2.6.5-rc1-pa1 hung on C110
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I just rebuild 2.6.5-rc1-pa1 kernel on my c110 with b180 config (minus hil kbd and mouse support).

Unfortunately it hung during boot at:
[snip]
EXT3 FS on md5, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sdb9, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda9, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
/dev/md0 on /boot type ext3 (rw)
/dev/md3 on /var type ext3 (rw)
/dev/md4 on /tmp type ext3 (rw)
/dev/md5 on /home type ext3 (rw)
/dev/sdb9 on /Debian-apt type ext3 (rw)
/dev/sda9 on /Sources type ext3 (rw)
Cleaning /tmp /var/run /var/lock.
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces...

I toc the system and parse the pim (not yet called piminfo on c110 :))which give me the following result:
[snip]
GR[02] == rp = 0xf00556fc

Func: _end, Off: 0xdfbc7a94, Addr: 0xf00556fc

[snip]
IIA Offset                   = 0x10261878
...

e.g. IAOQ = 0x10261878

Parse IAOQ = 0x10261878 for CPU[0]

Func: ncr_reset_scsi_bus, Off: 0x150, Addr: 0x10261878

10261870:	00 16 18 60 	mtsm r22
10261874:	d2 a3 1b f8 	extrw,u r21,31,8,r3
10261878:	34 06 00 04 	ldi 2,r6
1026187c:	d6 c3 0a 3f 	depw,z r3,14,1,r22

Any idea?
(is it to put in relation with previous pb of panic with 2.6.4-pa2 of previous week:
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-March/022569.html?)

Thanks in advance,
	Joel

PS: the last operational 2.6 is a 2.6.3-rc1-pa3

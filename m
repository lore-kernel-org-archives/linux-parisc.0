From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] CONFIG_DISCONTIGMEM, try 2
Date: Wed, 7 Jul 2004 17:24:37 +0200
Message-ID: <40BD9F05000174EE@ocpmta1.freegates.net>
References: <20040706071459.GA567@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: "Randolph Chung" <randolph@tausq.org>,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040706071459.GA567@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


hello randolph,

> ok, attached is a 2nd version of the patch, with some of the bugs
> identified by Grant and Joel fixed. All the memory is now identified as=

> available on boot,...

For the n4k with 4Gb of ram that works fine:
patst006:~# cat /proc/meminfo 
MemTotal:      4116168 kB
MemFree:       4053704 kB
Buffers:          3700 kB
Cached:          25084 kB
SwapCached:          0 kB
Active:          23620 kB
Inactive:        15420 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:      4116168 kB
LowFree:       4053704 kB
SwapTotal:      250872 kB
SwapFree:       250872 kB
Dirty:              60 kB
Writeback:           0 kB
Mapped:          19192 kB
Slab:             7840 kB
Committed_AS:    20552 kB
PageTables:       1080 kB
VmallocTotal:   245728 kB
VmallocUsed:       184 kB
VmallocChunk:   245544 kB

#top
top - 15:25:22 up 42 min,  2 users,  load average: 0.08, 0.15, 0.36
Tasks:  55 total,   1 running,  54 sleeping,   0 stopped,   0 zombie
Cpu(s):  1.0% us,  2.3% sy,  0.0% ni, 90.5% id,  0.3% wa,  0.0% hi,  5.9%=

si
Mem:   4116168k total,    62400k used,  4053768k free,     3624k buffers
Swap:   250872k total,        0k used,   250872k free,    25084k cached

And no more any warning to build modules :) :)

Unfortunately still panic on the b2k with only 256Mb of RAM (at exactely
the same place as previously mentioned)
Don't hesitate to let me know what you need more for this pb.

Joel




-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

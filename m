From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PATCH/RFC: discontig mem support for hppa
Date: Mon, 5 Jul 2004 14:46:54 +0200
Message-ID: <40BD9F8700015C52@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: parisc-linux@parisc-linux.org
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

Randolph,

>
> sorry about that.
Don't worry :)

> try this one instead.
>
That compiles fine now ;) (with my c110 config)

I also test on n4k with 4Gb of ram and seems to works:
# cat /proc/meminfo
MemTotal:      4194548 kB
MemFree:       1994952 kB
Buffers:          3712 kB
Cached:          25784 kB
SwapCached:          0 kB
Active:          22864 kB
Inactive:        15808 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:      4194548 kB
LowFree:       1994952 kB
SwapTotal:      250872 kB
SwapFree:       250872 kB
Dirty:             532 kB
Writeback:           0 kB
Mapped:          18104 kB
Slab:             7524 kB
Committed_AS:    15968 kB
PageTables:        984 kB
VmallocTotal:   245728 kB
VmallocUsed:       268 kB
VmallocChunk:   245388 kB

:)

Any way as you noticed a part seems to be view as 'used' by top:
top - 11:58:41 up 19 min,  1 user,  load average: 0.16, 0.17, 0.18
Tasks:  51 total,   1 running,  50 sleeping,   0 stopped,   0 zombie
Cpu(s):  1.3% us,  1.7% sy,  0.0% ni, 91.1% id,  0.0% wa,  0.0% hi,  6.0%=

si
Mem:   4194548k total,  2200236k used,  1994312k free,     3756k buffers
Swap:   250872k total,        0k used,   250872k free,    25844k cached
[...]

(Just after a reboot, before there are only about 50Mb of used mem?)

But I also encounter a weird pb after the build and the install of severa=
ll
modules:
WARNING: /lib/modules/2.6.7-pa7/build/net/sunrpc/sunrpc.ko needs unknown
symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/net/sunrpc/auth_gss/auth_rpcgss.ko
needs unknown symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/net/sunrpc/auth_gss/auth_rpcgss.ko
needs unknown symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/net/core/pktgen.ko needs unknown sy=
mbol
node_data
WARNING: /lib/modules/2.6.7-pa7/build/fs/xfs/xfs.ko needs unknown symbol
pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/fs/xfs/xfs.ko needs unknown symbol
node_data
WARNING: /lib/modules/2.6.7-pa7/build/fs/nfs/nfs.ko needs unknown symbol
node_data
WARNING: /lib/modules/2.6.7-pa7/build/fs/jfs/jfs.ko needs unknown symbol
pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/fs/jfs/jfs.ko needs unknown symbol
node_data
WARNING: /lib/modules/2.6.7-pa7/build/drivers/scsi/qlogicfc.ko needs unkn=
own
symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/drivers/scsi/qlogicfc.ko needs unkn=
own
symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/drivers/scsi/qla1280.ko needs unkno=
wn
symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/drivers/scsi/qla1280.ko needs unkno=
wn
symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/drivers/scsi/qla2xxx/qla2xxx.ko nee=
ds
unknown symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/drivers/scsi/qla2xxx/qla2xxx.ko nee=
ds
unknown symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/drivers/net/acenic.ko needs unknown=

symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/drivers/net/acenic.ko needs unknown=

symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/drivers/net/wireless/airo.ko needs
unknown symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/drivers/net/wireless/airo.ko needs
unknown symbol node_data
WARNING: /lib/modules/2.6.7-pa7/build/crypto/tcrypt.ko needs unknown symb=
ol
pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/build/crypto/tcrypt.ko needs unknown symb=
ol
node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/fs/xfs/xfs.ko needs unknown symbol=

pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/fs/xfs/xfs.ko needs unknown symbol=

node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/fs/nfs/nfs.ko needs unknown symbol=

node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/fs/jfs/jfs.ko needs unknown symbol=

pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/fs/jfs/jfs.ko needs unknown symbol=

node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/net/core/pktgen.ko needs unknown
symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/net/sunrpc/sunrpc.ko needs unknown=

symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko=

needs unknown symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko=

needs unknown symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/crypto/tcrypt.ko needs unknown sym=
bol
pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/crypto/tcrypt.ko needs unknown sym=
bol
node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/scsi/qlogicfc.ko needs unk=
nown
symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/scsi/qlogicfc.ko needs unk=
nown
symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/scsi/qla2xxx/qla2xxx.ko ne=
eds
unknown symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/scsi/qla2xxx/qla2xxx.ko ne=
eds
unknown symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/scsi/qla1280.ko needs unkn=
own
symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/scsi/qla1280.ko needs unkn=
own
symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/net/wireless/airo.ko needs=

unknown symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/net/wireless/airo.ko needs=

unknown symbol node_data
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/net/acenic.ko needs unknow=
n
symbol pfnnid_map
WARNING: /lib/modules/2.6.7-pa7/kernel/drivers/net/acenic.ko needs unknow=
n
symbol node_data

any idea?

(I read a similar pb http://lists.parisc-linux.org/pipermail/parisc-linux=
/2004-February/022418.html
but don't find the fix :( )

( I trust you can can safely comit :)

hth,
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

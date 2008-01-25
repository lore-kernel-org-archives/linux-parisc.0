From: "rubisher" <rubisher@scarlet.be>
Subject: Re: 'Trace patches test' [Was: ccio_clear_io_tlb() and __raw_write()
	more question?]
Date: Fri, 25 Jan 2008 11:19:27 +0100
Message-ID: <JV73CF$6B162801D4BC7B6A71EAE5FBFAB2528F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	"rubisher" <rubisher@scarlet.be>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Jan 22, 2008 at 02:35:21PM +0100, rubisher wrote:
> > Btw, a while back, I dream to use relayfs to grab debug info.
> >
(<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/053237.html>)
> > 
> > Somebody else write it:
> > <http://lkml.org/lkml/2007/11/13/208>
> > 
> > Obviously, I have to instrument things manually but I test it succesfully.
> > Here is already some primarily data test:
> > [snip]
> > :1201001199222127606:ccio_map_single_1:ccio_map_single() 0x1eb91896 ->
> > 0x63b4896 size: 0x1000
> > :1201001199222203288:ccio_map_single_2: pdir 1fcb1da0 038100000eb91017
> > :1201001199222391065:ccio_map_single_1:ccio_map_single() 0x1febc096 ->
> > 0x63b5096 size: 0x1000
> ...
> > Exciting results?
> 
> Yes! Nice!
> 
> > (just what would give me DEBUG_RUN() printk() but without
> >  degrading system performance)
> 
> I don't believe that. :)
> Measure the CPU utilization and/or compare pktgen performance with
> and without the tracing compiled into the kernel.
> 
Having no clue about pktgen, I have a look and rebuild kernels with this
option and here are some results:
I use a pktgen-single script like:
#!/bin/sh
# "Simply" config: run single port.

#modprobe pktgen

function pgset() {
    local result

    echo $1 > $PGDEV

    result=`cat $PGDEV | fgrep "Result: OK:"`
    if [ "$result" = "" ]; then
         cat $PGDEV | fgrep Result:
    fi
}

# On UP systems only one thread exists -- so just add devices 
# We use eth1, eth2

echo "Adding devices to run". 

# eth0 interrupts on CPU0
PGDEV=/proc/net/pktgen/kpktgend_0
pgset "rem_device_all" 
pgset "add_device eth0" 
pgset "max_before_softirq 10000"

# Configure the individual devices
echo "Configuring devices"

PGDEV=/proc/net/pktgen/eth0

pgset "clone_skb 5000000" 
pgset "min_pkt_size 60" 
pgset "max_pkt_size 60" 
pgset "dst 10.24.252.109" 
pgset "dst_mac 00:50:04:1B:2C:17"
pgset "count 5000000"

# Time to run

PGDEV=/proc/net/pktgen/pgctrl

echo "Running... ctrl^C to stop"

pgset "start" 

# cat /proc/net/pktgen/eth? | fgrep Result
=== <> ===

And grab following results:
# With Kernel including ccio_trace_marker but ccio_trace module not running
Params: count 5000000  min_pkt_size: 60  max_pkt_size: 60
     frags: 0  delay: 0  clone_skb: 5000000  ifname: eth0
     flows: 0 flowlen: 0
     queue_map_min: 0  queue_map_max: 0
     dst_min: 10.24.252.109  dst_max: 
     src_min:   src_max: 
     src_mac: 08:00:09:d2:89:15 dst_mac: 00:50:04:1b:2c:17
     udp_src_min: 9  udp_src_max: 9  udp_dst_min: 9  udp_dst_max: 9
     src_mac_count: 0  dst_mac_count: 0
     Flags: 
Current:
     pkts-sofar: 455759  errors: 0
     started: 1201169852886722us  stopped: 1201169912731117us idle: 217617us
     seq_num: 455760  cur_dst_mac_offset: 0  cur_src_mac_offset: 0
     cur_saddr: 0xa18fc16  cur_daddr: 0xa18fc6d
     cur_udp_dst: 9  cur_udp_src: 9
     cur_queue_map: 0
     flows: 0
Result: OK: 59844395(c59626778+d217617) usec, 455759 (60byte,0frags)
  7615pps 3Mb/sec (3655200bps) errors: 0

# With Kernel including ccio_trace_marker and ccio_trace module running
Params: count 5000000  min_pkt_size: 60  max_pkt_size: 60
     frags: 0  delay: 0  clone_skb: 5000000  ifname: eth0
     flows: 0 flowlen: 0
     queue_map_min: 0  queue_map_max: 0
     dst_min: 10.24.252.109  dst_max: 
     src_min:   src_max: 
     src_mac: 08:00:09:d2:89:15 dst_mac: 00:50:04:1b:2c:17
     udp_src_min: 9  udp_src_max: 9  udp_dst_min: 9  udp_dst_max: 9
     src_mac_count: 0  dst_mac_count: 0
     Flags: 
Current:
     pkts-sofar: 138863  errors: 0
     started: 1201170611403245us  stopped: 1201170675285642us idle: 4334664us
     seq_num: 138864  cur_dst_mac_offset: 0  cur_src_mac_offset: 0
     cur_saddr: 0xa18fc16  cur_daddr: 0xa18fc6d
     cur_udp_dst: 9  cur_udp_src: 9
     cur_queue_map: 0
     flows: 0
Result: OK: 63882397(c59547733+d4334664) usec, 138863 (60byte,0frags)
  2173pps 1Mb/sec (1043040bps) errors: 0

# With Kernel without ccio_trace_marker
Params: count 5000000  min_pkt_size: 60  max_pkt_size: 60
     frags: 0  delay: 0  clone_skb: 5000000  ifname: eth0
     flows: 0 flowlen: 0
     queue_map_min: 0  queue_map_max: 0
     dst_min: 10.24.252.109  dst_max: 
     src_min:   src_max: 
     src_mac: 08:00:09:d2:89:15 dst_mac: 00:50:04:1b:2c:17
     udp_src_min: 9  udp_src_max: 9  udp_dst_min: 9  udp_dst_max: 9
     src_mac_count: 0  dst_mac_count: 0
     Flags: 
Current:
     pkts-sofar: 474350  errors: 0
     started: 1201243919209991us  stopped: 1201243981190756us idle: 188937us
     seq_num: 474351  cur_dst_mac_offset: 0  cur_src_mac_offset: 0
     cur_saddr: 0xa18fc16  cur_daddr: 0xa18fc6d
     cur_udp_dst: 9  cur_udp_src: 9
     cur_queue_map: 0
     flows: 0
Result: OK: 61980765(c61791828+d188937) usec, 474350 (60byte,0frags)
  7653pps 3Mb/sec (3673440bps) errors: 0

I am not sure how to read those results so I also do some ftp and grab
following data:

# With Kernel including ccio_trace_marker but ccio_trace module not running
ftp> put linux-2.6.24-rc4-pa-git-20071206.tar.bz2
local: linux-2.6.24-rc4-pa-git-20071206.tar.bz2 remote:
linux-2.6.24-rc4-pa-git-20071206.tar.bz2
200 PORT command successful.
150 Opening BINARY mode data connection for
'linux-2.6.24-rc4-pa-git-20071206.tar.bz2'.
226 Transfer complete.
47631536 bytes sent in 54.42 secs (854.8 kB/s)

# With Kernel including ccio_trace_marker and ccio_trace module running
ftp> put linux-2.6.24-rc4-pa-git-20071206.tar.bz2
local: linux-2.6.24-rc4-pa-git-20071206.tar.bz2 remote:
linux-2.6.24-rc4-pa-git-20071206.tar.bz2
200 PORT command successful.
150 Opening BINARY mode data connection for
'linux-2.6.24-rc4-pa-git-20071206.tar.bz2'.
226 Transfer complete.
47631536 bytes sent in 59.26 secs (784.9 kB/s)

# With kernel without ccio_trace_marker
ftp> put linux-2.6.24-rc4-pa-git-20071206.tar.bz2
local: linux-2.6.24-rc4-pa-git-20071206.tar.bz2 remote:
linux-2.6.24-rc4-pa-git-20071206.tar.bz2
200 PORT command successful.
150 Opening BINARY mode data connection for
'linux-2.6.24-rc4-pa-git-20071206.tar.bz2'.
226 Transfer complete.
47631536 bytes sent in 55.66 secs (835.8 kB/s)

I agree it decrease a bit the system performance but doesn't slow it down so
much that it would take several hours to boot has printk() did to me ;-)

> However, that doesn't mean this is useless. This is alot better than
> rolling our own "light weight" tracing mechanism and it's certainly
> alot better than using printk's to debug DMA issues (as long as
> the system doesn't crash - e.g. HPMC).
> 
Yes there are limits to this method but for parisc I know so few kernel
debugging tools that I would like to mentioned here the easiness of this patch
implementation (even for a non C programmer as I ;<)

Cheers,
    r.

PS: I didn't put this code here just because all what I have wouldn't apply on
the current p-l ccio-dma.c src.


> hth,
> grant
> 
> > I still have to had some more DEBUG_RUN_SG() stuff and hope to be able to
> > collect more.
> > 
> > Cheers,
> >     r.
> > 
> > ---
> > Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> > http://www.scarlet.be/
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/

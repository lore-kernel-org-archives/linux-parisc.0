Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABBAE48E8
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 13:40:53 -0700 (MST)
Message-ID: <3F9C3154.4060105@tiscali.be>
Date: Sun, 26 Oct 2003 20:40:52 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F9BFB00.5090008@tiscali.be> <20031026172531.GA32146@colo.lackof.org>
In-Reply-To: <20031026172531.GA32146@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Grant,

Grant Grundler wrote:
> On Sun, Oct 26, 2003 at 04:49:04PM +0000, Joel Soete wrote:
> 
>>8. Raven T' Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x32, 
>>0x0, 0x8a
> 
> 
> This is a 10Mb link.
> 
Yes ;)
> 
>>And, at the office, I use to obtain around nice 1Mb/s when I do such 
>>rsync or ftp between my b180 connected via a hub.
> 
> 
> Which protocol?
> 

ftp (ncftp), rsync, scp

> 
>>But here at home, I connect the builtin nic of my c110 with a 
>>cross-cable to my pc (proxy) and I just obtain 50kb/s (whatever the 
>>kernel I boot 2.4 or 2.6) (ie 20 time less then with a another pc 
>>connected in place of the c110). Is it possible to improve the 
>>performance of this builtin nic?
> 
> 
> Earlier this year I exchanged email with someone on linux-ia64 list with
> a similar sounding problem. They were trying to NFS mount some exported
> by the ia64-linux server but perf was ~80KB/s vs 50MB/s (1000BT) across
> the same link to another ia64-linux box. We never found the root cause
> since netperf demonstrated the UDP throughput was > 50MB/s (expected)
> in the same config. I could only guess it was something in the NFS
> stack having to do with 16K pages.
> 

Well all kernel tested since now (2.4 or 2.6) were well configured to 
support NFS (even if exports file is empty). I can try to remove this 
support?

> But thinking about this more, I'm wondering if some kernel code is
> accessing misaligned data someplace in the networking stack.
> The arguments I've heard is this is expected behavior.
> 
> Joel,
> 1) Can you verify dmesg has no misaligned data access reports?

Unfortunately no such a messages :(

> 2) Can you clarify how you are measuring performance?
>    (ie which protocols and which tools?)

what ever the protocol I use (ftp, rsync, scp) they report their own 
stat which are very low and correspond to the results of gkrellm (iptraf 
seems to lock the trafic).

hm another strange thing: I just compressed the my last kernel 2.4 
sources (about 30Mb) and on my pc I get it with scp from the c110: scp 
and gkrellm showing a rate of about 150Kb/s. Then remove the file on the 
c110 and on this i grab the same file with scp (also) and this time scp 
amd gkrellm showing  togehter a rate a about 50Kb/s. That is get now put 
show same results (i mean on pc put to c110: rate about 50Kb/s; on c110 
put to pc: rate about 150Kb/s).

That say. I also try to re-do the same test with ncftp which seems to 
show the same results excepted that 'put' from c110 to pc 'stail' after 
only one hundred Kb (and I installed the same ftp server on each ie:
ii  ftpd           0.17-16        FTP server
ii  tftpd          0.17-10        Internet trivial file transfer 
protocol serv).



> 3) Can you setup/run netperf or httperf with the PC to verify whatever
>    protocol you are using basically works?

I try to install the non-free (?) dpkg on my pc but:
sid:/home/jso/work # netperf -t UDP_STREAM
UDP UNIDIRECTIONAL SEND TEST to localhost
udp_send: data send error: Message too long
sid:/home/jso/work # netperf -t UDP_STREAM -f m
UDP UNIDIRECTIONAL SEND TEST to localhost
udp_send: data send error: Message too long
sid:/home/jso/work # netperf -t TCP_RR
TCP REQUEST/RESPONSE TEST to localhost
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate
bytes  Bytes  bytes    bytes   secs.    per sec

16384  87380  1        1       9.99     15980.06
16384  87380
sid:/home/jso/work # netperf -t UDP_RR
UDP REQUEST/RESPONSE TEST to localhost
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate
bytes  Bytes  bytes    bytes   secs.    per sec

65535  65535  1        1       10.00    27145.26
65535  65535

hmm may be should I try to rebuild the very last src (from hp).
More over the pkg is not available for parisc but I trust it would just 
be rebuild for this platform?

(i just haven't enough time to do it right now, sorry)

The few I can let iptraf running it didn't show's me any udp trafic :(
  Statistics for eth1
Total:     5350    4077724        2411     459794        2939    3617930
IP:        5350    4002824        2411     426040        2939    3576784
TCP:       5350    4002824        2411     426040        2939    3576784
UDP:          0          0           0          0           0          0
ICMP:         0          0           0          0           0          0
Other IP:     0          0           0          0           0          0
Non-IP:       0          0           0          0           0          0


Thanks for help,
	Joel

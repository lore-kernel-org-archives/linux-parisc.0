Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id DBB724879
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 05:54:04 -0700 (MST)
Message-ID: <3FB0DC01.6070701@tiscali.be>
Date: Tue, 11 Nov 2003 12:54:25 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org>
In-Reply-To: <20031110173525.GC24664@colo.lackof.org>
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


Grant Grundler wrote:
> On Mon, Nov 10, 2003 at 03:00:37PM +0100, Joel Soete wrote:
> 
>>                        if (pkt_len > rx_copybreak) {
>>                                struct sk_buff *newskb;
> 
> 
> yup - the rx_copybreak support is exactly what I'm talking about.
> tulip driver has similar support.
> 
> 
>>/* Copy frames shorter than rx_copybreak, otherwise pass on up in
>> * a full sized sk_buff.  Value of 100 stolen from tulip.c (!alpha).
>> */
>>static int rx_copybreak = 100;
> 
> 
> The comment is wrong. Tulip uses 1518 for nearly everything but x86.
> ie it copies all packets since the MTU is <= 1518.
> 
Correct :)

I so try rx_copybreak = 1518

and also run from pc netperf (the script 
/usr/share/doc/netperf/examples/snapshot_script palin)

but on c110 I noticed many (with rx_copybreak = 100 and rx_copybreak = 
1518):
do_page_fault() pid=882 command='netserver' type=15 address=0x0000001c
...
:(

and i never get any miss alignement messages?

I restart this test this morning but in the contrary way ie from c110:
sh /usr/share/doc/netperf/examples/snapshot_script sid.home
then
Netperf snapshot script started at Tue Nov 11 12:52:15 CET 2003
Starting 56x4 TCP_STREAM tests at Tue Nov 11 12:52:52 CET 2003

------------------------------------
Testing with the following command line:
/usr/bin/netperf -t TCP_STREAM -l 60 -H sid.home -i 10,3 -I 99,5 -- -s 
57344 -S 57344 -m 4096


seems to send some pkt and finaly hung?

hmm I will try to run it under gdb and so hope to discover what append.

Cheers,
	Joel

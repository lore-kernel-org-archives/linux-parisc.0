From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] a b180 panic with 2.6.11-rc3-pa3
Date: Fri, 18 Feb 2005 09:16:49 +0100
Message-ID: <420B30A200003495@mail-1-bnl.tiscali.it>
References: <20050216201417.737f4c40@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: List Parisc <parisc-linux@lists.parisc-linux.org>
To: "Thibaut VARENE" <T-Bone@parisc-linux.org>,
 "Max Grabert" <parisc@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050216201417.737f4c40@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

...
> > 
> > > [<101bb588>] journal_add_journal_head+0xdc/0x13c
> > > [<101b4dd8>] journal_dirty_data+0x64/0x1b0
> > > [<101a6be4>] ext3_journal_dirty_data+0x1c/0x60
> > > [<101a69a8>] walk_page_buffers+0xe0/0xf0
> > > [<101a72b8>] ext3_ordered_writepage+0x168/0x1fc
> 
> Got hit by a similar panic during the night (the kernel uptime was < 5h=
)
> 
> Kernel Fault code 15
> Top stack was:
> 
> cache_grow
> cache_alloc_refill
> kmem_cache_alloc
> journal_alloc_journal
> 
> and the rest was identical to your dump.
> 
> IAOQ was alloc_slabmgmt and gr2 was cache_grow
> 
I just come back because after a second read, it looks like the b2k pb re=
lated
here:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2005-February/02587=
0.html>

mmm hard to say if there are actualy the same?

> This was 2.6.11-rc3-pa5 freshly built with Kernel Hacking turned off.
> 
That said, today same panic (as related above) on b2k  32bit  but not on
b180 with the same 2.6.11-rc4-pa1 (cvs dated 20050217).

By chance, I can save a top info at the crash moment:
top - 06:25:27 up 16:33,  3 users,  load average: 0.91, 0.32, 0.16
Tasks:  97 total,   2 running,  95 sleeping,   0 stopped,   0 zombie
Cpu(s):  4.9% us, 13.2% sy,  4.9% ni,  0.0% id, 75.7% wa,  0.7% hi,  0.7%=

si
Mem:    252696k total,   249768k used,     2928k free,    46300k buffers
Swap:   255928k total,        0k used,   255928k free,   133572k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND    
                                                          
 9304 nobody    26  10  1816  844  644 R 14.8  0.3   0:00.89 find       
                                                           
...

The time stamp seems to tell me to look into cron daily ...

I will try to locate this 'find' task (probably locate db update) and see=

if I can reproduce ;-)

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

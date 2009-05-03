From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Kernel Panic during init with 2.6.29-gb609308 (fresh clone of git
Date: Sat, 2 May 2009 20:48:46 -0400 (EDT)
Message-ID: <20090503004846.9BBCD4FC6@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: T-Bone@parisc-linux.org, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <no.id> from "John David Anglin" at May 2, 2009 05:30:49 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> You might try building with the 4.1 branch.  I have had more luck
> with it.

I tried building 2.6.22.19 with debian 4.3.  Boot fails here:

md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Freeing unused kernel memory: <0>------------[ cut here ]------------
Badness at 000000004011e44c [verbose debug info unavailable]
Backtrace:
Backtrace:
 [<00000000401128c0>] dump_stack+0x18/0x28

Have to hit 'RS' twice.  The first time there is a hpmc in the memory test:

#  Location|Alert| Encoded Field    |  Data Field    |   Keyword / Timestamp
-------------------------------------------------------------------------------
52951  SFW  0   0  0x030010D500E00000 0000000000000000 CPU_STOP
52950  SFW  0   2  0x438010EF00E01B50 00000000FFFFFFFF MEM_UNEXPECTED_HPMC
                                                      03 May 2009 00:35:26
52949  SFW  0   0  0x160000C400E00000 0000000280000000 MEM_INIT
52948  SFW  0   0  0x370000FB00E00000 000000F000004002 MEM_WARN_INIT_ONLY

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Sun, 14 Nov 2010 21:14:12 -0500
Message-ID: <20101115021412.GA14945@hiauly1.hia.nrc.ca>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca> <20101110033527.GA24762@hiauly1.hia.nrc.ca> <20101114234212.GA20422@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101114234212.GA20422@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 14 Nov 2010, John David Anglin wrote:

> However, the system didn't fully boot.  There was another unaligned
> load in a ipv6 module.  I caught this because I still have the following
> BUG_ON in unaligned.c:

System boots 2.6.36+ without ipv6 module.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt #5
Date: Fri, 22 Sep 2006 20:41:41 -0400 (EDT)
Message-ID: <200609230041.k8N0fgHk014938@hiauly1.hia.nrc.ca>
References: <20060908184933.GA24597@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060908184933.GA24597@colo.lackof.org> from "Grant Grundler" at
	Sep 8, 2006 12:49:33 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> For the record, I 've been testing those patches on C3000 (no problems)
> B2600 (HPMC in tulip_get_stats() from LED/LCD task), and A500 (no problems).
> The C3000 (32-bit UP) and A500 (64-bit SMP) ran "make -j4" several days
> in a loop with no problems or console output.

I just saw the following message doing an "apt-get upgrade" on c2k:

tar: ./usr/share/sysvinit/inittab: time stamp 2006-09-22 20:32:05.780266 is 0.000141 s in the future

System is 2.6.18-rc7-pa1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

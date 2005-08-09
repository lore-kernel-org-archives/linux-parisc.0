From: Adrian Bunk <bunk@stusta.de>
Subject: [parisc-linux] Re: [2.6 patch] schedule obsolete OSS drivers for
	removal (version 2)
Date: Tue, 9 Aug 2005 19:49:06 +0200
Message-ID: <20050809174906.GA4006__1558.8607792326$1416623911$gmane$org@stusta.de>
References: <20050729153226.GE3563@stusta.de>
	<1123607633.5601.7.camel@mindpipe>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 alsa-devel@alsa-project.org,
 Christoph Eckert <ce@christeck.de>,
 zaitcev@yahoo.com,
 James@superbug.demon.co.uk,
 Thorsten Knabe <linux@thorsten-knabe.de>,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 kyle@parisc-linux.org,
 parisc-linux@lists.parisc-linux.org,
 zab@zabbo.net,
 jgarzik@pobox.com,
 perex@suse.cz,
 linux-usb-devel@lists.sourceforge.net
To: Lee Revell <rlrevell@joe-job.com>,
 gregkh@suse.de,
 NAGANO Daisuke <breeze.nagano@nifty.ne.jp>,
 alan@lxorguk.ukuu.org.uk,
 sailer@ife.ee.ethz.ch
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1123607633.5601.7.camel@mindpipe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 09, 2005 at 01:13:51PM -0400, Lee Revell wrote:
> On Fri, 2005-07-29 at 17:32 +0200, Adrian Bunk wrote:
> > This patch schedules obsolete OSS drivers (with ALSA drivers that 
> > support the same hardware) for removal.
> > 
> > Scheduling the via82cxxx driver for removal was ACK'ed by Jeff Garzik.
> > 
> 
> Someone on linux-audio-user just pointed out that the OSS USB audio and
> midi modules were never deprecated, much less scheduled to be removed.
> 
> Maybe the best way to deprecate them is to move them to Sound -> OSS,
> that's where they belong anyway.

I'd deprecate them without moving them.

I'll send a patch unless someone tells that any functionality of these 
drivers is lacking in ALSA.

> Lee

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

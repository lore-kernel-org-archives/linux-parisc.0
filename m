From: Lee Revell <rlrevell@joe-job.com>
Subject: [parisc-linux] Re: [2.6 patch] schedule obsolete OSS drivers for
	removal (version 2)
Date: Tue, 09 Aug 2005 13:54:48 -0400
Message-ID: <1123610089.8210.7.camel__8434.74077196351$1416623911$gmane$org@mindpipe>
References: <20050729153226.GE3563@stusta.de>
	<1123607633.5601.7.camel@mindpipe>  <20050809174906.GA4006@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 alsa-devel@alsa-project.org,
 zab@zabbo.net,
 Christoph Eckert <ce@christeck.de>,
 zaitcev@yahoo.com,
 kyle@parisc-linux.org,
 James@superbug.demon.co.uk,
 gregkh@suse.de,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 sailer@ife.ee.ethz.ch,
 parisc-linux@lists.parisc-linux.org,
 perex@suse.cz,
 Thorsten Knabe <linux@thorsten-knabe.de>,
 NAGANO Daisuke <breeze.nagano@nifty.ne.jp>,
 jgarzik@pobox.com,
 linux-usb-devel@lists.sourceforge.net
To: Adrian Bunk <bunk@stusta.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050809174906.GA4006@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2005-08-09 at 19:49 +0200, Adrian Bunk wrote:
> I'd deprecate them without moving them.
> 

OK, I think that will still be slightly confusing becuase it comes
before Sound in the kernel config, but maybe the deprecated part will
make people think twice.

I think we should at least label these clearly as part of OSS.  Users at
least seem to know that mixing OSS and ALSA modules is bad.

> I'll send a patch unless someone tells that any functionality of these
> drivers is lacking in ALSA. 

OK.  I'm almost positive there is no functionality missing, there have
not been any reports of people needing to use the OSS driver on any of
the ALSA lists.

Lee 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

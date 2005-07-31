From: Adrian Bunk <bunk@stusta.de>
Subject: [parisc-linux] Re: [2.6 patch] schedule obsolete OSS drivers for
	removal
Date: Sun, 31 Jul 2005 21:29:29 +0200
Message-ID: <20050731192929.GG3608__20341.027089353$1416623871$gmane$org@stusta.de>
References: <20050726150837.GT3160@stusta.de>
	<105c793f050726091722f3cbb2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: alsa-devel@alsa-project.org,
 zaitcev@yahoo.com,
 zwane@commfireservices.com,
 kyle@parisc-linux.org,
 James@superbug.demon.co.uk,
 Thorsten Knabe <linux@thorsten-knabe.de>,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 sailer@ife.ee.ethz.ch,
 parisc-linux@lists.parisc-linux.org,
 zab@zabbo.net,
 jgarzik@pobox.com,
 perex@suse.cz
To: Andrew Haninger <ahaning@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <105c793f050726091722f3cbb2@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 26, 2005 at 12:17:14PM -0400, Andrew Haninger wrote:
> On 7/26/05, Adrian Bunk <bunk@stusta.de> wrote:
> >  config SOUND_OPL3SA2
> >         tristate "Yamaha OPL3-SA2 and SA3 based PnP cards"
> > -       depends on SOUND_OSS
> > +       depends on SOUND_OSS && OBSOLETE_OSS_DRIVER
> >         help
> >           Say Y or M if you have a card based on one of these Yamaha sound
> >           chipsets or the "SAx", which is actually a SA3. Read
> Forgive me if I'm misreading this (I'm hardly a coder and no kernel
> hacker) but, as it stands, the OPL3SA2 driver provided by ALSA and the
> main kernel tree work but are not correctly detected by ALSA's
> detection routines (in alsaconf) on the 2.6 kernel. The OSS drivers
> work, as well, but (AFAIK) there are no methods of automatic
> configuration with the OSS drivers.
> 
> So, for people who don't feel like configuring ALSA with their OPL3SA2
> card, the OSS modules may be easier to configure and thus should be
> left in until the ALSA/2.6 kernel problems are worked out with the
> OPL3SA2.

This is kernel bug #3117 [1] / ALSA bug #879 [2]?

> -Andy

cu
Adrian

[1] http://bugzilla.kernel.org/show_bug.cgi?id=3117
[2] https://bugtrack.alsa-project.org/alsa-bug/view.php?id=879

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Lee Revell <rlrevell@joe-job.com>
Subject: [parisc-linux] Re: [2.6 patch] schedule obsolete OSS drivers for
	removal (version 2)
Date: Tue, 09 Aug 2005 13:13:51 -0400
Message-ID: <1123607633.5601.7.camel__44384.1938431889$1416623910$gmane$org@mindpipe>
References: <20050729153226.GE3563@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 alsa-devel@alsa-project.org,
 Christoph Eckert <ce@christeck.de>,
 zaitcev@yahoo.com,
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
To: Adrian Bunk <bunk@stusta.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050729153226.GE3563@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-07-29 at 17:32 +0200, Adrian Bunk wrote:
> This patch schedules obsolete OSS drivers (with ALSA drivers that 
> support the same hardware) for removal.
> 
> Scheduling the via82cxxx driver for removal was ACK'ed by Jeff Garzik.
> 

Someone on linux-audio-user just pointed out that the OSS USB audio and
midi modules were never deprecated, much less scheduled to be removed.

Maybe the best way to deprecate them is to move them to Sound -> OSS,
that's where they belong anyway.

Lee

On Tue, 2005-08-09 at 18:42 +0200, Christoph Eckert wrote: 
> > Recompile the kernel with USB audio support.
> 
> Please ensure that you *disable* => Devioce drivers => USB => 
> USB audio and USB Midi.
> 
> Both are OSS modules and caused a lot of trouble here when 
> used in conjunction with the ALSA module
> 
> => Sound => ALSA => USB devices => USB Audio/MIDI driver
> 
> 
> BTW: OSS is marked as deprecated, but not the two OSS modules 
> mentioned above. Couldn't this get set or at least some info 
> that these modules belong to OSS?


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

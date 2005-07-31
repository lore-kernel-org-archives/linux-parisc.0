From: James Courtier-Dutton <James@superbug.demon.co.uk>
Subject: [parisc-linux] Re: [2.6 patch] schedule obsolete OSS drivers for
	removal
Date: Sun, 31 Jul 2005 14:38:34 +0100
Message-ID: <42ECD45A.50803__42017.831587191$1416623871$gmane$org@superbug.demon.co.uk>
References: <20050726150837.GT3160@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: alsa-devel@alsa-project.org,
 zaitcev@yahoo.com,
 zwane@commfireservices.com,
 kyle@parisc-linux.org,
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
In-Reply-To: <20050726150837.GT3160@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Adrian Bunk wrote:
> This patch schedules obsolete OSS drivers (with ALSA drivers that 
> support the same hardware) for removal.
> 
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> ---
> 
> I've Cc'ed the people listed in MAINTAINERS as being responsible for one 
> or more of these drivers, and I've also Cc'ed the ALSA people.
> 

I am happy for the emu10k1 OSS driver to go.
The ALSA driver has considerably more features now.

James
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

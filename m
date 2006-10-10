From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH 562] m68k/HP300: Enable HIL configuration
	options
Date: Tue, 10 Oct 2006 21:25:01 +0200
Message-ID: <200610102125.01767.deller@gmx.de>
References: <200610092022.k99KMbtC031450@anakin.of.borg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kars de Jong <jongk@linux-m68k.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200610092022.k99KMbtC031450@anakin.of.borg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Geert,
Hi Kars,

thanks for the patch.

Just out of couriosity:
Does anyone of you still have a HP300 to test ?

Helge

On Monday 09 October 2006 22:22, Geert Uytterhoeven wrote:
> Enable HIL configuration options on HP300
> 
> Signed-Off-By: Kars de Jong <jongk@linux-m68k.org>
> Signed-Off-By: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> ---
>  keyboard/Kconfig |    4 ++--
>  misc/Kconfig     |    2 +-
>  mouse/Kconfig    |    2 +-
>  serio/Kconfig    |    2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
....
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

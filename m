From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE &
	Implement SNDCTL_DSP_CHANNELS
Date: Mon, 10 May 2004 23:24:51 -0600
Message-ID: <20040511052451.GC27478@colo.lackof.org>
References: <20040222092057.GA2590@calypso> <20040223035601.GA988@calypso>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Stuart Brady <sdbrady@ntlworld.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040223035601.GA988@calypso>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 23, 2004 at 03:56:01AM +0000, Stuart Brady wrote:
> On Sun, Feb 22, 2004 at 09:20:57AM +0000, Stuart Brady wrote:
> 
> > +				if (put_user(ival, (int *) arg))
> > +					return -EFAULT;
> 
> I've been looking at the specification, I think this should have been:
...

Hi Stuart,
Sorry for taking so long with this...I was expecting someone else
to reply and maybe missed it. A couple of minor problems with
your patch:

1) it's for 2.4 and I'm personally trying to focus on 2.6 tree now.
   2.6 is ready for prime time. It's been my desktop/ftp/http server
   (C3600) for the past couple of monthes and has proven very stable.

2) OSS is "decprecated" according to the 2.6 sound/Kconfig "Help".
   Ie use ALSA instead.  See SOUND_PRIME option.

3) if no one else wants to poke at the 2.4 harmony driver, I will
   just apply your patches on good faith that it builds/works for you.
   Have you tweaked it more since Feb?

In 2.6, ALSA harmony driver does NOT compile and that's disappointing.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

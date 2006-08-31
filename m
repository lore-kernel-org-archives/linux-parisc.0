From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] gettimeofday() issue on D270
Date: Thu, 31 Aug 2006 15:03:01 -0400
Message-ID: <119aab440608311203o181a7c87p378b2fd60e1080d5@mail.gmail.com>
References: <20060827151741.fe94122d.gmsoft@tuxicoman.be>
	<119aab440608271231j3856ea27h7c03e1c9722ae7e1@mail.gmail.com>
	<20060827222653.3f3ef48d.gmsoft@tuxicoman.be>
	<20060830235805.GJ3926@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Guy Martin <gmsoft@tuxicoman.be>,
 parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060830235805.GJ3926@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/30/06, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sun, Aug 27, 2006 at 10:26:53PM +0200, Guy Martin wrote:
> > I wasn't able to reproduce at all on my C3600.
>
> Is your C3600 running a 64bit kernel?

No, I purposely run a 32-bit kernel for testing.

> CR16 is 4294967296 times bigger on a 64bit kernel, whereas
> the clockspeed of your C3600 is only about 4x faster...

Uh? I don't quite grok what you mean there.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

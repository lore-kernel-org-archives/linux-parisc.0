From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] gettimeofday() issue on D270
Date: Wed, 30 Aug 2006 19:58:05 -0400
Message-ID: <20060830235805.GJ3926@athena.road.mcmartin.ca>
References: <20060827151741.fe94122d.gmsoft@tuxicoman.be>
	<119aab440608271231j3856ea27h7c03e1c9722ae7e1@mail.gmail.com>
	<20060827222653.3f3ef48d.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060827222653.3f3ef48d.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 27, 2006 at 10:26:53PM +0200, Guy Martin wrote:
> I wasn't able to reproduce at all on my C3600.
> 

Is your C3600 running a 64bit kernel?

CR16 is 4294967296 times bigger on a 64bit kernel, whereas
the clockspeed of your C3600 is only about 4x faster...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

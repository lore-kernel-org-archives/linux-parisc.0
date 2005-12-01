From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] FLT CBFB on B1000 when accessing second graphics
	card
Date: Thu, 1 Dec 2005 00:25:07 -0500
Message-ID: <20051201052507.GB30663@tachyon.int.mcmartin.ca>
References: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Thomas Klinger <th.klinger@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 30, 2005 at 03:21:17PM +0100, Thomas Klinger wrote:
> Now, the setup and everything else went through smoothly, even the
> first setup of the X server using the original display card went
> pretty fine, but only with 8-bit colors. That's why we built in the
> Matrox card. It is recognized by the system and displayed using lspci.
>

> What comes now is that if we try to start the X server using the
> second card the system switches the card and immediatly fails with the
> error code FLT CBFB (shown in the front LCD display).
>

You need to post your Xorg.conf or whatever it's called nowadays.
 
> I posted the symptom to debian-hppa and was then forwared by Grant
> Grundler to this mailing list to post my concern.
> 
> The goal of the system is to boot the system with the original card
> (as is does already), but use the secondary card (Matrox in that case)
> as display for the desktop environment in 16-bit colors, at least.
>

This will probably work provided you use the matroxfb framebuffer, with
the "fbdev" driver of X. Anything else is almost guaranteed to fail with
an HPMC. Specifics are explained in the graphics FAQ.
 
> A Data I/O Fetch Timeout occured while CPU 0 was
> requesting information from a device with the address 0xfff9017ff1.
>

Somebody did something it shouldn't've.

Cheers,
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

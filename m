From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Thu, 23 Mar 2006 07:46:37 +0100
Message-ID: <200603230746.37433.deller@gmx.de>
References: <200603222349.k2MNnoxd028375@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603222349.k2MNnoxd028375@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 23 March 2006 00:49, John David Anglin wrote:
> > > That's why I said I need to fix STIfb.... :-)
> > 
> > It's fixed now in CVS (2.6.16-pa2).
> > Even X11 on stifb with 64bit kernel works...
> 
> Did this bug also affect 32bit kernels?  The reason I ask is I
> had to back out using 2.6.16-pa0 on my c3k.  The most obvious
> symptoms were fsck failures on reboot, iptables error messages
> and unreliable behavior of gnome teminal.

The fixes I did was only related to virtually-mapped vs. physically-addressed memory regions.
So I don't think I changed anything special for a 32bit kernel if you didn't set CONFIG_HPPA_IOREMAP.

But I did booted yesterday the latest CVS 32bit Kernel on my c3k and it worked fine, so I assume you shouldn't see any problems either...

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

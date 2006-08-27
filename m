From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] What happen to the Penguin
Date: Sun, 27 Aug 2006 17:21:43 -0400 (EDT)
Message-ID: <200608272121.k7RLLh0F018554@hiauly1.hia.nrc.ca>
References: <20060630184210.GE27102@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060630184210.GE27102@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Jun 30, 2006 02:42:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Jun 26, 2006 at 07:59:31PM -0400, John David Anglin wrote:
> > I haven't been able to boot recent consoles of my c3k (oh, I did
> > accidently boot a 64-bit kernel built for an A500 without frame
> > buffer support).  The last build that successfully boots is
> > 2.6.17-rc3-pa3.  The last messages that is see are:
> > 
> <snip...>
> > Any ideas as to what's broken in later kernels?
> > 
> 
> Apparently there has been some changes to the way VTs are handled,
> as I saw someone else complaining about this in a completely
> unrelated place. I'll take a look into it at some point this weekend.

This happened between 2.6.17-rc3-pa3 and 2.6.17-rc4-pa0.  Removing
the unsupported A1262A allowed 2.6.17-pa6 to boot.  It doesn't boot
with the card installed.  This is using the c3000_defconfig kernels.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

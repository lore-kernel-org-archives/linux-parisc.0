From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Sat, 16 Dec 2006 22:17:32 +0100
Message-ID: <200612162217.33074.deller__21708.0192910091$1416624234$gmane$org@gmx.de>
References: <200612162110.kBGLAiiX013928@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612162110.kBGLAiiX013928@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 16 December 2006 22:10, John David Anglin wrote:
> > > If not, maybe you could try my (ugly & temporary) kernel patch from http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/030967.html ?
> > 
> > I'll give it a try.
> 
> I get a bunch of messages like:
> WARNING: "show_stack" [net/ipv6/ipv6.ko] undefined!

disable ipv6 for now... The problem is show_stack() in access_ok().
I don't use modules atm.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

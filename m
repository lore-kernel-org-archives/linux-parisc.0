From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Thu, 21 Dec 2006 02:10:19 +0100
Message-ID: <200612210210.19708.deller__4345.86237320236$1416624237$gmane$org@gmx.de>
References: <200612202242.kBKMg8sD022756@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612202242.kBKMg8sD022756@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 20 December 2006 23:42, John David Anglin wrote:
> > > FAIL: 22_locale/time_get/get_date/wchar_t/4.cc execution test
> > > 
> > > which may be a kernel problem since the fail doesn't occur using
> > > a 64-bit kernel.  The test also doesn't fail under hpux, so it's
> > > not likely a compilation issue.  The problem is in setting a
> > > date/time string.  Might have something to do with locale functions.
> > 
> > Can you provide an strace ?
>     ..[many lines of strace stripped]....
> 
> Don't see anything that's obvious.

Me neither.

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

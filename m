From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] tests with IDE controller ... IRQ xy: nobody cared!
Date: Wed, 9 Feb 2005 08:42:13 +0000
Message-ID: <e6eae02905020900422504d63c@mail.gmail.com>
References: <e6eae0290502082001783c3780@mail.gmail.com>
	<4208AA1B0000044B@mail-3-bnl.tiscali.it>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Linux/PA <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4208AA1B0000044B@mail-3-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 9 Feb 2005 07:34:57 +0100, Joel Soete <soete.joel@tiscali.be> wrote:
>
> For the deployement of a custom hpux 11.11 we foreseen to build an ignite
> image on a dvd (not sure that could stil stand on a cd as for previous 11.00).
> 
> The question is: what unix tool(s) would you advise me to burn those dvd
> (hpux or linux)?

For linux there are basically three backends:

1. cdrecord-ProDVD / cdrtools
   (non-GPL, ftp://ftp.berlios.de/pub/cdrecord/ProDVD/
   precompiled binaries available for non-commercial use)

2. cdrecord + DVD-patch
   (GPL, http://people.mandrakesoft.com/~warly/files/cdrtools)

3. dvd+-rw-tools / growisofs
   (GPL, http://fy.chalmers.se/~appro/linux/DVD+RW/)


As for GUIs/frontends, the most popular ones are
- k3b (recommended, www.k3b.org)
- xcdroast (www.xcdroast.org)
- nautilus-cd-burner
I can also recommend
- webCDwriter Pro (non-free: http://joerghaeger.de/webCDwriter/pro.html).
if you share DVD writer in your office with other people.

Most of these frontends use/support the dvd+rw-tools package.

Note that UDF (the 'standard' filesystem for DVDs) is still not
very well supported under linux, so most DVD burn apps use
the iso9660 filesystem instead (but that should not matter,
unless you want to burn movie-DVDs).

Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
